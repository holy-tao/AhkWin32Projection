#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\INTERNET_SCHEME.ahk" { INTERNET_SCHEME }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct WININET_PROXY_INFO {
    #StructPack 8

    fProxy : BOOL

    fBypass : BOOL

    ProxyScheme : INTERNET_SCHEME

    pwszProxy : PWSTR

    ProxyPort : UInt16

}
