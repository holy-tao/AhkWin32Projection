#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Identifies the texture resource for a video decoder output view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2d_vdov
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_TEX2D_VDOV extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The zero-based index of the texture.
     * @type {Integer}
     */
    ArraySlice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
