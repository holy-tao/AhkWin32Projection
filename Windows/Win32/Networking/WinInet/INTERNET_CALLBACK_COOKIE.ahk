#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_CALLBACK_COOKIE {
    #StructPack 8

    pcwszName : PWSTR

    pcwszValue : PWSTR

    pcwszDomain : PWSTR

    pcwszPath : PWSTR

    ftExpires : FILETIME

    dwFlags : UInt32

}
