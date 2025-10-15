#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\COLORREF.ahk

/**
 * Contains information about the display of groups in a list-view control.
 * @remarks
 * 
  * The width of a border determines the margins of the area within which items are placed. The top border is highlighted when the user moves the cursor over it, and when the user clicks on this border in a list that allows multiple selection, all items in the group are selected.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-lvgroupmetrics
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LVGROUPMETRICS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the <b>LVGROUPMETRICS</b> structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @type {Integer}
     */
    mask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the width of the left border in icon, small icon, or tile view.
     * @type {Integer}
     */
    Left {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the width of the top border in all group views.
     * @type {Integer}
     */
    Top {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the width of the right border in icon, small icon, or tile view.
     * @type {Integer}
     */
    Right {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the width of the bottom border in all group views.
     * @type {Integer}
     */
    Bottom {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the left border. Not implemented.
     * @type {COLORREF}
     */
    crLeft{
        get {
            if(!this.HasProp("__crLeft"))
                this.__crLeft := COLORREF(this.ptr + 24)
            return this.__crLeft
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the top border. Not implemented.
     * @type {COLORREF}
     */
    crTop{
        get {
            if(!this.HasProp("__crTop"))
                this.__crTop := COLORREF(this.ptr + 28)
            return this.__crTop
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the right border. Not implemented.
     * @type {COLORREF}
     */
    crRight{
        get {
            if(!this.HasProp("__crRight"))
                this.__crRight := COLORREF(this.ptr + 32)
            return this.__crRight
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the bottom border. Not implemented.
     * @type {COLORREF}
     */
    crBottom{
        get {
            if(!this.HasProp("__crBottom"))
                this.__crBottom := COLORREF(this.ptr + 36)
            return this.__crBottom
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the header text. Not implemented.
     * @type {COLORREF}
     */
    crHeader{
        get {
            if(!this.HasProp("__crHeader"))
                this.__crHeader := COLORREF(this.ptr + 40)
            return this.__crHeader
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the footer text. Not implemented.
     * @type {COLORREF}
     */
    crFooter{
        get {
            if(!this.HasProp("__crFooter"))
                this.__crFooter := COLORREF(this.ptr + 44)
            return this.__crFooter
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 48
    }
}
