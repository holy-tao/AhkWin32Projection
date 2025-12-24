#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DWRITE_TEXT_METRICS.ahk

/**
 * Contains the metrics associated with text after layout. (DWRITE_TEXT_METRICS1)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/ns-dwrite_2-dwrite_text_metrics1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_TEXT_METRICS1 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {DWRITE_TEXT_METRICS}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := DWRITE_TEXT_METRICS(0, this)
            return this.__Base
        }
    }

    /**
     * The height of the formatted text taking into account the trailing whitespace at the end of each line. This is
     *             pertinent for vertical text.
     * @type {Float}
     */
    heightIncludingTrailingWhitespace {
        get => NumGet(this, 36, "float")
        set => NumPut("float", value, this, 36)
    }
}
