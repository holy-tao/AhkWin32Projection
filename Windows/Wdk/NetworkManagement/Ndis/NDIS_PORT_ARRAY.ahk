#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_PORT_ARRAY {
    #StructPack 8

    Header : IntPtr

    NumberOfPorts : UInt32

    OffsetFirstPort : UInt32

    ElementSize : UInt32

    Ports : IntPtr[1]

}
