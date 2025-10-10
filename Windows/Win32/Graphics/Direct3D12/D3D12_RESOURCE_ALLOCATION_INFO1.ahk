#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes parameters needed to allocate resources, including offset.
 * @remarks
 * 
  * This structure is used by the [ID3D12Device::GetResourceAllocationInfo1](./nf-d3d12-id3d12device4-getresourceallocationinfo1.md) method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_resource_allocation_info1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RESOURCE_ALLOCATION_INFO1 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **[UINT64](/windows/win32/WinProg/windows-data-types)**
     * 
     * The offset, in bytes, of the resource.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[UINT64](/windows/win32/WinProg/windows-data-types)**
     * 
     * The alignment value for the resource; one of 4KB (4096), 64KB (65536), or 4MB (4194304) alignment.
     * @type {Integer}
     */
    Alignment {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[UINT64](/windows/win32/WinProg/windows-data-types)**
     * 
     * The size, in bytes, of the resource.
     * @type {Integer}
     */
    SizeInBytes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
