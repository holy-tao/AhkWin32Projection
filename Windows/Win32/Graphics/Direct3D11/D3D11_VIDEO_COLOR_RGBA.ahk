#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct D3D11_VIDEO_COLOR_RGBA {
    #StructPack 4

    /**
     * The red value.
     */
    R : Float32

    /**
     * The green value.
     */
    G : Float32

    /**
     * The blue value.
     */
    B : Float32

    /**
     * The alpha value. Values range from 0 (transparent) to 1 (opaque).
     */
    A : Float32

}
