#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a GPU virtual address and indexing stride.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_gpu_virtual_address_and_stride
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE {
    #StructPack 8

    /**
     * The beginning of the virtual address range.
     */
    StartAddress : Int64

    /**
     * Defines indexing stride, such as for vertices.  Only the bottom 32 bits are used.  The field is 64 bits to make alignment of containing structures consistent everywhere.
     */
    StrideInBytes : Int64

}
