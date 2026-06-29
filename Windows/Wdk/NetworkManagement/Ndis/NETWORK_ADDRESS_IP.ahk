#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NETWORK_ADDRESS_IP {
    #StructPack 4

    sin_port : UInt16

    IN_ADDR : UInt32

    sin_zero : Int8[8]

}
