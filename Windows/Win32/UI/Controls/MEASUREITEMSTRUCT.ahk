#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Informs the system of the dimensions of an owner-drawn control or menu item. This allows the system to process user interaction with the control correctly.
 * @remarks
 * 
 * The owner window of an owner-drawn control receives a pointer to the <b>MEASUREITEMSTRUCT</b> structure as the <i>lParam</i> parameter of a <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-measureitem">WM_MEASUREITEM</a> message. The owner-drawn control sends this message to its owner window when the control is created. The owner then fills in the appropriate members in the structure for the control and returns. This structure is common to all owner-drawn controls except the owner-drawn button control whose size is predetermined by its window. 
 * 
 * If an application does not fill the appropriate members of <b>MEASUREITEMSTRUCT</b>, the control or menu item may not be drawn properly.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-measureitemstruct
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class MEASUREITEMSTRUCT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The control type. This member can be one of the values shown in the following table. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODT_COMBOBOX"></a><a id="odt_combobox"></a><dl>
     * <dt><b>ODT_COMBOBOX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Owner-drawn combo box
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODT_LISTBOX"></a><a id="odt_listbox"></a><dl>
     * <dt><b>ODT_LISTBOX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Owner-drawn list box
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODT_LISTVIEW"></a><a id="odt_listview"></a><dl>
     * <dt><b>ODT_LISTVIEW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Owner-draw list-view control
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODT_MENU"></a><a id="odt_menu"></a><dl>
     * <dt><b>ODT_MENU</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Owner-drawn menu
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    CtlType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The identifier of the combo box or list box. This member is not used for a menu.
     * @type {Integer}
     */
    CtlID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The identifier for a menu item or the position of a list box or combo box item. This value is specified for a list box only if it has the <a href="https://docs.microsoft.com/windows/desktop/Controls/list-box-styles">LBS_OWNERDRAWVARIABLE</a> style; this value is specified for a combo box only if it has the <a href="https://docs.microsoft.com/windows/desktop/Controls/combo-box-styles">CBS_OWNERDRAWVARIABLE</a> style.
     * @type {Integer}
     */
    itemID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The width, in pixels, of a menu item. Before returning from the message, the owner of the owner-drawn menu item must fill this member.
     * @type {Integer}
     */
    itemWidth {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The height, in pixels, of an individual item in a list box or a menu. Before returning from the message, the owner of the owner-drawn combo box, list box, or menu item must fill out this member.
     * @type {Integer}
     */
    itemHeight {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG_PTR</a></b>
     * 
     * The application-defined value associated with the menu item. For a control, this member specifies the value last assigned to the list box or combo box by the <a href="https://docs.microsoft.com/windows/desktop/Controls/lb-setitemdata">LB_SETITEMDATA</a> or <a href="https://docs.microsoft.com/windows/desktop/Controls/cb-setitemdata">CB_SETITEMDATA</a> message. If the list box or combo box has the LB_HASSTRINGS or CB_HASSTRINGS style, this value is initially zero. Otherwise, this value is initially the value passed to the list box or combo box in the 
     * 					<i>lParam</i> parameter of one of the following messages: 
     * 					
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/cb-addstring">CB_ADDSTRING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/cb-insertstring">CB_INSERTSTRING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/lb-addstring">LB_ADDSTRING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/lb-insertstring">LB_INSERTSTRING</a>
     * </li>
     * </ul>
     * @type {Pointer}
     */
    itemData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
