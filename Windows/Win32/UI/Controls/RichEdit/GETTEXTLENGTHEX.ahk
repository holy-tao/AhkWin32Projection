#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about how the text length of a rich edit control should be calculated. This structure is passed in the wParam in the EM_GETTEXTLENGTHEX message.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-gettextlengthex
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class GETTEXTLENGTHEX extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Code page used in the translation. It is CP_ACP for ANSI Code Page and 1200 for Unicode.
     * @type {Integer}
     */
    codepage {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
