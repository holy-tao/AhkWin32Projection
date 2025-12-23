#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a menu item in a menu template.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-menuitemtemplate
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MENUITEMTEMPLATE extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * Type: <b>WORD</b>
     * 
     * One or more of the following predefined menu options that control the appearance of the menu item as shown in the following table. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CHECKED"></a><a id="mf_checked"></a><dl>
     * <dt><b>MF_CHECKED</b></dt>
     * <dt>0x00000008L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the menu item has a check mark next to it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_GRAYED"></a><a id="mf_grayed"></a><dl>
     * <dt><b>MF_GRAYED</b></dt>
     * <dt>0x00000001L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the menu item is initially inactive and drawn with a gray effect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_HELP"></a><a id="mf_help"></a><dl>
     * <dt><b>MF_HELP</b></dt>
     * <dt>0x00004000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the menu item has a vertical separator to its left.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_MENUBARBREAK"></a><a id="mf_menubarbreak"></a><dl>
     * <dt><b>MF_MENUBARBREAK</b></dt>
     * <dt>0x00000020L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the menu item is placed in a new column. The old and new columns are separated by a bar.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_MENUBREAK"></a><a id="mf_menubreak"></a><dl>
     * <dt><b>MF_MENUBREAK</b></dt>
     * <dt>0x00000040L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the menu item is placed in a new column.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_OWNERDRAW"></a><a id="mf_ownerdraw"></a><dl>
     * <dt><b>MF_OWNERDRAW</b></dt>
     * <dt>0x00000100L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the owner window of the menu is responsible for drawing all visual aspects of the menu item, including highlighted, selected, and inactive states. This option is not valid for an item in a menu bar.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_POPUP"></a><a id="mf_popup"></a><dl>
     * <dt><b>MF_POPUP</b></dt>
     * <dt>0x00000010L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the item is one that opens a drop-down menu or submenu.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    mtOption {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The menu item identifier of a command item; a command item sends a command message to its owner window. The <b>MENUITEMTEMPLATE</b> structure for an item that opens a drop-down menu or submenu does not contain the 
     * 					<b>mtID</b> member.
     * @type {Integer}
     */
    mtID {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type: <b>WCHAR[1]</b>
     * 
     * The menu item.
     * @type {String}
     */
    mtString {
        get => StrGet(this.ptr + 4, 0, "UTF-16")
        set => StrPut(value, this.ptr + 4, 0, "UTF-16")
    }
}
