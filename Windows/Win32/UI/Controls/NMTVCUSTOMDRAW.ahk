#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include ..\..\Graphics\Gdi\HDC.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\NMCUSTOMDRAW.ahk

/**
 * Contains information specific to an NM_CUSTOMDRAW (tree view) notification code sent by a tree-view control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtvcustomdraw
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMTVCUSTOMDRAW extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomdraw">NMCUSTOMDRAW</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomdraw">NMCUSTOMDRAW</a> structure that contains general custom draw information.
     * @type {NMCUSTOMDRAW}
     */
    nmcd{
        get {
            if(!this.HasProp("__nmcd"))
                this.__nmcd := NMCUSTOMDRAW(this.ptr + 0)
            return this.__nmcd
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value representing the color that will be used to display text foreground in the tree-view control.
     * @type {Integer}
     */
    clrText {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value representing the color that will be used to display text background in the tree-view control.
     * @type {Integer}
     */
    clrTextBk {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.71</a>. Zero-based level of the item being drawn. The root item is at level zero, a child of the root item is at level one, and so on.
     * @type {Integer}
     */
    iLevel {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }
}
