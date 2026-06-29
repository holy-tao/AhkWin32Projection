#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\INTERNET_COOKIE.ahk" { INTERNET_COOKIE }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct COOKIE_DLG_INFO {
    #StructPack 8

    pszServer : PWSTR

    pic : INTERNET_COOKIE.Ptr

    dwStopWarning : UInt32

    cx : Int32

    cy : Int32

    pszHeader : PWSTR

    dwOperation : UInt32

}
