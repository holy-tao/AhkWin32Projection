#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a unordered-access 2D texture resource.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/ns-d3d11_3-d3d11_tex2d_uav1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_TEX2D_UAV1 extends Win32Struct
{
    static sizeof => 8

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
     * The index (plane slice number) of the plane to use in the texture.
     * @type {Integer}
     */
    PlaneSlice {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
