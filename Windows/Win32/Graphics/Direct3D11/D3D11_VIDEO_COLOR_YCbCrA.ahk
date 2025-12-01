#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a YCbCr color value. (D3D11_VIDEO_COLOR_YCbCrA)
 * @remarks
 * Values have a nominal range of [0...1]. Given a format with  <i>n</i> bits per channel, the value of each color component is calculated as follows:
 * 
 * <c>val = f * ((1 &lt;&lt; n)-1)</c>
 * 
 * For example, for 8-bit YUV formats, <c>val = BYTE(f * 255.0)</c>.  Reference black is (0.0625, 0.5, 0.5), which corresponds to (16, 128, 128) in an 8-bit representation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_color_ycbcra
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_COLOR_YCbCrA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The Y luma value.
     * @type {Float}
     */
    Y {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The Cb chroma value.
     * @type {Float}
     */
    Cb {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The Cr chroma value.
     * @type {Float}
     */
    Cr {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * The alpha value. Values range from 0 (transparent) to 1 (opaque).
     * @type {Float}
     */
    A {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
