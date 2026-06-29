#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_VAR_DATA_DESC {
    #StructPack 8

    Length : UInt16

    MaximumLength : UInt16

    Offset : IntPtr

}
