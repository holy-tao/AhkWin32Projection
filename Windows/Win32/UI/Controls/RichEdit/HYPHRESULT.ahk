#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the result of hyphenation in a Microsoft Rich Edit control.
 * @remarks
 * 
  * This structure is used with the <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-hyphenateinfo">HYPHENATEINFO</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-hyphresult
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class HYPHRESULT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ne-richedit-khyph">KHYPH</a></b>
     * 
     * The type of hyphenation.
     * @type {Integer}
     */
    khyph {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The index of the WCHAR in the passed string where hyphenation occurred.
     * @type {Integer}
     */
    ichHyph {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WCHAR</a></b>
     * 
     * The character used when hyphenation requires a replacement or an addition or a change. If no new character is needed, the value is zero.
     * @type {Integer}
     */
    chHyph {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }
}
