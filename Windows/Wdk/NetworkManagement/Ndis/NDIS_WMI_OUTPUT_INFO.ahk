#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_WMI_OUTPUT_INFO {
    #StructPack 8

    Header : IntPtr

    Flags : UInt32

    SupportedRevision : Int8

    DataOffset : UInt32

}
