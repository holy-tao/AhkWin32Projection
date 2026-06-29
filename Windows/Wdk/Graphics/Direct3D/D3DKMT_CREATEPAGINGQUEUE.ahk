#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_PAGINGQUEUE_PRIORITY.ahk" { D3DDDI_PAGINGQUEUE_PRIORITY }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CREATEPAGINGQUEUE {
    #StructPack 8

    hDevice : UInt32

    Priority : D3DDDI_PAGINGQUEUE_PRIORITY

    hPagingQueue : UInt32

    hSyncObject : UInt32

    FenceValueCPUVirtualAddress : IntPtr

    PhysicalAdapterIndex : UInt32

}
