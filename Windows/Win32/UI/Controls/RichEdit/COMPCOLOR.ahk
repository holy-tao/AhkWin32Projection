#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\COLORREF.ahk

/**
 * Contains color settings for a composition string.
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-compcolor
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class COMPCOLOR extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Color of text. To generate a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @type {COLORREF}
     */
    crText{
        get {
            if(!this.HasProp("__crText"))
                this.__crText := COLORREF(this.ptr + 0)
            return this.__crText
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Color of background. To generate a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @type {COLORREF}
     */
    crBackground{
        get {
            if(!this.HasProp("__crBackground"))
                this.__crBackground := COLORREF(this.ptr + 4)
            return this.__crBackground
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Character effect values as described for the 
     * 					<b>dwEffects</b> member in the <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charformata">CHARFORMAT</a> structure.
     * @type {Integer}
     */
    dwEffects {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
