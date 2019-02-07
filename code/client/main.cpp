#include "pch.h"
#include <common/common.h>
#include <common/LineParser.h>

#include <module/math.h>

int main()
{
	std::cout << "hello, cmake-test?" << std::endl;

//	std::cout << std::experimental::filesystem::current_path() << std::endl;
	Lus::line_parser parser { "../../sample_text.txt" };
	for (const auto& p : parser)
	{
		std::cout << '[' << p << ']' << std::endl;
	}
	std::cout << "---- common test ----" << std::endl;
	std::cout << hello() << std::endl;

	std::cout << "---- module test ----" << std::endl;
	std::cout << "1 + 3 = " << sum(1, 3) << std::endl;
}
