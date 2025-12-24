#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow an application to add controls to a common file dialog.
 * @remarks
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nn-shobjidl-ifiledialogcontrolevents">IFileDialogControlEvents</a> is implemented
 * by the common file open dialog (CLSID_FileOpenDialog) and
 * file save dialog (CLSID_FileSaveDialog).
 * 
 * Controls are added to the dialog before the dialog is shown. Their layout is implied by the order in which they are added. Once the dialog is shown, controls cannot be added or removed, but the existing controls can be hidden or disabled at any time. Their labels can also be changed at any time.
 * 
 * Container controls are controls that can have items added to them. Container controls include combo boxes, menus, the drop-down list attached to the <b>Open</b> button, and any option button groups. The order that items appear in a container is the order in which they were added. There is no facility for reordering them. IDs are scoped to the parent control. Container controls, with the exception of menus, have a selected item.
 * 
 * Items with a container control cannot be changed after they have been created, except for their enabled and visible states. However, they can be added and removed at any time. For example, if you needed to change the text of a menu, you would have to remove the current menu and add another with the correct text.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifiledialogcustomize
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileDialogCustomize extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileDialogCustomize
     * @type {Guid}
     */
    static IID => Guid("{e6fdd21a-163f-4975-9c8c-a69f1ba37034}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableOpenDropDown", "AddMenu", "AddPushButton", "AddComboBox", "AddRadioButtonList", "AddCheckButton", "AddEditBox", "AddSeparator", "AddText", "SetControlLabel", "GetControlState", "SetControlState", "GetEditBoxText", "SetEditBoxText", "GetCheckButtonState", "SetCheckButtonState", "AddControlItem", "RemoveControlItem", "RemoveAllControlItems", "GetControlItemState", "SetControlItemState", "GetSelectedControlItem", "SetSelectedControlItem", "StartVisualGroup", "EndVisualGroup", "MakeProminent", "SetControlItemText"]

    /**
     * Enables a drop-down list on the Open or Save button in the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the drop-down list.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-enableopendropdown
     */
    EnableOpenDropDown(dwIDCtl) {
        result := ComCall(3, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * Adds a menu to the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the menu to add.
     * @param {PWSTR} pszLabel Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the menu name as a null-terminated Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addmenu
     */
    AddMenu(dwIDCtl, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(4, this, "uint", dwIDCtl, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * Adds a button to the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the button to add.
     * @param {PWSTR} pszLabel Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the button text as a null-terminated Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addpushbutton
     */
    AddPushButton(dwIDCtl, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(5, this, "uint", dwIDCtl, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * Adds a combo box to the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the combo box to add.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addcombobox
     */
    AddComboBox(dwIDCtl) {
        result := ComCall(6, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * Adds an option button (also known as radio button) group to the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the option button group to add.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addradiobuttonlist
     */
    AddRadioButtonList(dwIDCtl) {
        result := ComCall(7, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * Adds a check button (check box) to the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the check button to add.
     * @param {PWSTR} pszLabel Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the button text as a null-terminated Unicode string.
     * @param {BOOL} bChecked Type: <b>BOOL</b>
     * 
     * A <b>BOOL</b> indicating the current state of the check button. <b>TRUE</b> if checked; <b>FALSE</b> otherwise.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addcheckbutton
     */
    AddCheckButton(dwIDCtl, pszLabel, bChecked) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(8, this, "uint", dwIDCtl, "ptr", pszLabel, "int", bChecked, "HRESULT")
        return result
    }

    /**
     * Adds an edit box control to the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the edit box to add.
     * @param {PWSTR} pszText Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string that provides the default text displayed in the edit box.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addeditbox
     */
    AddEditBox(dwIDCtl, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(9, this, "uint", dwIDCtl, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * Adds a separator to the dialog, allowing a visual separation of controls.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The control ID of the separator.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addseparator
     */
    AddSeparator(dwIDCtl) {
        result := ComCall(10, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * Adds text content to the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the text to add.
     * @param {PWSTR} pszText Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the text as a null-terminated Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addtext
     */
    AddText(dwIDCtl, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(11, this, "uint", dwIDCtl, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * Sets the text associated with a control, such as button text or an edit box label.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the control whose text is to be changed.
     * @param {PWSTR} pszLabel Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the text as a null-terminated Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setcontrollabel
     */
    SetControlLabel(dwIDCtl, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(12, this, "uint", dwIDCtl, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * Gets the current visibility and enabled states of a given control.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the control in question.
     * @returns {Integer} Type: <b>CDCONTROLSTATEF*</b>
     * 
     * A pointer to a variable that receives one or more values from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb762483(v=vs.85)">CDCONTROLSTATE</a> enumeration that indicate the current state of the control.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-getcontrolstate
     */
    GetControlState(dwIDCtl) {
        result := ComCall(13, this, "uint", dwIDCtl, "int*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * Sets the current visibility and enabled states of a given control.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the control in question.
     * @param {Integer} dwState Type: <b>CDCONTROLSTATEF</b>
     * 
     * One or more values from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb762483(v=vs.85)">CDCONTROLSTATE</a> enumeration that indicate the current state of the control.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setcontrolstate
     */
    SetControlState(dwIDCtl, dwState) {
        result := ComCall(14, this, "uint", dwIDCtl, "int", dwState, "HRESULT")
        return result
    }

    /**
     * Gets the current text in an edit box control.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the edit box.
     * @returns {Pointer<Integer>} Type: <b>WCHAR**</b>
     * 
     * The address of a pointer to a buffer that receives the text as a null-terminated Unicode string.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-geteditboxtext
     */
    GetEditBoxText(dwIDCtl) {
        result := ComCall(15, this, "uint", dwIDCtl, "ptr*", &ppszText := 0, "HRESULT")
        return ppszText
    }

    /**
     * Sets the text in an edit box control found in the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the edit box.
     * @param {PWSTR} pszText Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the text as a null-terminated Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-seteditboxtext
     */
    SetEditBoxText(dwIDCtl, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(16, this, "uint", dwIDCtl, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * Gets the current state of a check button (check box) in the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the check box.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * The address of a <b>BOOL</b> value that indicates whether the box is checked. <b>TRUE</b> means checked; <b>FALSE</b>, unchecked.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-getcheckbuttonstate
     */
    GetCheckButtonState(dwIDCtl) {
        result := ComCall(17, this, "uint", dwIDCtl, "int*", &pbChecked := 0, "HRESULT")
        return pbChecked
    }

    /**
     * Sets the state of a check button (check box) in the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the check box.
     * @param {BOOL} bChecked Type: <b>BOOL</b>
     * 
     * A <b>BOOL</b> value that indicates whether the box is checked. <b>TRUE</b> means checked; <b>FALSE</b>, unchecked.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setcheckbuttonstate
     */
    SetCheckButtonState(dwIDCtl, bChecked) {
        result := ComCall(18, this, "uint", dwIDCtl, "int", bChecked, "HRESULT")
        return result
    }

    /**
     * Adds an item to a container control in the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     *  The ID of the container control to which the item is to be added.
     * @param {Integer} dwIDItem Type: <b>DWORD</b>
     * 
     * The ID of the item.
     * @param {PWSTR} pszLabel Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the item's text, which can be either a label or, in the case of a drop-down list, the item itself. This text is a null-terminated Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addcontrolitem
     */
    AddControlItem(dwIDCtl, dwIDItem, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(19, this, "uint", dwIDCtl, "uint", dwIDItem, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * Removes an item from a container control in the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the container control from which the item is to be removed.
     * @param {Integer} dwIDItem Type: <b>DWORD</b>
     * 
     * The ID of the item.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-removecontrolitem
     */
    RemoveControlItem(dwIDCtl, dwIDItem) {
        result := ComCall(20, this, "uint", dwIDCtl, "uint", dwIDItem, "HRESULT")
        return result
    }

    /**
     * Not implemented.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the container control from which to remove the items.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-removeallcontrolitems
     */
    RemoveAllControlItems(dwIDCtl) {
        result := ComCall(21, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * Gets the current state of an item in a container control found in the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the container control.
     * @param {Integer} dwIDItem Type: <b>DWORD</b>
     * 
     * The ID of the item.
     * @returns {Integer} Type: <b>CDCONTROLSTATEF*</b>
     * 
     * A pointer to a variable that receives one of more values from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb762483(v=vs.85)">CDCONTROLSTATE</a> enumeration that indicate the current state of the control.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-getcontrolitemstate
     */
    GetControlItemState(dwIDCtl, dwIDItem) {
        result := ComCall(22, this, "uint", dwIDCtl, "uint", dwIDItem, "int*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * Sets the current state of an item in a container control found in the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the container control.
     * @param {Integer} dwIDItem Type: <b>DWORD</b>
     * 
     * The ID of the item.
     * @param {Integer} dwState Type: <b>CDCONTROLSTATEF</b>
     * 
     * One or more values from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb762483(v=vs.85)">CDCONTROLSTATE</a> enumeration that indicate the new state of the control.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setcontrolitemstate
     */
    SetControlItemState(dwIDCtl, dwIDItem, dwState) {
        result := ComCall(23, this, "uint", dwIDCtl, "uint", dwIDItem, "int", dwState, "HRESULT")
        return result
    }

    /**
     * Gets a particular item from specified container controls in the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the container control.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     *  The ID of the item that the user selected in the control.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-getselectedcontrolitem
     */
    GetSelectedControlItem(dwIDCtl) {
        result := ComCall(24, this, "uint", dwIDCtl, "uint*", &pdwIDItem := 0, "HRESULT")
        return pdwIDItem
    }

    /**
     * Sets the selected state of a particular item in an option button group or a combo box found in the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the container control.
     * @param {Integer} dwIDItem Type: <b>DWORD</b>
     * 
     * The ID of the item to display as selected in the control.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setselectedcontrolitem
     */
    SetSelectedControlItem(dwIDCtl, dwIDItem) {
        result := ComCall(25, this, "uint", dwIDCtl, "uint", dwIDItem, "HRESULT")
        return result
    }

    /**
     * Declares a visual group in the dialog. Subsequent calls to any &quot;add&quot; method add those elements to this group.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the visual group.
     * @param {PWSTR} pszLabel Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains text, as a null-terminated Unicode string, that appears next to the visual group.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-startvisualgroup
     */
    StartVisualGroup(dwIDCtl, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(26, this, "uint", dwIDCtl, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * Stops the addition of elements to a visual group in the dialog.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-endvisualgroup
     */
    EndVisualGroup() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * Places a control in the dialog so that it stands out compared to other added controls.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the control.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-makeprominent
     */
    MakeProminent(dwIDCtl) {
        result := ComCall(28, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * Sets the text of a control item. For example, the text that accompanies a radio button or an item in a menu.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the container control.
     * @param {Integer} dwIDItem Type: <b>DWORD</b>
     * 
     * The ID of the item.
     * @param {PWSTR} pszLabel Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated buffer that contains a Unicode string with the text.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setcontrolitemtext
     */
    SetControlItemText(dwIDCtl, dwIDItem, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(29, this, "uint", dwIDCtl, "uint", dwIDItem, "ptr", pszLabel, "HRESULT")
        return result
    }
}
