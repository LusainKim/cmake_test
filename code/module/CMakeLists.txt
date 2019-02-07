set(target module)

make_library(${target} "SHARED")

add_pch(${target} pch.cpp pch.h) 

add_sources(${target}
	"Source Files"
	"dllmain.cpp"
)

add_sources(${target}
	"Header Files"
	"module.h"
)

add_sources(${target}
	"math"
	"math.cpp"
	"math.h"
)


target_link_libraries(${target}
	PUBLIC
		${WINLIBS}
)
