#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct WLX_SC_NOTIFICATION_INFO {
    #StructPack 8

    pszCard : PWSTR

    pszReader : PWSTR

    pszContainer : PWSTR

    pszCryptoProvider : PWSTR

}
