cmake_minimum_required(VERSION 3.9)
project(FinalProject)
include_directories(
        lib/glfw/include
        lib/glad/include
)

set(CMAKE_CXX_STANDARD 11)
add_subdirectory(lib/glfw)
add_executable(FinalProject main.cpp glad.c stb_image.h shader.h)
target_link_libraries(FinalProject glfw)