#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_PORT_STATE {
    #StructPack 4

    PeerMacAddress : Int8[6]

    uSessionId : UInt32

    bPortControlled : BOOL

    bPortAuthorized : BOOL

}
