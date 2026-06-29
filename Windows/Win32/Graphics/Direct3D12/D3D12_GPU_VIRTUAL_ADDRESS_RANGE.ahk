#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a GPU virtual address range.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_gpu_virtual_address_range
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_GPU_VIRTUAL_ADDRESS_RANGE {
    #StructPack 8

    /**
     * The beginning of the virtual address range.
     */
    StartAddress : Int64

    /**
     * The size of the virtual address range, in bytes.
     */
    SizeInBytes : Int64

}
