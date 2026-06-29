#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRAWITEMSTRUCT_CTL_TYPE.ahk" { DRAWITEMSTRUCT_CTL_TYPE }

/**
 * Informs the system of the dimensions of an owner-drawn control or menu item. This allows the system to process user interaction with the control correctly.
 * @remarks
 * The owner window of an owner-drawn control receives a pointer to the <b>MEASUREITEMSTRUCT</b> structure as the <i>lParam</i> parameter of a <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-measureitem">WM_MEASUREITEM</a> message. The owner-drawn control sends this message to its owner window when the control is created. The owner then fills in the appropriate members in the structure for the control and returns. This structure is common to all owner-drawn controls except the owner-drawn button control whose size is predetermined by its window. 
 * 
 * If an application does not fill the appropriate members of <b>MEASUREITEMSTRUCT</b>, the control or menu item may not be drawn properly.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-measureitemstruct
 * @namespace Windows.Win32.UI.Controls
 */
export default struct MEASUREITEMSTRUCT {
    #StructPack 8

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
     */
    CtlType : DRAWITEMSTRUCT_CTL_TYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The identifier of the combo box or list box. This member is not used for a menu.
     */
    CtlID : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The identifier for a menu item or the position of a list box or combo box item. This value is specified for a list box only if it has the <a href="https://docs.microsoft.com/windows/desktop/Controls/list-box-styles">LBS_OWNERDRAWVARIABLE</a> style; this value is specified for a combo box only if it has the <a href="https://docs.microsoft.com/windows/desktop/Controls/combo-box-styles">CBS_OWNERDRAWVARIABLE</a> style.
     */
    itemID : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The width, in pixels, of a menu item. Before returning from the message, the owner of the owner-drawn menu item must fill this member.
     */
    itemWidth : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The height, in pixels, of an individual item in a list box or a menu. Before returning from the message, the owner of the owner-drawn combo box, list box, or menu item must fill out this member.
     */
    itemHeight : UInt32

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
     */
    itemData : IntPtr

}
