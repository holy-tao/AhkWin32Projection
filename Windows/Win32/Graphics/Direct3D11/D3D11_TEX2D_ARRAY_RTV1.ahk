#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the subresources from an array of 2D textures to use in a render-target view. (D3D11_TEX2D_ARRAY_RTV1)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_tex2d_array_rtv1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_TEX2D_ARRAY_RTV1 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The index of the mipmap level to use mip slice.
     * @type {Integer}
     */
    MipSlice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The index of the first texture to use in an array of textures.
     * @type {Integer}
     */
    FirstArraySlice {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Number of textures in the array to use in the render-target view, starting from <b>FirstArraySlice</b>.
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
