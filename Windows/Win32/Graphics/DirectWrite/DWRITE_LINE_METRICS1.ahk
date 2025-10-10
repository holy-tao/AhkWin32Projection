#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DWRITE_LINE_METRICS.ahk

/**
 * Contains information about a formatted line of text.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/ns-dwrite_3-dwrite_line_metrics1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_LINE_METRICS1 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {DWRITE_LINE_METRICS}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := DWRITE_LINE_METRICS(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * White space before the content of the line. This is included in the line height and baseline distances.
     * If the line is formatted horizontally either with a uniform line spacing or with proportional
     * line spacing, this value represents the extra space above the content.
     * @type {Float}
     */
    leadingBefore {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * White space after the content of the line. This is included in the height of the line.
     * If the line is formatted horizontally either with a uniform line spacing or with proportional
     * line spacing, this value represents the extra space below the content.
     * @type {Float}
     */
    leadingAfter {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }
}
