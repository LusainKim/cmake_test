set(target common)

make_library(${target} "STATIC")

add_sources(${target}
	"Source Files"
	"common.cpp"
)

add_sources(${target}
	"Header Files"
	"common.h"
	"LineParser.h"
)
