# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2018.3.3\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2018.3.3\bin\cmake\win\bin\cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\Administrator\CLionProjects\opus-decode

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\Administrator\CLionProjects\opus-decode\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/opus_decode.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/opus_decode.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/opus_decode.dir/flags.make

CMakeFiles/opus_decode.dir/main.c.obj: CMakeFiles/opus_decode.dir/flags.make
CMakeFiles/opus_decode.dir/main.c.obj: CMakeFiles/opus_decode.dir/includes_C.rsp
CMakeFiles/opus_decode.dir/main.c.obj: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Administrator\CLionProjects\opus-decode\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/opus_decode.dir/main.c.obj"
	C:\MinGW\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\opus_decode.dir\main.c.obj   -c C:\Users\Administrator\CLionProjects\opus-decode\main.c

CMakeFiles/opus_decode.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/opus_decode.dir/main.c.i"
	C:\MinGW\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Users\Administrator\CLionProjects\opus-decode\main.c > CMakeFiles\opus_decode.dir\main.c.i

CMakeFiles/opus_decode.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/opus_decode.dir/main.c.s"
	C:\MinGW\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:\Users\Administrator\CLionProjects\opus-decode\main.c -o CMakeFiles\opus_decode.dir\main.c.s

# Object files for target opus_decode
opus_decode_OBJECTS = \
"CMakeFiles/opus_decode.dir/main.c.obj"

# External object files for target opus_decode
opus_decode_EXTERNAL_OBJECTS =

opus_decode.exe: CMakeFiles/opus_decode.dir/main.c.obj
opus_decode.exe: CMakeFiles/opus_decode.dir/build.make
opus_decode.exe: CMakeFiles/opus_decode.dir/linklibs.rsp
opus_decode.exe: CMakeFiles/opus_decode.dir/objects1.rsp
opus_decode.exe: CMakeFiles/opus_decode.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\Administrator\CLionProjects\opus-decode\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable opus_decode.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\opus_decode.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/opus_decode.dir/build: opus_decode.exe

.PHONY : CMakeFiles/opus_decode.dir/build

CMakeFiles/opus_decode.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\opus_decode.dir\cmake_clean.cmake
.PHONY : CMakeFiles/opus_decode.dir/clean

CMakeFiles/opus_decode.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\Administrator\CLionProjects\opus-decode C:\Users\Administrator\CLionProjects\opus-decode C:\Users\Administrator\CLionProjects\opus-decode\cmake-build-debug C:\Users\Administrator\CLionProjects\opus-decode\cmake-build-debug C:\Users\Administrator\CLionProjects\opus-decode\cmake-build-debug\CMakeFiles\opus_decode.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/opus_decode.dir/depend

