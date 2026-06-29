#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_ASSOCIATION_INFORMATION {
    #StructPack 8

    Length : UInt32

    AvailableRequestFixedIEs : UInt16

    RequestFixedIEs : IntPtr

    RequestIELength : UInt32

    OffsetRequestIEs : UInt32

    AvailableResponseFixedIEs : UInt16

    ResponseFixedIEs : IntPtr

    ResponseIELength : UInt32

    OffsetResponseIEs : UInt32

}
