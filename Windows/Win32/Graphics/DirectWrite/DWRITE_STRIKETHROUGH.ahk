#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information regarding the size and placement of strikethroughs.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_strikethrough
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_STRIKETHROUGH extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the width of the strikethrough, measured parallel to the baseline.
     * @type {Float}
     */
    width {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the thickness of the strikethrough, measured perpendicular to the baseline.
     * @type {Float}
     */
    thickness {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the offset of the strikethrough from the baseline. 
     * 	  A positive offset represents a position below the baseline and 
     * 	  a negative offset is above.  Typically, the offset will be negative.
     * @type {Float}
     */
    offset {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_reading_direction">DWRITE_READING_DIRECTION</a></b>
     * 
     * Reading direction of the text associated with the strikethrough. 
     * 	  This value is used to interpret whether the width value runs horizontally 
     * 	  or vertically.
     * @type {Integer}
     */
    readingDirection {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_flow_direction">DWRITE_FLOW_DIRECTION</a></b>
     * 
     * Flow direction of the text associated with the strikethrough. 
     * 	  This value is used to interpret whether the thickness value advances top to 
     * 	  bottom, left to right, or right to left.
     * @type {Integer}
     */
    flowDirection {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>const WCHAR*</b>
     * 
     * An array of characters containing the locale of the  text that is the strikethrough is being drawn over.
     * @type {PWSTR}
     */
    localeName{
        get {
            if(!this.HasProp("__localeName"))
                this.__localeName := PWSTR(this.ptr + 24)
            return this.__localeName
        }
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
