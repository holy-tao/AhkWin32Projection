#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_WMI_OFFLOAD {
    #StructPack 8

    Header : IntPtr

    Checksum : IntPtr

    LsoV1 : IntPtr

    IPsecV1 : IntPtr

    LsoV2 : IntPtr

    Flags : UInt32

}
