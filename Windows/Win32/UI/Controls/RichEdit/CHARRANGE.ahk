#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies a range of characters in a rich edit control.If the cpMin and cpMax members are equal, the range is empty. The range includes everything if cpMin is 0 and cpMax is �1.
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-charrange
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class CHARRANGE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Character position index immediately preceding the first character in the range.
     * @type {Integer}
     */
    cpMin {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Character position immediately following the last character in the range.
     * @type {Integer}
     */
    cpMax {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
