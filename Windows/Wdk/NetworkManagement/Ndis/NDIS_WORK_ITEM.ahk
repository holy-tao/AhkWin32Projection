#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_WORK_ITEM {
    #StructPack 8

    Context : IntPtr

    Routine : IntPtr

    WrapperReserved : Int8[32]

}
