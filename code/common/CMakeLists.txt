set(target common)

make_library(${target} "STATIC")

add_sources(${target}
	"Source Files"
	"LineParser.cpp"
)

add_sources(${target}
    "Header Files"
    "LineParser.h"
)

target_link_libraries(${target}
	PUBLIC
		${WINLIBS}
)
