#pragma once

#if defined (module_EXPORTS)
	#define MODULE_API __declspec(dllexport)
#else
	#define MODULE_API __declspec(dllimport)
#endif
