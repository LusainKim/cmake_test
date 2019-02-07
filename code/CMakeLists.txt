# include root directory
include_directories(${CMAKE_CURRENT_SOURCE_DIR})



# main project
add_subdirectory(client)

# static library
add_subdirectory(common)

# dynamic library
add_subdirectory(module)