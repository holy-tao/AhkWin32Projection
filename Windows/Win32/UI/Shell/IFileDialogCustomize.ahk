#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CDCONTROLSTATEF.ahk" { CDCONTROLSTATEF }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that allow an application to add controls to a common file dialog.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifiledialogcustomize
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IFileDialogCustomize extends IUnknown {
    /**
     * The interface identifier for IFileDialogCustomize
     * @type {Guid}
     */
    static IID := Guid("{e6fdd21a-163f-4975-9c8c-a69f1ba37034}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFileDialogCustomize interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnableOpenDropDown     : IntPtr
        AddMenu                : IntPtr
        AddPushButton          : IntPtr
        AddComboBox            : IntPtr
        AddRadioButtonList     : IntPtr
        AddCheckButton         : IntPtr
        AddEditBox             : IntPtr
        AddSeparator           : IntPtr
        AddText                : IntPtr
        SetControlLabel        : IntPtr
        GetControlState        : IntPtr
        SetControlState        : IntPtr
        GetEditBoxText         : IntPtr
        SetEditBoxText         : IntPtr
        GetCheckButtonState    : IntPtr
        SetCheckButtonState    : IntPtr
        AddControlItem         : IntPtr
        RemoveControlItem      : IntPtr
        RemoveAllControlItems  : IntPtr
        GetControlItemState    : IntPtr
        SetControlItemState    : IntPtr
        GetSelectedControlItem : IntPtr
        SetSelectedControlItem : IntPtr
        StartVisualGroup       : IntPtr
        EndVisualGroup         : IntPtr
        MakeProminent          : IntPtr
        SetControlItemText     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFileDialogCustomize.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables a drop-down list on the Open or Save button in the dialog.
     * @remarks
     * The Open or Save button label takes on the text of the first item in the drop-down. This overrides any label set by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setokbuttonlabel">IFileDialog::SetOkButtonLabel</a>.
     * 
     *  Use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addcontrolitem">IFileDialogCustomize::AddControlItem</a> to add items to the drop-down.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the drop-down list.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-enableopendropdown
     */
    EnableOpenDropDown(dwIDCtl) {
        result := ComCall(3, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * Adds a menu to the dialog.
     * @remarks
     * The default state for this control is enabled and visible.
     * 
     * To add items to this control, use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addcontrolitem">IFileDialogCustomize::AddControlItem</a>.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the menu to add.
     * @param {PWSTR} pszLabel Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the menu name as a null-terminated Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addmenu
     */
    AddMenu(dwIDCtl, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(4, this, "uint", dwIDCtl, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * Adds a button to the dialog.
     * @remarks
     * The default state for this control is enabled and visible.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the button to add.
     * @param {PWSTR} pszLabel Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the button text as a null-terminated Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addpushbutton
     */
    AddPushButton(dwIDCtl, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(5, this, "uint", dwIDCtl, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * Adds a combo box to the dialog.
     * @remarks
     * The default state for this control is enabled and visible.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the combo box to add.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addcombobox
     */
    AddComboBox(dwIDCtl) {
        result := ComCall(6, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * Adds an option button (also known as radio button) group to the dialog.
     * @remarks
     * The default state for this control is enabled and visible.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the option button group to add.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addradiobuttonlist
     */
    AddRadioButtonList(dwIDCtl) {
        result := ComCall(7, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * Adds a check button (check box) to the dialog.
     * @remarks
     * The default state for this control is enabled and visible.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addcheckbutton
     */
    AddCheckButton(dwIDCtl, pszLabel, bChecked) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(8, this, "uint", dwIDCtl, "ptr", pszLabel, BOOL, bChecked, "HRESULT")
        return result
    }

    /**
     * Adds an edit box control to the dialog.
     * @remarks
     * The default state for this control is enabled and visible.
     * 
     * To add a label next to the edit box, place it in a visual group with <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-startvisualgroup">IFileDialogCustomize::StartVisualGroup</a>.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the edit box to add.
     * @param {PWSTR} pszText Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string that provides the default text displayed in the edit box.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addeditbox
     */
    AddEditBox(dwIDCtl, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(9, this, "uint", dwIDCtl, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * Adds a separator to the dialog, allowing a visual separation of controls.
     * @remarks
     * The default state for this control is enabled and visible.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The control ID of the separator.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addseparator
     */
    AddSeparator(dwIDCtl) {
        result := ComCall(10, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * Adds text content to the dialog.
     * @remarks
     * The default state for this control is enabled and visible.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the text to add.
     * @param {PWSTR} pszText Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the text as a null-terminated Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addtext
     */
    AddText(dwIDCtl, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(11, this, "uint", dwIDCtl, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * Sets the text associated with a control, such as button text or an edit box label.
     * @remarks
     * Control labels can be changed at any time, including when the dialog is visible.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the control whose text is to be changed.
     * @param {PWSTR} pszLabel Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the text as a null-terminated Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setcontrollabel
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
     * @returns {CDCONTROLSTATEF} Type: <b>CDCONTROLSTATEF*</b>
     * 
     * A pointer to a variable that receives one or more values from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb762483(v=vs.85)">CDCONTROLSTATE</a> enumeration that indicate the current state of the control.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-getcontrolstate
     */
    GetControlState(dwIDCtl) {
        result := ComCall(13, this, "uint", dwIDCtl, "int*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * Sets the current visibility and enabled states of a given control.
     * @remarks
     * When the dialog is shown, controls cannot be added or removed, but the existing controls can be hidden or disabled at any time.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the control in question.
     * @param {CDCONTROLSTATEF} dwState Type: <b>CDCONTROLSTATEF</b>
     * 
     * One or more values from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb762483(v=vs.85)">CDCONTROLSTATE</a> enumeration that indicate the current state of the control.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setcontrolstate
     */
    SetControlState(dwIDCtl, dwState) {
        result := ComCall(14, this, "uint", dwIDCtl, CDCONTROLSTATEF, dwState, "HRESULT")
        return result
    }

    /**
     * Gets the current text in an edit box control.
     * @remarks
     * It is the responsibility of the calling application to free the buffer referenced by <i>ppszText</i> when it is no longer needed. Use <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to free the buffer.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the edit box.
     * @returns {Pointer<Integer>} Type: <b>WCHAR**</b>
     * 
     * The address of a pointer to a buffer that receives the text as a null-terminated Unicode string.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-geteditboxtext
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-seteditboxtext
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-getcheckbuttonstate
     */
    GetCheckButtonState(dwIDCtl) {
        result := ComCall(17, this, "uint", dwIDCtl, BOOL.Ptr, &pbChecked := 0, "HRESULT")
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setcheckbuttonstate
     */
    SetCheckButtonState(dwIDCtl, bChecked) {
        result := ComCall(18, this, "uint", dwIDCtl, BOOL, bChecked, "HRESULT")
        return result
    }

    /**
     * Adds an item to a container control in the dialog.
     * @remarks
     * The default state for this item is enabled and visible. Items in control groups cannot be changed after they have been created, with the exception of their enabled and visible states.
     * 
     * Container controls include option button groups, combo boxes, drop-down lists on the <b>Open</b> or <b>Save</b> button, and menus.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addcontrolitem
     */
    AddControlItem(dwIDCtl, dwIDItem, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(19, this, "uint", dwIDCtl, "uint", dwIDItem, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * Removes an item from a container control in the dialog.
     * @remarks
     * Container controls include option button groups, combo boxes, drop-down lists on the <b>Open</b> or <b>Save</b> button, and menus.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the container control from which the item is to be removed.
     * @param {Integer} dwIDItem Type: <b>DWORD</b>
     * 
     * The ID of the item.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-removecontrolitem
     */
    RemoveControlItem(dwIDCtl, dwIDItem) {
        result := ComCall(20, this, "uint", dwIDCtl, "uint", dwIDItem, "HRESULT")
        return result
    }

    /**
     * Not implemented. (IFileDialogCustomize.RemoveAllControlItems)
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the container control from which to remove the items.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-removeallcontrolitems
     */
    RemoveAllControlItems(dwIDCtl) {
        result := ComCall(21, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * Gets the current state of an item in a container control found in the dialog.
     * @remarks
     * The default state of a control item is enabled and visible. Items in control groups cannot be changed after they have been created, with the exception of their enabled and visible states.
     * 
     * Container controls include option button groups, combo boxes, drop-down lists on the <b>Open</b> or <b>Save</b> button, and menus.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the container control.
     * @param {Integer} dwIDItem Type: <b>DWORD</b>
     * 
     * The ID of the item.
     * @returns {CDCONTROLSTATEF} Type: <b>CDCONTROLSTATEF*</b>
     * 
     * A pointer to a variable that receives one of more values from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb762483(v=vs.85)">CDCONTROLSTATE</a> enumeration that indicate the current state of the control.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-getcontrolitemstate
     */
    GetControlItemState(dwIDCtl, dwIDItem) {
        result := ComCall(22, this, "uint", dwIDCtl, "uint", dwIDItem, "int*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * Sets the current state of an item in a container control found in the dialog.
     * @remarks
     * The default state of a control item is enabled and visible. Items in control groups cannot be changed after they have been created, with the exception of their enabled and visible states.
     * 
     * Container controls include option button groups, combo boxes, drop-down lists on the <b>Open</b> or <b>Save</b> button, and menus.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the container control.
     * @param {Integer} dwIDItem Type: <b>DWORD</b>
     * 
     * The ID of the item.
     * @param {CDCONTROLSTATEF} dwState Type: <b>CDCONTROLSTATEF</b>
     * 
     * One or more values from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb762483(v=vs.85)">CDCONTROLSTATE</a> enumeration that indicate the new state of the control.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setcontrolitemstate
     */
    SetControlItemState(dwIDCtl, dwIDItem, dwState) {
        result := ComCall(23, this, "uint", dwIDCtl, "uint", dwIDItem, CDCONTROLSTATEF, dwState, "HRESULT")
        return result
    }

    /**
     * Gets a particular item from specified container controls in the dialog.
     * @remarks
     * To determine the user's final choice, this method can be called on option button groups, combo boxes, and drop-down lists on the <b>Open</b> or <b>Save</b> button after the dialog has closed. This method cannot be called on menus.
     * 
     * For option button groups and combo boxes, this method can also be called while the dialog is showing, to determine the current choice.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the container control.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     *  The ID of the item that the user selected in the control.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-getselectedcontrolitem
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setselectedcontrolitem
     */
    SetSelectedControlItem(dwIDCtl, dwIDItem) {
        result := ComCall(25, this, "uint", dwIDCtl, "uint", dwIDItem, "HRESULT")
        return result
    }

    /**
     * Declares a visual group in the dialog. Subsequent calls to any &quot;add&quot; method add those elements to this group.
     * @remarks
     * Controls will continue to be added to this visual group until you call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-endvisualgroup">IFileDialogCustomize::EndVisualGroup</a>.
     *               
     * 
     * A visual group can be hidden and disabled like any other control, except that doing so affects all of the controls within it. Individual members of the visual group can also be hidden and disabled singly.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the visual group.
     * @param {PWSTR} pszLabel Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains text, as a null-terminated Unicode string, that appears next to the visual group.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-startvisualgroup
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-endvisualgroup
     */
    EndVisualGroup() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * Places a control in the dialog so that it stands out compared to other added controls.
     * @remarks
     * This method causes the control to be placed near the <b>Open</b> or <b>Save</b> button instead of being grouped with the rest of the custom controls.
     * 
     * Only check buttons (check boxes), push buttons, combo boxes, and menus—or a visual group that contains only a single item of one of those types—can be made prominent.
     * 
     * Only one control can be marked in this way. If a dialog has only one added control, that control is marked as prominent by default.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the control.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-makeprominent
     */
    MakeProminent(dwIDCtl) {
        result := ComCall(28, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * Sets the text of a control item. For example, the text that accompanies a radio button or an item in a menu.
     * @remarks
     * The default state of a control item is enabled and visible. Items in control groups cannot be changed after they have been created, with the exception of their enabled and visible states.
     * 
     * Container controls include option button groups, combo boxes, drop-down lists on the <b>Open</b> or <b>Save</b> button, and menus.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setcontrolitemtext
     */
    SetControlItemText(dwIDCtl, dwIDItem, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(29, this, "uint", dwIDCtl, "uint", dwIDItem, "ptr", pszLabel, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFileDialogCustomize.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnableOpenDropDown := CallbackCreate(GetMethod(implObj, "EnableOpenDropDown"), flags, 2)
        this.vtbl.AddMenu := CallbackCreate(GetMethod(implObj, "AddMenu"), flags, 3)
        this.vtbl.AddPushButton := CallbackCreate(GetMethod(implObj, "AddPushButton"), flags, 3)
        this.vtbl.AddComboBox := CallbackCreate(GetMethod(implObj, "AddComboBox"), flags, 2)
        this.vtbl.AddRadioButtonList := CallbackCreate(GetMethod(implObj, "AddRadioButtonList"), flags, 2)
        this.vtbl.AddCheckButton := CallbackCreate(GetMethod(implObj, "AddCheckButton"), flags, 4)
        this.vtbl.AddEditBox := CallbackCreate(GetMethod(implObj, "AddEditBox"), flags, 3)
        this.vtbl.AddSeparator := CallbackCreate(GetMethod(implObj, "AddSeparator"), flags, 2)
        this.vtbl.AddText := CallbackCreate(GetMethod(implObj, "AddText"), flags, 3)
        this.vtbl.SetControlLabel := CallbackCreate(GetMethod(implObj, "SetControlLabel"), flags, 3)
        this.vtbl.GetControlState := CallbackCreate(GetMethod(implObj, "GetControlState"), flags, 3)
        this.vtbl.SetControlState := CallbackCreate(GetMethod(implObj, "SetControlState"), flags, 3)
        this.vtbl.GetEditBoxText := CallbackCreate(GetMethod(implObj, "GetEditBoxText"), flags, 3)
        this.vtbl.SetEditBoxText := CallbackCreate(GetMethod(implObj, "SetEditBoxText"), flags, 3)
        this.vtbl.GetCheckButtonState := CallbackCreate(GetMethod(implObj, "GetCheckButtonState"), flags, 3)
        this.vtbl.SetCheckButtonState := CallbackCreate(GetMethod(implObj, "SetCheckButtonState"), flags, 3)
        this.vtbl.AddControlItem := CallbackCreate(GetMethod(implObj, "AddControlItem"), flags, 4)
        this.vtbl.RemoveControlItem := CallbackCreate(GetMethod(implObj, "RemoveControlItem"), flags, 3)
        this.vtbl.RemoveAllControlItems := CallbackCreate(GetMethod(implObj, "RemoveAllControlItems"), flags, 2)
        this.vtbl.GetControlItemState := CallbackCreate(GetMethod(implObj, "GetControlItemState"), flags, 4)
        this.vtbl.SetControlItemState := CallbackCreate(GetMethod(implObj, "SetControlItemState"), flags, 4)
        this.vtbl.GetSelectedControlItem := CallbackCreate(GetMethod(implObj, "GetSelectedControlItem"), flags, 3)
        this.vtbl.SetSelectedControlItem := CallbackCreate(GetMethod(implObj, "SetSelectedControlItem"), flags, 3)
        this.vtbl.StartVisualGroup := CallbackCreate(GetMethod(implObj, "StartVisualGroup"), flags, 3)
        this.vtbl.EndVisualGroup := CallbackCreate(GetMethod(implObj, "EndVisualGroup"), flags, 1)
        this.vtbl.MakeProminent := CallbackCreate(GetMethod(implObj, "MakeProminent"), flags, 2)
        this.vtbl.SetControlItemText := CallbackCreate(GetMethod(implObj, "SetControlItemText"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnableOpenDropDown)
        CallbackFree(this.vtbl.AddMenu)
        CallbackFree(this.vtbl.AddPushButton)
        CallbackFree(this.vtbl.AddComboBox)
        CallbackFree(this.vtbl.AddRadioButtonList)
        CallbackFree(this.vtbl.AddCheckButton)
        CallbackFree(this.vtbl.AddEditBox)
        CallbackFree(this.vtbl.AddSeparator)
        CallbackFree(this.vtbl.AddText)
        CallbackFree(this.vtbl.SetControlLabel)
        CallbackFree(this.vtbl.GetControlState)
        CallbackFree(this.vtbl.SetControlState)
        CallbackFree(this.vtbl.GetEditBoxText)
        CallbackFree(this.vtbl.SetEditBoxText)
        CallbackFree(this.vtbl.GetCheckButtonState)
        CallbackFree(this.vtbl.SetCheckButtonState)
        CallbackFree(this.vtbl.AddControlItem)
        CallbackFree(this.vtbl.RemoveControlItem)
        CallbackFree(this.vtbl.RemoveAllControlItems)
        CallbackFree(this.vtbl.GetControlItemState)
        CallbackFree(this.vtbl.SetControlItemState)
        CallbackFree(this.vtbl.GetSelectedControlItem)
        CallbackFree(this.vtbl.SetSelectedControlItem)
        CallbackFree(this.vtbl.StartVisualGroup)
        CallbackFree(this.vtbl.EndVisualGroup)
        CallbackFree(this.vtbl.MakeProminent)
        CallbackFree(this.vtbl.SetControlItemText)
    }
}
