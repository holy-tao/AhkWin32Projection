#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a range of text positions where format is applied in the text represented by an IDWriteTextLayout object.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ns-dwrite-dwrite_text_range
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_TEXT_RANGE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>UINT32</b>
     * 
     * The start position of the text range.
     * @type {Integer}
     */
    startPosition {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The number positions in the text range.
     * @type {Integer}
     */
    length {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
