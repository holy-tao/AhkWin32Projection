#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an array of unordered-access 2D texture resources.
 * @remarks
 * 
  * Use this structure with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_unordered_access_view_desc">D3D12_UNORDERED_ACCESS_VIEW_DESC</a> structure to view the resource as an array of 2D textures.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_tex2d_array_uav
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TEX2D_ARRAY_UAV extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The mipmap slice index.
     * @type {Integer}
     */
    MipSlice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The zero-based index of the first array slice to be accessed.
     * @type {Integer}
     */
    FirstArraySlice {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of slices in the array.
     * @type {Integer}
     */
    ArraySize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The index (plane slice number) of the plane to use in an array of textures.
     * @type {Integer}
     */
    PlaneSlice {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
