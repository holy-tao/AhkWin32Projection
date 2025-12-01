#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk

/**
 * Contains information on a tree-view item change. This structure is sent with the TVN_ITEMCHANGED and TVN_ITEMCHANGING notifications.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtvitemchange
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMTVITEMCHANGE extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the attribute. The only supported attribute is state. <b>uChanged</b> must have the following value:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>TVIF_STATE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The change is the state attribute.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    uChanged {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>HTREEITEM</b>
     * 
     * Handle to the changed tree-view item.
     * @type {HTREEITEM}
     */
    hItem {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flag that specifies the new item state.
     * @type {Integer}
     */
    uStateNew {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flag that specifies the item's previous state.
     * @type {Integer}
     */
    uStateOld {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Reserved for application specific data. For example, a value to associate with the item.
     * @type {LPARAM}
     */
    lParam {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
