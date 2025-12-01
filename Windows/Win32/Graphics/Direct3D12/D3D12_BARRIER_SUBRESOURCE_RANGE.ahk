#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Allows you to transition logically-adjacent ranges of subresources.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_barrier_subresource_range
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BARRIER_SUBRESOURCE_RANGE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The index of the first mip level in the range; or a subresource index, if *NumMipLevels* is zero. If a subresource index, then you can use the value `0xffffffff` to specify all subresources.
     * @type {Integer}
     */
    IndexOrFirstMipLevel {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of mip levels in the range, or zero to indicate that *IndexOrFirstMipLevel* is a subresource index.
     * @type {Integer}
     */
    NumMipLevels {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Index of first array slice in the range. Ignored if *NumMipLevels* is zero.
     * @type {Integer}
     */
    FirstArraySlice {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of array slices in the range. Ignored if *NumMipLevels* is zero.
     * @type {Integer}
     */
    NumArraySlices {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * First plane slice in the range. Ignored if *NumMipLevels* is zero.
     * @type {Integer}
     */
    FirstPlane {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of plane slices in the range. Ignored if *NumMipLevels* is zero.
     * @type {Integer}
     */
    NumPlanes {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
