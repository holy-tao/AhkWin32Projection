#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an SVG viewBox.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ns-d2d1svg-d2d1_svg_viewbox
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_SVG_VIEWBOX {
    #StructPack 4

    /**
     * X coordinate of the view box.
     */
    x : Float32

    /**
     * Y coordinate of the view box.
     */
    y : Float32

    /**
     * Width of the view box.
     */
    width : Float32

    /**
     * Height of the view box.
     */
    height : Float32

}
