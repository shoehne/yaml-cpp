project "yaml-cpp"
	kind "StaticLib"
	language "C++"
	location "./"

	targetdir ("../../bin/" .. output_dir .. "/%{prj.name}")
	objdir ("../../bin-obj/" .. output_dir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp",
		
		"include/**.h"
	}

	includedirs
	{
		"include"
	}

	defines
	{
		"YAML_CPP_STATIC_DEFINE"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "on"

	filter {"system:windows", "configurations:Debug"}
		buildoptions {

			"/MTd"
		}
	filter {"system:windows", "configurations:Release"}
		buildoptions {

			"/MT"
		}
	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "on"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
