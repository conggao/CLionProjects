cmake_minimum_required(VERSION 3.13)
project(opus_decode)

set(CMAKE_C_STANDARD 99)
# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)
# 添加子模块
#add_subdirectory(math)
include_directories(include)
# 指定生成目标
add_executable(opus_decode main.c)
# 添加链接库
target_link_libraries(opus_decode lib/opus.lib)
