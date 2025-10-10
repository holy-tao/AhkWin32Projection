#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information on a footer item.
 * @remarks
 * 
  * This structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-listview_getfooteritem">ListView_GetFooterItem</a> macro and the <a href="https://docs.microsoft.com/windows/desktop/Controls/lvm-getfooteritem">LVM_GETFOOTERITEM</a> message.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-lvfooteritem
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LVFOOTERITEM extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @type {Integer}
     */
    mask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * The index of the item.
     * @type {Integer}
     */
    iItem {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * A pointer to a null-terminated, Unicode buffer. The calling process is responsible for allocating the buffer.
     * @type {Pointer<Char>}
     */
    pszText {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * The number of <b>WCHAR</b><b>s</b> in the buffer pointed to by <b>pszText</b>,  including the terminating <b>NULL</b>.
     * @type {Integer}
     */
    cchTextMax {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Indicates the item's state. The <b>stateMask</b> member indicates the valid bits of this member. Currently, <b>state</b> must be set to the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LVFIS_FOCUSED"></a><a id="lvfis_focused"></a><dl>
     * <dt><b>LVFIS_FOCUSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Bit indicating focus state. Set if the item is in focus, otherwise cleared.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    state {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Value specifying which bits of the <b>state</b> member will be retrieved or modified. Currently, this value must be the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LVFIS_FOCUSED"></a><a id="lvfis_focused"></a><dl>
     * <dt><b>LVFIS_FOCUSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LVFIS_FOCUSED bit of member <b>state</b> is valid. For example, setting this member to LVFIS_FOCUSED will cause the focus state to be retrieved to member <b>state</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    stateMask {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
