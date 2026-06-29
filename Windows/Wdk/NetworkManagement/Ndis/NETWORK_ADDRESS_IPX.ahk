#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NETWORK_ADDRESS_IPX {
    #StructPack 4

    NetworkAddress : UInt32

    NodeAddress : Int8[6]

    Socket : UInt16

}
