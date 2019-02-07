set(target main)

make_executable(${target} "CONSOLE")

add_pch(${target} pch.cpp pch.h) 

add_sources(${target}
	"Source Files"
	"main.cpp"
)

add_sources(${target}
	"Header Files"
)

target_link_libraries(${target}
	PUBLIC
		${WINLIBS}
)
