cmake_minimum_required(VERSION 3.11)

include(cmake/macros.cmake)
include(cmake/platform/windows.cmake)

set(ROOT "${CMAKE_CURRENT_SOURCE_DIR}")
set_install_prefix(${ROOT})

set(SOLUTION_NAME "cmake_test")

project(${SOLUTION_NAME})

add_subdirectory(code)
