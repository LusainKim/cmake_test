#pragma once

#include <string>
#include <vector>
#include <fstream>
#include <algorithm>

namespace Lus
{
    template<struct elem>
    class base_line_parser
    {
		using string_t = std::basic_string<elem>;
        using storage_t = std::vector<string_t>;
		using iterator = std::vector<elem>::iterator;
		using const_iterator = std::vector<elem>::const_iterator;
	public:
        base_line_parser();
        ~base_line_parser();

		bool parsing(std::vector<elem>&& data);

		const_iterator cbegin() const { return storage.cbegin(); }
		const_iterator cend() const { return storage.cend(); }
		const size_t size() const { return storage.size(); }

    protected:
		storage_t	storage;
	};

	using line_parser = base_line_parser<char>;
	using wline_parser = base_line_parser<wchar_t>;
}

