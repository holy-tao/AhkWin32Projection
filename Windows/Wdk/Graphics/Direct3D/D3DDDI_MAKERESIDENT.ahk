#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_MAKERESIDENT {
    #StructPack 8

    hPagingQueue : UInt32

    NumAllocations : UInt32

    AllocationList : IntPtr

    PriorityList : IntPtr

    Flags : IntPtr

    PagingFenceValue : Int64

    NumBytesToTrim : Int64

}
