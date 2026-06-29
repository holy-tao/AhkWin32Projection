#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_DMA_BLOCK {
    #StructPack 8

    MapRegisterBase : IntPtr

    AllocationEvent : IntPtr

    SystemAdapterObject : IntPtr

    Miniport : IntPtr

    InProgress : BOOLEAN

}
