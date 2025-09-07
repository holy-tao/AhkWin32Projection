#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the trimming option for text overflowing the layout box.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_trimming
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_TRIMMING extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_trimming_granularity">DWRITE_TRIMMING_GRANULARITY</a></b>
     * 
     * A value that specifies  the text granularity used to trim text overflowing the layout box.
     * @type {Integer}
     */
    granularity {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * A character code used as the delimiter that signals the beginning of the portion of text to be preserved. 
     *           Text starting from the Nth occurrence of the delimiter (where N equals delimiterCount) counting backwards from the end of the text block will be preserved.
     *           For example, given the text is a path like c:\A\B\C\D\file.txt and delimiter equal to '\' and delimiterCount equal to 1, the file.txt portion of the text would be preserved.  
     *           Specifying a delimiterCount of 2 would preserve D\file.txt.
     * @type {Integer}
     */
    delimiter {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The delimiter count, counting from the end of the text, to preserve text from.
     * @type {Integer}
     */
    delimiterCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
