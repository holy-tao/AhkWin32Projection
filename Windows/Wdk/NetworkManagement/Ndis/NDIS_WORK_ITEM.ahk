#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_PROC.ahk" { NDIS_PROC }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_WORK_ITEM {
    #StructPack 8

    Context : IntPtr

    Routine : NDIS_PROC

    WrapperReserved : Int8[32]

}
