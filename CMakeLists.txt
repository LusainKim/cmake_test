cmake_minimum_required(VERSION 3.8)

include(cmake/macros.cmake)

include(cmake/platform/windows.cmake)

set(ROOT "${CMAKE_CURRENT_SOURCE_DIR}")

set(DEFAULT_OUTPUT_DIRECTORY "${ROOT}/bin/")
set(DEFAULT_OUTPUT_DIRECTORY_CONFIG "${DEFAULT_OUTPUT_DIRECTORY}$(Configuration)")

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${DEFAULT_OUTPUT_DIRECTORY}$<$<CONFIG:Debug>:Debug>$<$<CONFIG:Profile>:Profile>$<$<CONFIG:Release>:Release>")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${DEFAULT_OUTPUT_DIRECTORY}$<$<CONFIG:Debug>:Debug>$<$<CONFIG:Profile>:Profile>$<$<CONFIG:Release>:Release>")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${DEFAULT_OUTPUT_DIRECTORY}$<$<CONFIG:Debug>:Debug>$<$<CONFIG:Profile>:Profile>$<$<CONFIG:Release>:Release>")

link_directories(${DEFAULT_OUTPUT_DIRECTORY})

set(SOLUTION_NAME "cmake_test")

project(${SOLUTION_NAME})

# include root directory
include_directories(${ROOT})

add_subdirectory(code)
