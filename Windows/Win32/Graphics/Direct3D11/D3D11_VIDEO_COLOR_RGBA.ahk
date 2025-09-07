#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies an RGB color value. (D3D11_VIDEO_COLOR_RGBA)
 * @remarks
 * The RGB values have a nominal range of [0...1]. For an RGB format with  <i>n</i> bits per channel, the value of each color component is calculated as follows:
  * 
  * <c>val = f * ((1 &lt;&lt; n)-1)</c>
  * 
  * For example, for RGB-32 (8 bits per channel), <c>val = BYTE(f * 255.0)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_color_rgba
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_COLOR_RGBA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The red value.
     * @type {Float}
     */
    R {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The green value.
     * @type {Float}
     */
    G {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The blue value.
     * @type {Float}
     */
    B {
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
