#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct OutgoingCookieState {
    #StructPack 8

    cSent : Int32

    cSuppressed : Int32

    pszLocation : PSTR

}
