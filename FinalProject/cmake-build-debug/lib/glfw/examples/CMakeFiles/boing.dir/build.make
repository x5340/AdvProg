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
include lib/glfw/examples/CMakeFiles/boing.dir/depend.make

# Include the progress variables for this target.
include lib/glfw/examples/CMakeFiles/boing.dir/progress.make

# Include the compile flags for this target's objects.
include lib/glfw/examples/CMakeFiles/boing.dir/flags.make

lib/glfw/examples/boing.app/Contents/Resources/glfw.icns: ../lib/glfw/examples/glfw.icns
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Copying OS X content lib/glfw/examples/boing.app/Contents/Resources/glfw.icns"
	$(CMAKE_COMMAND) -E copy /Users/Bryan/CLionProjects/FinalProject/lib/glfw/examples/glfw.icns lib/glfw/examples/boing.app/Contents/Resources/glfw.icns

lib/glfw/examples/CMakeFiles/boing.dir/boing.c.o: lib/glfw/examples/CMakeFiles/boing.dir/flags.make
lib/glfw/examples/CMakeFiles/boing.dir/boing.c.o: ../lib/glfw/examples/boing.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object lib/glfw/examples/CMakeFiles/boing.dir/boing.c.o"
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/boing.dir/boing.c.o   -c /Users/Bryan/CLionProjects/FinalProject/lib/glfw/examples/boing.c

lib/glfw/examples/CMakeFiles/boing.dir/boing.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/boing.dir/boing.c.i"
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/Bryan/CLionProjects/FinalProject/lib/glfw/examples/boing.c > CMakeFiles/boing.dir/boing.c.i

lib/glfw/examples/CMakeFiles/boing.dir/boing.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/boing.dir/boing.c.s"
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/Bryan/CLionProjects/FinalProject/lib/glfw/examples/boing.c -o CMakeFiles/boing.dir/boing.c.s

lib/glfw/examples/CMakeFiles/boing.dir/boing.c.o.requires:

.PHONY : lib/glfw/examples/CMakeFiles/boing.dir/boing.c.o.requires

lib/glfw/examples/CMakeFiles/boing.dir/boing.c.o.provides: lib/glfw/examples/CMakeFiles/boing.dir/boing.c.o.requires
	$(MAKE) -f lib/glfw/examples/CMakeFiles/boing.dir/build.make lib/glfw/examples/CMakeFiles/boing.dir/boing.c.o.provides.build
.PHONY : lib/glfw/examples/CMakeFiles/boing.dir/boing.c.o.provides

lib/glfw/examples/CMakeFiles/boing.dir/boing.c.o.provides.build: lib/glfw/examples/CMakeFiles/boing.dir/boing.c.o


lib/glfw/examples/CMakeFiles/boing.dir/__/deps/glad.c.o: lib/glfw/examples/CMakeFiles/boing.dir/flags.make
lib/glfw/examples/CMakeFiles/boing.dir/__/deps/glad.c.o: ../lib/glfw/deps/glad.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object lib/glfw/examples/CMakeFiles/boing.dir/__/deps/glad.c.o"
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/boing.dir/__/deps/glad.c.o   -c /Users/Bryan/CLionProjects/FinalProject/lib/glfw/deps/glad.c

lib/glfw/examples/CMakeFiles/boing.dir/__/deps/glad.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/boing.dir/__/deps/glad.c.i"
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/Bryan/CLionProjects/FinalProject/lib/glfw/deps/glad.c > CMakeFiles/boing.dir/__/deps/glad.c.i

lib/glfw/examples/CMakeFiles/boing.dir/__/deps/glad.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/boing.dir/__/deps/glad.c.s"
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/Bryan/CLionProjects/FinalProject/lib/glfw/deps/glad.c -o CMakeFiles/boing.dir/__/deps/glad.c.s

lib/glfw/examples/CMakeFiles/boing.dir/__/deps/glad.c.o.requires:

.PHONY : lib/glfw/examples/CMakeFiles/boing.dir/__/deps/glad.c.o.requires

lib/glfw/examples/CMakeFiles/boing.dir/__/deps/glad.c.o.provides: lib/glfw/examples/CMakeFiles/boing.dir/__/deps/glad.c.o.requires
	$(MAKE) -f lib/glfw/examples/CMakeFiles/boing.dir/build.make lib/glfw/examples/CMakeFiles/boing.dir/__/deps/glad.c.o.provides.build
.PHONY : lib/glfw/examples/CMakeFiles/boing.dir/__/deps/glad.c.o.provides

lib/glfw/examples/CMakeFiles/boing.dir/__/deps/glad.c.o.provides.build: lib/glfw/examples/CMakeFiles/boing.dir/__/deps/glad.c.o


# Object files for target boing
boing_OBJECTS = \
"CMakeFiles/boing.dir/boing.c.o" \
"CMakeFiles/boing.dir/__/deps/glad.c.o"

# External object files for target boing
boing_EXTERNAL_OBJECTS =

lib/glfw/examples/boing.app/Contents/MacOS/boing: lib/glfw/examples/CMakeFiles/boing.dir/boing.c.o
lib/glfw/examples/boing.app/Contents/MacOS/boing: lib/glfw/examples/CMakeFiles/boing.dir/__/deps/glad.c.o
lib/glfw/examples/boing.app/Contents/MacOS/boing: lib/glfw/examples/CMakeFiles/boing.dir/build.make
lib/glfw/examples/boing.app/Contents/MacOS/boing: lib/glfw/src/libglfw3.a
lib/glfw/examples/boing.app/Contents/MacOS/boing: lib/glfw/examples/CMakeFiles/boing.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable boing.app/Contents/MacOS/boing"
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/boing.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/glfw/examples/CMakeFiles/boing.dir/build: lib/glfw/examples/boing.app/Contents/MacOS/boing
lib/glfw/examples/CMakeFiles/boing.dir/build: lib/glfw/examples/boing.app/Contents/Resources/glfw.icns

.PHONY : lib/glfw/examples/CMakeFiles/boing.dir/build

lib/glfw/examples/CMakeFiles/boing.dir/requires: lib/glfw/examples/CMakeFiles/boing.dir/boing.c.o.requires
lib/glfw/examples/CMakeFiles/boing.dir/requires: lib/glfw/examples/CMakeFiles/boing.dir/__/deps/glad.c.o.requires

.PHONY : lib/glfw/examples/CMakeFiles/boing.dir/requires

lib/glfw/examples/CMakeFiles/boing.dir/clean:
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/examples && $(CMAKE_COMMAND) -P CMakeFiles/boing.dir/cmake_clean.cmake
.PHONY : lib/glfw/examples/CMakeFiles/boing.dir/clean

lib/glfw/examples/CMakeFiles/boing.dir/depend:
	cd /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/Bryan/CLionProjects/FinalProject /Users/Bryan/CLionProjects/FinalProject/lib/glfw/examples /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/examples /Users/Bryan/CLionProjects/FinalProject/cmake-build-debug/lib/glfw/examples/CMakeFiles/boing.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/glfw/examples/CMakeFiles/boing.dir/depend

