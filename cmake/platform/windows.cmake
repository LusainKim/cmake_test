set_language_standard()

set(CMAKE_CONFIGURATION_TYPES Debug Profile Release)
set(CMAKE_CONFIGURATION_TYPES "${CMAKE_CONFIGURATION_TYPES}" CACHE STRING "Reset the configurations to what we need" FORCE)

# 64bit
set(BUILD_CPU_ARCHITECTURE "x64")
set(BUILD_PLATFORM "WIN64")
set(PLATFORM_NAME "win64")
set(WINDOWS on)
set(WIN32 on)
set(WIN64 on)

MESSAGE(STATUS "BUILD_CPU_ARCHITECTURE = ${BUILD_CPU_ARCHITECTURE}" )

set(CMAKE_GENERATOR_TOOLSET "host=x64")

add_definitions(-D_WINDOWS)
#add_definitions(-DWIN32 -D_WIN32)
#add_definitions(-DWIN64 -D_WIN64)

set(CMAKE_VS_PLATFRM_NAME "Win64")
include (${CMAKE_SOURCE_DIR}/cmake/compiler/msvc.cmake)

set(WINLIBS "")
list(APPEND ${WINLIBS} 
	"winmm.lib"
)

# Get Windows SDK - required windows 10
if (EXISTS "${SDK_DIR}/Microsoft Windows SDK/10")
	set(WINDOWS_SDK "${SDK_DIR}/Microsoft Windows SDK/10")
else()
	get_filename_component(WINDOWS_SDK "[HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows Kits\\Installed Roots;KitsRoot10]" ABSOLUTE CACHE)
endif ()
