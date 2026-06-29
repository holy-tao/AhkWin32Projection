#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_MAC_INFO {
    #StructPack 4

    uReserved : UInt32

    uNdisPortNumber : UInt32

    MacAddr : Int8[6]

}
