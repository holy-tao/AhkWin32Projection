#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes parameters needed to allocate resources.
 * @remarks
 * This structure is used by the [ID3D12Device::GetResourceAllocationInfo](./nf-d3d12-id3d12device-getresourceallocationinfo.md) and [ID3D12Device::GetResourceAllocationInfo1](./nf-d3d12-id3d12device4-getresourceallocationinfo1.md) methods.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_allocation_info
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RESOURCE_ALLOCATION_INFO {
    #StructPack 8

    /**
     * Type: **[UINT64](/windows/win32/WinProg/windows-data-types)**
     * 
     * The size, in bytes, of the resource.
     */
    SizeInBytes : Int64

    /**
     * Type: **[UINT64](/windows/win32/WinProg/windows-data-types)**
     * 
     * The alignment value for the resource; one of 4KB (4096), 64KB (65536), or 4MB (4194304) alignment.
     */
    Alignment : Int64

}
