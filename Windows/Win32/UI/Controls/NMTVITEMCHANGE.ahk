#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\HTREEITEM.ahk" { HTREEITEM }

/**
 * Contains information on a tree-view item change. This structure is sent with the TVN_ITEMCHANGED and TVN_ITEMCHANGING notifications.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtvitemchange
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMTVITEMCHANGE {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification.
     */
    hdr : NMHDR

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
     */
    uChanged : UInt32

    /**
     * Type: <b>HTREEITEM</b>
     * 
     * Handle to the changed tree-view item.
     */
    hItem : HTREEITEM

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flag that specifies the new item state.
     */
    uStateNew : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flag that specifies the item's previous state.
     */
    uStateOld : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Reserved for application specific data. For example, a value to associate with the item.
     */
    lParam : LPARAM

}
