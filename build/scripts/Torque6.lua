	project "Torque6"
		targetname "torque6"
		language "C++"
		kind "SharedLib"

		includedirs {
            "../../engine/lib/assimp/include",
            "../../engine/lib/bgfx/include/compat/msvc",
            "../../engine/lib/bgfx/include",
            "../../engine/lib/bgfx/3rdparty",
            "../../engine/lib/bgfx/common",
            "../../engine/Lib/LeapSDK/include",
            "../../engine/Lib/zlib",
            "../../engine/Lib/lpng",
            "../../engine/Lib/ljpeg",
            "../../engine/Lib/openal/win32",
            "../../engine/source",
            "../../engine/source/persistence/rapidjson/include",
            "../../engine/source/persistence/libjson",
            "../../engine/source/testing/googleTest",
            "../../engine/source/testing/googleTest/include",
            "../../engine/source/spine",
		}

		files {
			"../../engine/source/**.h",
			"../../engine/source/**.cc",
            "../../engine/source/**.cpp",
            "../../engine/source/**.asm",
		}

        removefiles {
            "../../engine/source/exe/**",
            "../../engine/source/graphics/bitmapPvr.cc",
            "../../engine/source/persistence/rapidjson/example/**",
            "../../engine/source/persistence/rapidjson/test/**",
            "../../engine/source/persistence/rapidjson/thirdparty/**",
            "../../engine/source/platform/**.unix.cc",
            "../../engine/source/platformAndroid/**",
            "../../engine/source/platformEmscripten/**",
            "../../engine/source/platformiOS/**",
            "../../engine/source/platformOSX/**",
            "../../engine/source/platformX86UNIX/**",
            "../../engine/source/testing/googleTest/**",
        }

        libdirs { "$(DXSDK_DIR)/Lib/x86",
                  "../../engine/lib/LeapSDK/lib/x86" }

        links {
		    "assimp",
		    "bgfx",
		    "ljpeg",
		    "lpng",
		    "zlib",
	    }

        buildoptions {
	        "/wd4100"
	    }

		configuration "Debug"
			defines     {  }

		configuration "Release"
			defines     {  }

		configuration "vs*"
			defines     { "_CRT_SECURE_NO_WARNINGS", "UNICODE" }
            flags       { "NoNativeWChar" }

		configuration "windows"
			targetdir   "../bin/windows"
			links { "Leapd",
                    "COMCTL32",
                    "COMDLG32",
                    "USER32",
                    "ADVAPI32",
                    "GDI32",
                    "RPCRT4",
                    "WINMM",
                    "WSOCK32",
                    "vfw32",
                    "Imm32",
                    "unicows",
                    "shell32",
                    "shlwapi",
                    "ole32",
                  }

		configuration "linux"
			targetdir   "../bin/linux"
			links       { "dl" }

		configuration "bsd"
			targetdir   "../bin/bsd"

		configuration "linux or bsd"
			defines     {  }
			links       { "m" }
			linkoptions { "-rdynamic" }

		configuration "macosx"
			targetdir   "../bin/darwin"
			defines     {  }
			links       { "CoreServices.framework" }

		configuration { "macosx", "gmake" }
			buildoptions { "-mmacosx-version-min=10.4" }
			linkoptions  { "-mmacosx-version-min=10.4" }