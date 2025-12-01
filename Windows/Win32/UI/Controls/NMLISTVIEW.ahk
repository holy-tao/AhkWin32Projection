#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains information about a list-view notification message. This structure is the same as the NM_LISTVIEW structure but has been renamed to fit standard naming conventions.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlistview
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMLISTVIEW extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification message.
     * @type {NMHDR}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := NMHDR(0, this)
            return this.__hdr
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * Identifies the list-view item, or -1 if not used.
     * @type {Integer}
     */
    iItem {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * Identifies the subitem, or zero if none.
     * @type {Integer}
     */
    iSubItem {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * New item state. This member is zero for notification messages that do not use it. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/Controls/list-view-item-states">List-View Item States</a>.
     * @type {Integer}
     */
    uNewState {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Old item state. This member is zero for notification messages that do not use it. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/Controls/list-view-item-states">List-View Item States</a>.
     * @type {Integer}
     */
    uOldState {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Set of flags that indicate the item attributes that have changed. This member is zero for notifications that do not use it. Otherwise, it can have the same values as the 
     * 					<b>mask</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvitema">LVITEM</a> structure.
     * @type {Integer}
     */
    uChanged {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that indicates the location at which the event occurred. This member is undefined for notification messages that do not use it.
     * @type {POINT}
     */
    ptAction{
        get {
            if(!this.HasProp("__ptAction"))
                this.__ptAction := POINT(48, this)
            return this.__ptAction
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Application-defined value of the item. This member is undefined for notification messages that do not use it.
     * @type {LPARAM}
     */
    lParam {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
