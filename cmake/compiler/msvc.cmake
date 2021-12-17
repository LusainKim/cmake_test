set(MSVC on)

set(MSVC_COMMON_FLAGS 
	/nologo	     # Don't show version info
	/W4          # Enable warning level 4
	/WX          # Enable warning to error
	/Zc:wchar_t  # Parse wchar_t as internal type
	/MP          # Build with multiple processes
	/Zi          # Use Program Database Binary
	/EHsc        # Catches C++ exceptions only and tells the compiler to assume that functions declared as extern "C" never throw a C++ exception.
	/Gy-         # Disable function level linking
	
	/DUNICODE    # Set source and execution 
	/D_UNICODE   # charset to Unicode
	
#	/fp:fast     # Use fast floating point precision model
)
string(REPLACE ";" " " MSVC_COMMON_FLAGS "${MSVC_COMMON_FLAGS}")
 
# Override cxx flags
set(CMAKE_CXX_FLAGS "${MSVC_COMMON_FLAGS}" CACHE STRING "C++ Common Flags" FORCE)

set(CMAKE_C_FLAGS_DEBUG "/MTd /Od /Ob0 /RTC1 /GS /D_DEBUG" CACHE STRING "C Flags" FORCE)
set(CMAKE_CXX_FLAGS_DEBUG "/MTd /Od /Ob0 /RTC1 /GS /D_DEBUG" CACHE STRING "C++ Flags" FORCE)

# Create PDBs (/Zi)
# Create better debug info (/Zo)
# Enable full optimization (/Ox) Same as /Ob2 /Oi /Ot /Oy
# Don't omit frame pointer (/Oy-)
# Disable buffer security checks (/GS-)
set(CMAKE_C_FLAGS_PROFILE "/MT /O2 /Oy /GL /GS- /Gy- /DNDEBUG /D_PROFILE" CACHE STRING "C Flags" FORCE)
set(CMAKE_CXX_FLAGS_PROFILE "/MT /O2 /Oy /GL /GS- /Gy- /DNDEBUG /D_PROFILE" CACHE STRING "C++ Flags" FORCE)

set(CMAKE_C_FLAGS_RELEASE "/MT /Ox /GS- /Gy- /DNDEBUG /D_RELEASE" CACHE STRING "C Flags" FORCE)
set(CMAKE_CXX_FLAGS_RELEASE "/MT /Ox /GS- /Gy- /DNDEBUG /D_RELEASE" CACHE STRING "C++ Flags" FORCE)

set(CMAKE_SHARED_LINKER_FLAGS_PROFILE "/debug" CACHE STRING "Profile link flags" FORCE)
set(CMAKE_EXE_LINKER_FLAGS_PROFILE    "/debug" CACHE STRING "Profile link flags" FORCE)
set(CMAKE_MODULE_LINKER_FLAGS_PROFILE "/debug /INCREMENTAL" CACHE STRING "Profile link flags" FORCE)

set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "/debug" CACHE STRING "Release link flags" FORCE)
set(CMAKE_EXE_LINKER_FLAGS_RELEASE    "/debug" CACHE STRING "Release link flags" FORCE)
set(CMAKE_MODULE_LINKER_FLAGS_RELEASE "/debug /INCREMENTAL" CACHE STRING "Release link flags" FORCE)
