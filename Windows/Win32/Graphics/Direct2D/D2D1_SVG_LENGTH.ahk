#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_SVG_LENGTH_UNITS.ahk" { D2D1_SVG_LENGTH_UNITS }

/**
 * Represents an SVG length.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ns-d2d1svg-d2d1_svg_length
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_SVG_LENGTH {
    #StructPack 4

    value : Float32

    units : D2D1_SVG_LENGTH_UNITS

}
