#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_SESSION_INFO {
    #StructPack 2

    uSessionInfoLength : UInt16

    ucSessionInfo : Int8[144]

}
