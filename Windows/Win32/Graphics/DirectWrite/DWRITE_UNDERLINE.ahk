#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DWRITE_MEASURING_MODE.ahk" { DWRITE_MEASURING_MODE }
#Import ".\DWRITE_FLOW_DIRECTION.ahk" { DWRITE_FLOW_DIRECTION }
#Import ".\DWRITE_READING_DIRECTION.ahk" { DWRITE_READING_DIRECTION }

/**
 * Contains information about the width, thickness, offset, run height, reading direction, and flow direction of an underline.
 * @remarks
 * All coordinates are in device independent pixels (DIPs).
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_underline
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_UNDERLINE {
    #StructPack 8

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the width of the underline, measured parallel to the baseline.
     */
    width : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the thickness of the underline, measured perpendicular to the baseline.
     */
    thickness : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the offset of the underline from the baseline. A positive offset represents a position below the baseline (away from the text) and a negative offset is above (toward the text).
     */
    offset : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the height of the tallest run where the underline is applied.
     */
    runHeight : Float32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_reading_direction">DWRITE_READING_DIRECTION</a></b>
     * 
     * A value that indicates the reading direction of the text associated with the underline. This value is used to interpret whether the width value runs horizontally or vertically.
     */
    readingDirection : DWRITE_READING_DIRECTION

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_flow_direction">DWRITE_FLOW_DIRECTION</a></b>
     * 
     * A value that indicates the flow direction of the text associated with the underline. This value is used to interpret whether the thickness value advances top to bottom, left to right, or right to left.
     */
    flowDirection : DWRITE_FLOW_DIRECTION

    /**
     * Type: <b>const WCHAR*</b>
     * 
     * An array of characters which contains the locale of the text that the underline is being drawn under.  For example, in vertical text, the underline belongs on the left for Chinese but on the right for Japanese.
     */
    localeName : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * The measuring mode can be useful to the renderer to determine how underlines are rendered, such as rounding the thickness to a whole pixel in GDI-compatible modes.
     */
    measuringMode : DWRITE_MEASURING_MODE

}
