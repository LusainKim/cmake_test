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

add_and_link_dependency(${target} common)
add_and_link_dependency(${target} module)

target_link_libraries(${target}
	PUBLIC
		${WINLIBS}
)
