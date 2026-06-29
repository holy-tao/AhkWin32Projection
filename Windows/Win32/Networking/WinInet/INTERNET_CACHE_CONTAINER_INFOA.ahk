#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @charset ANSI
 */
export default struct INTERNET_CACHE_CONTAINER_INFOA {
    #StructPack 8

    dwCacheVersion : UInt32

    lpszName : PSTR

    lpszCachePrefix : PSTR

    lpszVolumeLabel : PSTR

    lpszVolumeTitle : PSTR

}
