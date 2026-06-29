#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NETWORK_ADDRESS_IP6 {
    #StructPack 4

    sin6_port : UInt16

    sin6_flowinfo : UInt32

    sin6_addr : UInt16[8]

    sin6_scope_id : UInt32

}
