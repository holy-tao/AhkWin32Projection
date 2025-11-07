#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the punctuation used in a rich edit control.
 * @remarks
 * 
 * This structure is used only in Asian-language versions of the operating system.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-punctuation
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class PUNCTUATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of buffer pointed to by the 
     * 					<b>szPunctuation</b> member, in bytes.
     * @type {Integer}
     */
    iSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPSTR</a></b>
     * 
     * The buffer containing the punctuation characters.
     * @type {PSTR}
     */
    szPunctuation {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
