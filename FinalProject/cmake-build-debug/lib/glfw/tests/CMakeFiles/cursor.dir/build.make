# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

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

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/Bryan/CLionProjects/FinalProject

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug

# Include any dependencies generated for this target.
include lib/glfw/tests/CMakeFiles/cursor.dir/depend.make

# Include the progress variables for this target.
include lib/glfw/tests/CMakeFiles/cursor.dir/progress.make

# Include the compile flags for this target's objects.
include lib/glfw/tests/CMakeFiles/cursor.dir/flags.make

lib/glfw/tests/CMakeFiles/cursor.dir/cursor.c.o: lib/glfw/tests/CMakeFiles/cursor.dir/flags.make
lib/glfw/tests/CMakeFiles/cursor.dir/cursor.c.o: ../lib/glfw/tests/cursor.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object lib/glfw/tests/CMakeFiles/cursor.dir/cursor.c.o"
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cursor.dir/cursor.c.o   -c /Users/Bryan/CLionProjects/FinalProject/lib/glfw/tests/cursor.c

lib/glfw/tests/CMakeFiles/cursor.dir/cursor.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cursor.dir/cursor.c.i"
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/Bryan/CLionProjects/FinalProject/lib/glfw/tests/cursor.c > CMakeFiles/cursor.dir/cursor.c.i

lib/glfw/tests/CMakeFiles/cursor.dir/cursor.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cursor.dir/cursor.c.s"
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/Bryan/CLionProjects/FinalProject/lib/glfw/tests/cursor.c -o CMakeFiles/cursor.dir/cursor.c.s

lib/glfw/tests/CMakeFiles/cursor.dir/cursor.c.o.requires:

.PHONY : lib/glfw/tests/CMakeFiles/cursor.dir/cursor.c.o.requires

lib/glfw/tests/CMakeFiles/cursor.dir/cursor.c.o.provides: lib/glfw/tests/CMakeFiles/cursor.dir/cursor.c.o.requires
	$(MAKE) -f lib/glfw/tests/CMakeFiles/cursor.dir/build.make lib/glfw/tests/CMakeFiles/cursor.dir/cursor.c.o.provides.build
.PHONY : lib/glfw/tests/CMakeFiles/cursor.dir/cursor.c.o.provides

lib/glfw/tests/CMakeFiles/cursor.dir/cursor.c.o.provides.build: lib/glfw/tests/CMakeFiles/cursor.dir/cursor.c.o


lib/glfw/tests/CMakeFiles/cursor.dir/__/deps/glad.c.o: lib/glfw/tests/CMakeFiles/cursor.dir/flags.make
lib/glfw/tests/CMakeFiles/cursor.dir/__/deps/glad.c.o: ../lib/glfw/deps/glad.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object lib/glfw/tests/CMakeFiles/cursor.dir/__/deps/glad.c.o"
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cursor.dir/__/deps/glad.c.o   -c /Users/Bryan/CLionProjects/FinalProject/lib/glfw/deps/glad.c

lib/glfw/tests/CMakeFiles/cursor.dir/__/deps/glad.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cursor.dir/__/deps/glad.c.i"
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/Bryan/CLionProjects/FinalProject/lib/glfw/deps/glad.c > CMakeFiles/cursor.dir/__/deps/glad.c.i

lib/glfw/tests/CMakeFiles/cursor.dir/__/deps/glad.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cursor.dir/__/deps/glad.c.s"
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/Bryan/CLionProjects/FinalProject/lib/glfw/deps/glad.c -o CMakeFiles/cursor.dir/__/deps/glad.c.s

lib/glfw/tests/CMakeFiles/cursor.dir/__/deps/glad.c.o.requires:

.PHONY : lib/glfw/tests/CMakeFiles/cursor.dir/__/deps/glad.c.o.requires

lib/glfw/tests/CMakeFiles/cursor.dir/__/deps/glad.c.o.provides: lib/glfw/tests/CMakeFiles/cursor.dir/__/deps/glad.c.o.requires
	$(MAKE) -f lib/glfw/tests/CMakeFiles/cursor.dir/build.make lib/glfw/tests/CMakeFiles/cursor.dir/__/deps/glad.c.o.provides.build
.PHONY : lib/glfw/tests/CMakeFiles/cursor.dir/__/deps/glad.c.o.provides

lib/glfw/tests/CMakeFiles/cursor.dir/__/deps/glad.c.o.provides.build: lib/glfw/tests/CMakeFiles/cursor.dir/__/deps/glad.c.o


# Object files for target cursor
cursor_OBJECTS = \
"CMakeFiles/cursor.dir/cursor.c.o" \
"CMakeFiles/cursor.dir/__/deps/glad.c.o"

# External object files for target cursor
cursor_EXTERNAL_OBJECTS =

lib/glfw/tests/cursor: lib/glfw/tests/CMakeFiles/cursor.dir/cursor.c.o
lib/glfw/tests/cursor: lib/glfw/tests/CMakeFiles/cursor.dir/__/deps/glad.c.o
lib/glfw/tests/cursor: lib/glfw/tests/CMakeFiles/cursor.dir/build.make
lib/glfw/tests/cursor: lib/glfw/src/libglfw3.a
lib/glfw/tests/cursor: lib/glfw/tests/CMakeFiles/cursor.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable cursor"
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cursor.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/glfw/tests/CMakeFiles/cursor.dir/build: lib/glfw/tests/cursor

.PHONY : lib/glfw/tests/CMakeFiles/cursor.dir/build

lib/glfw/tests/CMakeFiles/cursor.dir/requires: lib/glfw/tests/CMakeFiles/cursor.dir/cursor.c.o.requires
lib/glfw/tests/CMakeFiles/cursor.dir/requires: lib/glfw/tests/CMakeFiles/cursor.dir/__/deps/glad.c.o.requires

.PHONY : lib/glfw/tests/CMakeFiles/cursor.dir/requires

lib/glfw/tests/CMakeFiles/cursor.dir/clean:
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/tests && $(CMAKE_COMMAND) -P CMakeFiles/cursor.dir/cmake_clean.cmake
.PHONY : lib/glfw/tests/CMakeFiles/cursor.dir/clean

lib/glfw/tests/CMakeFiles/cursor.dir/depend:
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/Bryan/CLionProjects/FinalProject /Users/Bryan/CLionProjects/FinalProject/lib/glfw/tests /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/tests /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/tests/CMakeFiles/cursor.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/glfw/tests/CMakeFiles/cursor.dir/depend

