#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a GPU virtual address range and stride.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_gpu_virtual_address_range_and_stride
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The beginning of the virtual address range.
     * @type {Integer}
     */
    StartAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the virtual address range, in bytes.
     * @type {Integer}
     */
    SizeInBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Defines the record-indexing stride within the memory range.
     * @type {Integer}
     */
    StrideInBytes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
