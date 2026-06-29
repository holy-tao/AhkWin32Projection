#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @charset Unicode
 */
export default struct INTERNET_CACHE_CONFIG_PATH_ENTRYW {
    #StructPack 4

    CachePath : WCHAR[260]

    dwCacheSize : UInt32

}
