#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\POINT.ahk
#Include ..\..\Foundation\LPARAM.ahk

/**
 * Contains information about an LVN_ITEMACTIVATE notification code.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmitemactivate
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMITEMACTIVATE extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification code.
     * @type {NMHDR}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := NMHDR(this.ptr + 0)
            return this.__hdr
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * Index of the list-view item. If the item index is not used for the notification, this member will contain -1.
     * @type {Integer}
     */
    iItem {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * One-based index of the subitem. If the subitem index is not used for the notification or the notification does not apply to a subitem, this member will contain zero.
     * @type {Integer}
     */
    iSubItem {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * New item state. This member is zero for notification codes that do not use it.
     * @type {Integer}
     */
    uNewState {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Old item state. This member is zero for notification codes that do not use it.
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
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that indicates the location at which the event occurred, in client coordinates. This member is undefined for notification codes that do not use it.
     * @type {POINT}
     */
    ptAction{
        get {
            if(!this.HasProp("__ptAction"))
                this.__ptAction := POINT(this.ptr + 48)
            return this.__ptAction
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Application-defined value of the item. This member is undefined for notification codes that do not use it.
     * @type {LPARAM}
     */
    lParam{
        get {
            if(!this.HasProp("__lParam"))
                this.__lParam := LPARAM(this.ptr + 56)
            return this.__lParam
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Modifier keys that were pressed at the time of the activation. This member contains zero or a combination of the following flags: 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LVKF_ALT"></a><a id="lvkf_alt"></a><dl>
     * <dt><b>LVKF_ALT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  key is pressed. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LVKF_CONTROL"></a><a id="lvkf_control"></a><dl>
     * <dt><b>LVKF_CONTROL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  key is pressed. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LVKF_SHIFT"></a><a id="lvkf_shift"></a><dl>
     * <dt><b>LVKF_SHIFT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  key is pressed. 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    uKeyFlags {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
