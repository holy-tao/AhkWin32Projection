#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an array of unordered-access 2D texture resources. (D3D11_TEX2D_ARRAY_UAV1)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_tex2d_array_uav1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_TEX2D_ARRAY_UAV1 extends Win32Struct
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
