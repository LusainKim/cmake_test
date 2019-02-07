#pragma once

#include <string>
#include <vector>

#include <algorithm>
#include <filesystem>
#include <fstream>

namespace Lus
{
    template<typename elem>
    class base_line_parser
    {
	public:
		using string_t       = typename std::basic_string<elem>;
        using storage_t      = typename std::vector<string_t>;
		using iterator       = typename std::vector<elem>::iterator;
		using const_iterator = typename std::vector<elem>::const_iterator;

	public:

		base_line_parser() = default;
		base_line_parser(const string_t& filename) 
		{
			namespace fs = std::experimental::filesystem;
			using ifstream_t = std::basic_ifstream<elem>;

			ifstream_t ifs { filename, std::ios::binary };

			size_t sz = fs::file_size(filename);

			std::vector<elem> data;
			data.resize(sz);

			ifs.read(data.data(), data.size());

			// always end of data is '\n'
			data.emplace_back('\n');

			parsing(std::move(data));
		}

		virtual ~base_line_parser() = default;

		bool parsing(std::vector<elem>&& data)
		{
			// refrash storage
			storage.clear();

			// remove '\r'
			const auto end = std::remove(std::begin(data), std::end(data), '\r');
			auto cur = std::begin(data);

			while (cur != end)
			{
				auto sep = std::find(cur, end, '\n');
				if (end == sep) break;

				for (; cur != sep && (*cur == ' ' || *cur == '\t'); ++cur);
				for (auto chk = std::prev(sep); cur != sep && (*chk == ' ' || *chk == '\t'); --sep, --chk);

				if (cur != sep) storage.emplace_back(cur, sep);

				cur = std::next(sep);
			}

			return empty();
		}

		auto           begin()  const noexcept { return storage.begin(); }
		auto           end()    const noexcept { return storage.end(); }

		const_iterator cbegin() const { return storage.cbegin(); }
		const_iterator cend()   const { return storage.cend(); }
		const size_t   size()   const { return storage.size(); }
		bool           empty()  const { return storage.empty(); }

    protected:
		storage_t    storage;
	};

	using line_parser  = base_line_parser<char>;
	using wline_parser = base_line_parser<wchar_t>;
}

