#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_SECURITY_PACKET_HEADER {
    #StructPack 2

    PeerMac : Int8[6]

    usEtherType : UInt16

    Data : Int8[1]

}
