#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @charset ANSI
 */
export default struct INTERNET_CACHE_CONFIG_PATH_ENTRYA {
    #StructPack 4

    CachePath : CHAR[260]

    dwCacheSize : UInt32

}
