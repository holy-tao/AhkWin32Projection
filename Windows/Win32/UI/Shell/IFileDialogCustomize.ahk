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
     * 
     * @param {Integer} dwIDCtl 
     * @returns {HRESULT} 
     */
    EnableOpenDropDown(dwIDCtl) {
        result := ComCall(3, this, "uint", dwIDCtl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {PWSTR} pszLabel 
     * @returns {HRESULT} 
     */
    AddMenu(dwIDCtl, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(4, this, "uint", dwIDCtl, "ptr", pszLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {PWSTR} pszLabel 
     * @returns {HRESULT} 
     */
    AddPushButton(dwIDCtl, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(5, this, "uint", dwIDCtl, "ptr", pszLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @returns {HRESULT} 
     */
    AddComboBox(dwIDCtl) {
        result := ComCall(6, this, "uint", dwIDCtl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @returns {HRESULT} 
     */
    AddRadioButtonList(dwIDCtl) {
        result := ComCall(7, this, "uint", dwIDCtl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {PWSTR} pszLabel 
     * @param {BOOL} bChecked 
     * @returns {HRESULT} 
     */
    AddCheckButton(dwIDCtl, pszLabel, bChecked) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(8, this, "uint", dwIDCtl, "ptr", pszLabel, "int", bChecked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     */
    AddEditBox(dwIDCtl, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(9, this, "uint", dwIDCtl, "ptr", pszText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @returns {HRESULT} 
     */
    AddSeparator(dwIDCtl) {
        result := ComCall(10, this, "uint", dwIDCtl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     */
    AddText(dwIDCtl, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(11, this, "uint", dwIDCtl, "ptr", pszText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {PWSTR} pszLabel 
     * @returns {HRESULT} 
     */
    SetControlLabel(dwIDCtl, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(12, this, "uint", dwIDCtl, "ptr", pszLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Pointer<Int32>} pdwState 
     * @returns {HRESULT} 
     */
    GetControlState(dwIDCtl, pdwState) {
        result := ComCall(13, this, "uint", dwIDCtl, "int*", pdwState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Integer} dwState 
     * @returns {HRESULT} 
     */
    SetControlState(dwIDCtl, dwState) {
        result := ComCall(14, this, "uint", dwIDCtl, "int", dwState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Pointer<UInt16>} ppszText 
     * @returns {HRESULT} 
     */
    GetEditBoxText(dwIDCtl, ppszText) {
        result := ComCall(15, this, "uint", dwIDCtl, "ushort*", ppszText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     */
    SetEditBoxText(dwIDCtl, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(16, this, "uint", dwIDCtl, "ptr", pszText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Pointer<BOOL>} pbChecked 
     * @returns {HRESULT} 
     */
    GetCheckButtonState(dwIDCtl, pbChecked) {
        result := ComCall(17, this, "uint", dwIDCtl, "ptr", pbChecked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {BOOL} bChecked 
     * @returns {HRESULT} 
     */
    SetCheckButtonState(dwIDCtl, bChecked) {
        result := ComCall(18, this, "uint", dwIDCtl, "int", bChecked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Integer} dwIDItem 
     * @param {PWSTR} pszLabel 
     * @returns {HRESULT} 
     */
    AddControlItem(dwIDCtl, dwIDItem, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(19, this, "uint", dwIDCtl, "uint", dwIDItem, "ptr", pszLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Integer} dwIDItem 
     * @returns {HRESULT} 
     */
    RemoveControlItem(dwIDCtl, dwIDItem) {
        result := ComCall(20, this, "uint", dwIDCtl, "uint", dwIDItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @returns {HRESULT} 
     */
    RemoveAllControlItems(dwIDCtl) {
        result := ComCall(21, this, "uint", dwIDCtl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Integer} dwIDItem 
     * @param {Pointer<Int32>} pdwState 
     * @returns {HRESULT} 
     */
    GetControlItemState(dwIDCtl, dwIDItem, pdwState) {
        result := ComCall(22, this, "uint", dwIDCtl, "uint", dwIDItem, "int*", pdwState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Integer} dwIDItem 
     * @param {Integer} dwState 
     * @returns {HRESULT} 
     */
    SetControlItemState(dwIDCtl, dwIDItem, dwState) {
        result := ComCall(23, this, "uint", dwIDCtl, "uint", dwIDItem, "int", dwState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Pointer<UInt32>} pdwIDItem 
     * @returns {HRESULT} 
     */
    GetSelectedControlItem(dwIDCtl, pdwIDItem) {
        result := ComCall(24, this, "uint", dwIDCtl, "uint*", pdwIDItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Integer} dwIDItem 
     * @returns {HRESULT} 
     */
    SetSelectedControlItem(dwIDCtl, dwIDItem) {
        result := ComCall(25, this, "uint", dwIDCtl, "uint", dwIDItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {PWSTR} pszLabel 
     * @returns {HRESULT} 
     */
    StartVisualGroup(dwIDCtl, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(26, this, "uint", dwIDCtl, "ptr", pszLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndVisualGroup() {
        result := ComCall(27, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @returns {HRESULT} 
     */
    MakeProminent(dwIDCtl) {
        result := ComCall(28, this, "uint", dwIDCtl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIDCtl 
     * @param {Integer} dwIDItem 
     * @param {PWSTR} pszLabel 
     * @returns {HRESULT} 
     */
    SetControlItemText(dwIDCtl, dwIDItem, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(29, this, "uint", dwIDCtl, "uint", dwIDItem, "ptr", pszLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
