#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_PORT {
    #StructPack 8

    Next : NDIS_PORT.Ptr

    NdisReserved : IntPtr

    MiniportReserved : IntPtr

    ProtocolReserved : IntPtr

    PortCharacteristics : IntPtr

}
