#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_SESSION_ID {
    #StructPack 4

    SessionID : UInt32

    SessionAddress : Int8[6]

}
