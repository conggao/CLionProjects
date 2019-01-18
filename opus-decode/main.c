#include <stdio.h>
#include <mem.h>
#include "include/ringbuffer.h"
#include "include/opus.h"

#define __s32 int
#define __u8  unsigned char
#define OPUS_BUFFER_MAX 300
#define FRAME_BUFFER_MAX 640

static void int_to_char(opus_uint32 i, __u8 ch[4]) {
    ch[0] = i >> 24;
    ch[1] = (i >> 16) & 0xFF;
    ch[2] = (i >> 8) & 0xFF;
    ch[3] = i & 0xFF;
}

static opus_uint32 char_to_int(unsigned char ch[4]) {
    return ((opus_uint32) ch[0] << 24) | ((opus_uint32) ch[1] << 16)
           | ((opus_uint32) ch[2] << 8) | (opus_uint32) ch[3];
}

__s32
audio_opus_decode_frame(OpusDecoder *decoder, __u8 *PCMBuffer, int frame_size, __u8 *OPUSbuffer, int OPUSbufferSize) {
    __u8 int_field[4];
    __u8 OutData[OPUS_BUFFER_MAX];
    //__u32 start_time,end_time;
    short *pPCM = (short *) PCMBuffer;
    opus_uint32 enc_final_range;

    //start_time=rt_tick_get();
    memset(OutData, 0, OPUS_BUFFER_MAX);
    memset(OPUSbuffer, 0, OPUSbufferSize);
    for (int i = 0; i < OPUSbufferSize; ++i) {
        int_field[0] = OPUSbuffer[i];
        int_field[1] = OPUSbuffer[i + 1];
        int_field[2] = OPUSbuffer[i + 2];
        int_field[3] = OPUSbuffer[i + 3];
        opus_uint32 dataSize = char_to_int(int_field);
        opus_int16 PCMBufferTmp[10];
        int nbBytes = opus_decode(decoder, OPUSbuffer, dataSize, PCMBufferTmp, frame_size,0);
        if (nbBytes >= OPUS_BUFFER_MAX) {
            printf("[nbBytes]=%d error~~~~~\n", nbBytes);
        }
        memcpy(OPUSbuffer, int_field, 4);

        memcpy(OPUSbuffer + 4, int_field, 4);

        memcpy(OPUSbuffer + 8, OutData, nbBytes);
        //__wrn("[nbBytes]=%d\n",nbBytes+8);
    }
    return (nbBytes + 8);
}

static __s32 server_adc_ringbuferr_put(char *PCMBuffer, int PCMBufferSize) {

    __u8 PieceBuffer[FRAME_BUFFER_MAX];
    __u8 OPUSbuffer[OPUS_BUFFER_MAX];
    __s32 pieceH, pieceL;
    __s32 opus_len, ret, i;

    if (!server_ctrl) {
        __wrn("[server_ctrl]is null\n");
        return RT_FAIL;
    }

    if (server_ctrl->adc_ringbuffer == RT_NULL) {
        __wrn("[adc_ringbuffer]is null\n");
        return RT_FAIL;
    }

    pieceH = (PCMBufferSize / FRAME_BUFFER_MAX);
    pieceL = (PCMBufferSize % FRAME_BUFFER_MAX);
    for (i = 0; i < pieceH; i++) {
        memset(PieceBuffer, 0, FRAME_BUFFER_MAX);
        memcpy(PieceBuffer, PCMBuffer, FRAME_BUFFER_MAX);
        PCMBuffer += FRAME_BUFFER_MAX;
        opus_len = audio_opus_decode_frame(server_ctrl->OpusEnc, PieceBuffer, FRAME_BUFFER_MAX, OPUSbuffer,
                                           OPUS_BUFFER_MAX);
        if (opus_len < 0) {
            return RT_FAIL;
        }
        if (opus_len >= OPUS_BUFFER_MAX) {
            __wrn("[opus_len]=%d error~~~~~\n", opus_len);
        }
        rt_ringbuffer_put(server_ctrl->adc_ringbuffer, OPUSbuffer, opus_len);
    }

    if (pieceL != 0) {
        memset(PieceBuffer, 0, FRAME_BUFFER_MAX);
        memcpy(PieceBuffer, PCMBuffer, pieceL);
        opus_len = audio_opus_decode_frame(server_ctrl->OpusEnc, PieceBuffer, FRAME_BUFFER_MAX, OPUSbuffer,
                                           OPUS_BUFFER_MAX);
        if (opus_len < 0) {
            return RT_FAIL;
        }
        if (opus_len >= OPUS_BUFFER_MAX) {
            __wrn("[opus_len]=%d error~~~~~\n", opus_len);
        }
        rt_ringbuffer_put(server_ctrl->adc_ringbuffer, OPUSbuffer, opus_len);
    }

}


int main() {
    printf("Hello, World!\n");
    return 0;
}