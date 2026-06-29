#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct CookieDecision {
    #StructPack 4

    dwCookieState : UInt32

    fAllowSession : BOOL

}
