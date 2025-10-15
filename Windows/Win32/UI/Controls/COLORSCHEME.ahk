#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\COLORREF.ahk

/**
 * Contains information for the drawing of buttons in a toolbar or rebar.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-colorscheme
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class COLORSCHEME extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value that represents the highlight color of the buttons. Use 
     * 					<b>CLR_DEFAULT</b> for the default highlight color.
     * @type {COLORREF}
     */
    clrBtnHighlight{
        get {
            if(!this.HasProp("__clrBtnHighlight"))
                this.__clrBtnHighlight := COLORREF(this.ptr + 4)
            return this.__clrBtnHighlight
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value that represents the shadow color of the buttons. Use 
     * 					<b>CLR_DEFAULT</b> for the default shadow color.
     * @type {COLORREF}
     */
    clrBtnShadow{
        get {
            if(!this.HasProp("__clrBtnShadow"))
                this.__clrBtnShadow := COLORREF(this.ptr + 8)
            return this.__clrBtnShadow
        }
    }
}
