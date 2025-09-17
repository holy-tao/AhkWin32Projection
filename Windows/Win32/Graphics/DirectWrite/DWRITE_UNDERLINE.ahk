#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the width, thickness, offset, run height, reading direction, and flow direction of an underline.
 * @remarks
 * All coordinates are in device independent pixels (DIPs).
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_underline
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_UNDERLINE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the width of the underline, measured parallel to the baseline.
     * @type {Float}
     */
    width {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the thickness of the underline, measured perpendicular to the baseline.
     * @type {Float}
     */
    thickness {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the offset of the underline from the baseline. A positive offset represents a position below the baseline (away from the text) and a negative offset is above (toward the text).
     * @type {Float}
     */
    offset {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the height of the tallest run where the underline is applied.
     * @type {Float}
     */
    runHeight {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_reading_direction">DWRITE_READING_DIRECTION</a></b>
     * 
     * A value that indicates the reading direction of the text associated with the underline. This value is used to interpret whether the width value runs horizontally or vertically.
     * @type {Integer}
     */
    readingDirection {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_flow_direction">DWRITE_FLOW_DIRECTION</a></b>
     * 
     * A value that indicates the flow direction of the text associated with the underline. This value is used to interpret whether the thickness value advances top to bottom, left to right, or right to left.
     * @type {Integer}
     */
    flowDirection {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b>const WCHAR*</b>
     * 
     * An array of characters which contains the locale of the text that the underline is being drawn under.  For example, in vertical text, the underline belongs on the left for Chinese but on the right for Japanese.
     * @type {Pointer<Char>}
     */
    localeName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * The measuring mode can be useful to the renderer to determine how underlines are rendered, such as rounding the thickness to a whole pixel in GDI-compatible modes.
     * @type {Integer}
     */
    measuringMode {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
