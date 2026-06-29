#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASPPPIPV6 {
    #StructPack 4

    dwSize : UInt32

    dwError : UInt32

    bLocalInterfaceIdentifier : Int8[8]

    bPeerInterfaceIdentifier : Int8[8]

    bLocalCompressionProtocol : Int8[2]

    bPeerCompressionProtocol : Int8[2]

}
