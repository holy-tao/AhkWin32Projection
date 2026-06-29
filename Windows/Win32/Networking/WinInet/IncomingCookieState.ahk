#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct IncomingCookieState {
    #StructPack 8

    cSession : Int32

    cPersistent : Int32

    cAccepted : Int32

    cLeashed : Int32

    cDowngraded : Int32

    cBlocked : Int32

    pszLocation : PSTR

}
