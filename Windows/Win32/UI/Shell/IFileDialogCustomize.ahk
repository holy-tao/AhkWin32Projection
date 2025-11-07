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
     * 
     * @param {Integer} dwIDCtl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-enableopendropdown
     */
    EnableOpenDropDown(dwIDCtl) {
        result := ComCall(3, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {PWSTR} pszLabel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addmenu
     */
    AddMenu(dwIDCtl, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(4, this, "uint", dwIDCtl, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {PWSTR} pszLabel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addpushbutton
     */
    AddPushButton(dwIDCtl, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(5, this, "uint", dwIDCtl, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addcombobox
     */
    AddComboBox(dwIDCtl) {
        result := ComCall(6, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addradiobuttonlist
     */
    AddRadioButtonList(dwIDCtl) {
        result := ComCall(7, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {PWSTR} pszLabel 
     * @param {BOOL} bChecked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addcheckbutton
     */
    AddCheckButton(dwIDCtl, pszLabel, bChecked) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(8, this, "uint", dwIDCtl, "ptr", pszLabel, "int", bChecked, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addeditbox
     */
    AddEditBox(dwIDCtl, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(9, this, "uint", dwIDCtl, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addseparator
     */
    AddSeparator(dwIDCtl) {
        result := ComCall(10, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addtext
     */
    AddText(dwIDCtl, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(11, this, "uint", dwIDCtl, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {PWSTR} pszLabel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setcontrollabel
     */
    SetControlLabel(dwIDCtl, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(12, this, "uint", dwIDCtl, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-getcontrolstate
     */
    GetControlState(dwIDCtl) {
        result := ComCall(13, this, "uint", dwIDCtl, "int*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Integer} dwState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setcontrolstate
     */
    SetControlState(dwIDCtl, dwState) {
        result := ComCall(14, this, "uint", dwIDCtl, "int", dwState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-geteditboxtext
     */
    GetEditBoxText(dwIDCtl) {
        result := ComCall(15, this, "uint", dwIDCtl, "ptr*", &ppszText := 0, "HRESULT")
        return ppszText
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-seteditboxtext
     */
    SetEditBoxText(dwIDCtl, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(16, this, "uint", dwIDCtl, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-getcheckbuttonstate
     */
    GetCheckButtonState(dwIDCtl) {
        result := ComCall(17, this, "uint", dwIDCtl, "int*", &pbChecked := 0, "HRESULT")
        return pbChecked
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {BOOL} bChecked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setcheckbuttonstate
     */
    SetCheckButtonState(dwIDCtl, bChecked) {
        result := ComCall(18, this, "uint", dwIDCtl, "int", bChecked, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Integer} dwIDItem 
     * @param {PWSTR} pszLabel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-addcontrolitem
     */
    AddControlItem(dwIDCtl, dwIDItem, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(19, this, "uint", dwIDCtl, "uint", dwIDItem, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Integer} dwIDItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-removecontrolitem
     */
    RemoveControlItem(dwIDCtl, dwIDItem) {
        result := ComCall(20, this, "uint", dwIDCtl, "uint", dwIDItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-removeallcontrolitems
     */
    RemoveAllControlItems(dwIDCtl) {
        result := ComCall(21, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Integer} dwIDItem 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-getcontrolitemstate
     */
    GetControlItemState(dwIDCtl, dwIDItem) {
        result := ComCall(22, this, "uint", dwIDCtl, "uint", dwIDItem, "int*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Integer} dwIDItem 
     * @param {Integer} dwState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setcontrolitemstate
     */
    SetControlItemState(dwIDCtl, dwIDItem, dwState) {
        result := ComCall(23, this, "uint", dwIDCtl, "uint", dwIDItem, "int", dwState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-getselectedcontrolitem
     */
    GetSelectedControlItem(dwIDCtl) {
        result := ComCall(24, this, "uint", dwIDCtl, "uint*", &pdwIDItem := 0, "HRESULT")
        return pdwIDItem
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Integer} dwIDItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setselectedcontrolitem
     */
    SetSelectedControlItem(dwIDCtl, dwIDItem) {
        result := ComCall(25, this, "uint", dwIDCtl, "uint", dwIDItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {PWSTR} pszLabel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-startvisualgroup
     */
    StartVisualGroup(dwIDCtl, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(26, this, "uint", dwIDCtl, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-endvisualgroup
     */
    EndVisualGroup() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-makeprominent
     */
    MakeProminent(dwIDCtl) {
        result := ComCall(28, this, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Integer} dwIDItem 
     * @param {PWSTR} pszLabel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-setcontrolitemtext
     */
    SetControlItemText(dwIDCtl, dwIDItem, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(29, this, "uint", dwIDCtl, "uint", dwIDItem, "ptr", pszLabel, "HRESULT")
        return result
    }
}
