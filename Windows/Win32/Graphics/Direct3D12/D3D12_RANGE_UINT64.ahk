#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a memory range in a 64-bit address space.
 * @remarks
 * <b>End</b> is one-past-the-end.
 *         When <b>Begin</b> equals <b>End</b>, the range is empty.
 *         The size of the range is (<b>End</b> - <b>Begin</b>).
 *       
 * 
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_subresource_range_uint64">D3D12_SUBRESOURCE_RANGE_UINT64</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_range_uint64
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RANGE_UINT64 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The offset, in bytes, denoting the beginning of a memory range.
     * @type {Integer}
     */
    Begin {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The offset, in bytes, denoting the end of a memory range.
     *             <b>End</b> is one-past-the-end.
     * @type {Integer}
     */
    End {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
