#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a formatted line of text.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ns-dwrite-dwrite_line_metrics
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_LINE_METRICS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Type: <b>UINT32</b>
     * 
     * The number of text positions in the text line. 
     * 	  This includes any trailing whitespace and newline characters.
     * @type {Integer}
     */
    length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The number of whitespace positions at the end of the text line. 
     * 	  Newline sequences are considered whitespace.
     * @type {Integer}
     */
    trailingWhitespaceLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The number of characters in the newline sequence at the end of the text line. 
     * 	  If the count is zero, then the text line was either wrapped or it is the end of the text.
     * @type {Integer}
     */
    newlineLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The height of the text line.
     * @type {Float}
     */
    height {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The distance from the top of the text line to its baseline.
     * @type {Float}
     */
    baseline {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * The line is trimmed.
     * @type {Integer}
     */
    isTrimmed {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
