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
		staticruntime "off"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "on"

	filter "configurations:Debug"
		defines "DEBUG"
		runtime "Debug"
		symbols "on"
		--filter {"configurations:Debug", "system:windows"}
		--	buildoptions {"/MTd"}

	filter "configurations:Release"
		defines "RELEASE"
		runtime "Release"
		optimize "on"
		--filter {"configurations:Release", "system:windows"}
		--	buildoptions {"/MT"}

	filter "configurations:Distribution"
		defines "DISTRIBUTION"
		runtime "Release"
		optimize "on"
		filter {"configurations:Distribution", "system:windows"}
			buildoptions {"/MT"}