project "GLFW"
	location "%{ProjectDir.GLFW}"
	kind "StaticLib"
	language "C"
	staticruntime "Off"

	targetdir "%{OutputDir.Binary}/%{prj.name}"
	objdir    "%{OutputDir.Intermediate}/%{prj.name}"

	files
	{
		"%{IncludeDir.GLFW}/glfw3.h",
		"%{IncludeDir.GLFW}/glfw3native.h",
	
		"%{SourceDir.GLFW}/glfw_config.h",
		"%{SourceDir.GLFW}/context.c",
		"%{SourceDir.GLFW}/init.c",
		"%{SourceDir.GLFW}/input.c",
		"%{SourceDir.GLFW}/monitor.c",

		"%{SourceDir.GLFW}/null_init.c",
		"%{SourceDir.GLFW}/null_joystick.c",
		"%{SourceDir.GLFW}/null_monitor.c",
		"%{SourceDir.GLFW}/null_window.c",

		"%{SourceDir.GLFW}/platform.c",
		"%{SourceDir.GLFW}/vulkan.c",
		"%{SourceDir.GLFW}/window.c"
	}

	filter "system:linux"
		pic "On"

		systemversion "latest"
		
		files
		{
			"%{SourceDir.GLFW}/x11_init.c",
			"%{SourceDir.GLFW}/x11_monitor.c",
			"%{SourceDir.GLFW}/x11_window.c",
			"%{SourceDir.GLFW}/xkb_unicode.c",
			"%{SourceDir.GLFW}/posix_time.c",
			"%{SourceDir.GLFW}/posix_thread.c",
			"%{SourceDir.GLFW}/glx_context.c",
			"%{SourceDir.GLFW}/egl_context.c",
			"%{SourceDir.GLFW}/osmesa_context.c",
			"%{SourceDir.GLFW}/linux_joystick.c"
		}

		defines
		{
			"_GLFW_X11"
		}

	filter "system:windows"
		systemversion "latest"

		files
		{
			"%{SourceDir.GLFW}/win32_init.c",
			"%{SourceDir.GLFW}/win32_joystick.c",
			"%{SourceDir.GLFW}/win32_module.c",
			"%{SourceDir.GLFW}/win32_monitor.c",
			"%{SourceDir.GLFW}/win32_time.c",
			"%{SourceDir.GLFW}/win32_thread.c",
			"%{SourceDir.GLFW}/win32_window.c",
			"%{SourceDir.GLFW}/wgl_context.c",
			"%{SourceDir.GLFW}/egl_context.c",
			"%{SourceDir.GLFW}/osmesa_context.c"
		}

		defines 
		{ 
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

		links
		{
			"Dwmapi.lib"
		}

	filter "configurations:Development"
		runtime "Debug"
		symbols "On"

	filter "configurations:Preview"
		runtime "Release"
		optimize "On"
		defines "NDEBUG"

	filter "configurations:Shipping"
		runtime "Release"
		optimize "Speed"
		defines "NDEBUG"
