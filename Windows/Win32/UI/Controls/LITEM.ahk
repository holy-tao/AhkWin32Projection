#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to set and retrieve information about a link item.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-litem
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LITEM extends Win32Struct
{
    static sizeof => 4280

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Combination of one or more of the following flags, describing the information to set or retrieve:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>LIF_ITEMINDEX</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieve the numeric item index. Items are always accessed by index, therefore you must always set this flag and assign a value to <b>iLink</b>. To obtain the item ID you must set both LIF_ITEMINDEX and LIF_ITEMID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>LIF_STATE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use <b>stateMask</b>  to get or set the state of the link.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>LIF_ITEMID</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specify the item by the ID value given in <b>szID</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>LIF_URL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set or get the URL for this item.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    mask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * Value of type <b>int</b> that contains the item index. This numeric index is used to access a SysLink control link.
     * @type {Integer}
     */
    iLink {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Combination of one or more of the following flags, describing the state of the item:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>LIS_ENABLED</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The link can respond to user input. This is the default unless the entire control was created with <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">WS_DISABLED</a>. In this case, all links are disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>LIS_FOCUSED</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The link has the keyboard focus. Pressing ENTER sends an NM_CLICK notification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>LIS_VISITED</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The link has been visited by the user. Changing the URL to one that has not been visited causes this flag to be cleared.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>LIS_HOTTRACK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Indicates that the syslink control will highlight in a different color (COLOR_HIGHLIGHT) when the mouse hovers over the control.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>LIS_DEFAULTCOLORS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enable custom text colors to be used.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    state {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Combination of flags describing which state item to get or set. Allowable items are identical to those allowed in <b>state</b>.
     * @type {Integer}
     */
    stateMask {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WCHAR</a>[MAX_LINKID_TEXT]</b>
     * 
     * <b>WCHAR</b> string that contains the ID name. The maximum number of characters in the array is MAX_LINKID_TEXT. The ID name cannot be used to access a SysLink control link. You use the item index to access the item.
     * @type {String}
     */
    szID {
        get => StrGet(this.ptr + 16, 47, "UTF-16")
        set => StrPut(value, this.ptr + 16, 47, "UTF-16")
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WCHAR</a>[L_MAX_URL_LENGTH]</b>
     * 
     * <b>WCHAR</b> string that contains the URL represented by the link. The maximum number of characters in the array is L_MAX_URL_LENGTH.
     * @type {String}
     */
    szUrl {
        get => StrGet(this.ptr + 112, 2083, "UTF-16")
        set => StrPut(value, this.ptr + 112, 2083, "UTF-16")
    }
}
