#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the display of groups in a list-view control.
 * @remarks
 * The width of a border determines the margins of the area within which items are placed. The top border is highlighted when the user moves the cursor over it, and when the user clicks on this border in a list that allows multiple selection, all items in the group are selected.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-lvgroupmetrics
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
     * @type {Integer}
     */
    crLeft {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the top border. Not implemented.
     * @type {Integer}
     */
    crTop {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the right border. Not implemented.
     * @type {Integer}
     */
    crRight {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the bottom border. Not implemented.
     * @type {Integer}
     */
    crBottom {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the header text. Not implemented.
     * @type {Integer}
     */
    crHeader {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the footer text. Not implemented.
     * @type {Integer}
     */
    crFooter {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
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
