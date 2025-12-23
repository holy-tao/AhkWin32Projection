#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the metrics associated with text after layout. (DWRITE_TEXT_METRICS)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_metrics
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_TEXT_METRICS extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the left-most point of formatted text relative to the layout box, 
     * 	  while excluding any glyph overhang.
     * @type {Float}
     */
    left {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the top-most point of formatted text relative to the layout box, while excluding any glyph overhang.
     * @type {Float}
     */
    top {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the width of the formatted text, while ignoring trailing whitespace 
     * 	  at the end of each line.
     * @type {Float}
     */
    width {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The width of the formatted text, taking into account the 
     * 	  trailing whitespace at the end of each line.
     * @type {Float}
     */
    widthIncludingTrailingWhitespace {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The height of the formatted text. The height of an empty string 
     * 	  is set to the same value as that of the default font.
     * @type {Float}
     */
    height {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The initial width given to the layout. It can be either larger or smaller than the 
     * 	  text content width, depending on whether the text 
     * 	  was wrapped.
     * @type {Float}
     */
    layoutWidth {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * Initial height given to the layout. Depending on the length of the text, it may be larger or smaller than the text content height.
     * @type {Float}
     */
    layoutHeight {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The maximum reordering count of any line of text, used 
     * 	  to calculate the most number of hit-testing boxes needed. 
     * 	  If the layout has no bidirectional text, or no text at all, 
     * 	  the minimum level is 1.
     * @type {Integer}
     */
    maxBidiReorderingDepth {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Total number of lines.
     * @type {Integer}
     */
    lineCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
