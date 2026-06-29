#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @charset Unicode
 */
export default struct INTERNET_CACHE_CONTAINER_INFOW {
    #StructPack 8

    dwCacheVersion : UInt32

    lpszName : PWSTR

    lpszCachePrefix : PWSTR

    lpszVolumeLabel : PWSTR

    lpszVolumeTitle : PWSTR

}
