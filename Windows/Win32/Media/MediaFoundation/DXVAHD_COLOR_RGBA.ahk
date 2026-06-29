#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies an RGB color value. (DXVAHD_COLOR_RGBA)
 * @remarks
 * The RGB values have a nominal range of [0...1]. For an RGB format with  <i>n</i> bits per channel, the value of each color component is calculated as follows:
 * 
 * <c>val = f * ((1 &lt;&lt; n)-1)</c>
 * 
 * For example, for RGB-32 (8 bits per channel), <c>val = BYTE(f * 255.0)</c>.
 * 
 * For full-range RGB, reference black is (0.0, 0.0, 0.0), which corresponds to (0, 0, 0) in an 8-bit representation. For limited-range RGB, reference black is (0.0625, 0.0625, 0.0625), which corresponds to (16, 16, 16) in an 8-bit representation. For wide-gamut formats, the values might fall outside of the [0...1] range.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_color_rgba
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_COLOR_RGBA {
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
