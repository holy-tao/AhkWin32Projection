#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Provides information that the owner window uses to determine how to paint an owner-drawn control or menu item.
 * @remarks
 * 
  * Some control types, such as status bars, do not set the value of <b>CtlType</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-drawitemstruct
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class DRAWITEMSTRUCT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @type {Integer}
     */
    CtlType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The identifier of the combo box, list box, button, or static control. This member is not used for a menu item.
     * @type {Integer}
     */
    CtlID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The menu item identifier for a menu item or the index of the item in a list box or combo box. For an empty list box or combo box, this member can be <c>-1</c>. This allows the application to draw only the focus rectangle at the coordinates specified by the <b>rcItem</b> member even though there are no items in the control. This indicates to the user whether the list box or combo box has the focus. How the bits are set in the <b>itemAction</b> member determines whether the rectangle is to be drawn as though the list box or combo box has the focus.
     * @type {Integer}
     */
    itemID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The required drawing action. This member can be one or more of the values. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODA_DRAWENTIRE"></a><a id="oda_drawentire"></a><dl>
     * <dt><b>ODA_DRAWENTIRE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entire control needs to be drawn.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODA_FOCUS"></a><a id="oda_focus"></a><dl>
     * <dt><b>ODA_FOCUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control has lost or gained the keyboard focus. The <b>itemState</b> member should be checked to determine whether the control has the focus.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODA_SELECT"></a><a id="oda_select"></a><dl>
     * <dt><b>ODA_SELECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The selection status has changed. The <b>itemState</b> member should be checked to determine the new selection state.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    itemAction {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The visual state of the item after the current drawing action takes place. This member can be a combination of the values shown in the following table. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODS_CHECKED"></a><a id="ods_checked"></a><dl>
     * <dt><b>ODS_CHECKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The menu item is to be checked. This bit is used only in a menu.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODS_COMBOBOXEDIT"></a><a id="ods_comboboxedit"></a><dl>
     * <dt><b>ODS_COMBOBOXEDIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drawing takes place in the selection field (edit control) of an owner-drawn combo box.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODS_DEFAULT"></a><a id="ods_default"></a><dl>
     * <dt><b>ODS_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item is the default item.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODS_DISABLED"></a><a id="ods_disabled"></a><dl>
     * <dt><b>ODS_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item is to be drawn as disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODS_FOCUS"></a><a id="ods_focus"></a><dl>
     * <dt><b>ODS_FOCUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item has the keyboard focus.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODS_GRAYED"></a><a id="ods_grayed"></a><dl>
     * <dt><b>ODS_GRAYED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item is to be grayed. This bit is used only in a menu.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODS_HOTLIGHT"></a><a id="ods_hotlight"></a><dl>
     * <dt><b>ODS_HOTLIGHT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item is being hot-tracked, that is, the item will be highlighted when the mouse is on the item.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODS_INACTIVE"></a><a id="ods_inactive"></a><dl>
     * <dt><b>ODS_INACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item is inactive and the window associated with the menu is inactive.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODS_NOACCEL"></a><a id="ods_noaccel"></a><dl>
     * <dt><b>ODS_NOACCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control is drawn without the keyboard accelerator cues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODS_NOFOCUSRECT"></a><a id="ods_nofocusrect"></a><dl>
     * <dt><b>ODS_NOFOCUSRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control is drawn without focus indicator cues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ODS_SELECTED"></a><a id="ods_selected"></a><dl>
     * <dt><b>ODS_SELECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The menu item's status is selected.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    itemState {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the control for combo boxes, list boxes, buttons, and static controls. For menus, this member is a handle to the menu that contains the item.
     * @type {Pointer<Void>}
     */
    hwndItem {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * A handle to a device context; this device context must be used when performing drawing operations on the control.
     * @type {Pointer<Void>}
     */
    hDC {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A rectangle that defines the boundaries of the control to be drawn. This rectangle is in the device context specified by the <b>hDC</b> member. The system automatically clips anything that the owner window draws in the device context for combo boxes, list boxes, and buttons, but does not clip menu items. When drawing menu items, the owner window must not draw outside the boundaries of the rectangle defined by the <b>rcItem</b> member.
     * @type {RECT}
     */
    rcItem{
        get {
            if(!this.HasProp("__rcItem"))
                this.__rcItem := RECT(this.ptr + 40)
            return this.__rcItem
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG_PTR</a></b>
     * 
     * The application-defined value associated with the menu item. For a control, this parameter specifies the value last assigned to the list box or combo box by the <a href="https://docs.microsoft.com/windows/desktop/Controls/lb-setitemdata">LB_SETITEMDATA</a> or <a href="https://docs.microsoft.com/windows/desktop/Controls/cb-setitemdata">CB_SETITEMDATA</a> message. If the list box or combo box has the <a href="https://docs.microsoft.com/windows/desktop/Controls/list-box-styles">LBS_HASSTRINGS</a> or <a href="https://docs.microsoft.com/windows/desktop/Controls/combo-box-styles">CBS_HASSTRINGS</a> style, this value is initially zero. Otherwise, this value is initially the value that was passed to the list box or combo box in the <i>lParam</i> parameter of one of the following messages: 
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
     * If <b>CtlType</b> is <b>ODT_BUTTON</b> or <b>ODT_STATIC</b>, <b>itemData</b> is zero.
     * @type {Pointer}
     */
    itemData {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
