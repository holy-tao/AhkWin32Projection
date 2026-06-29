#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFileDialogCustomize.ahk" { IFileDialogCustomize }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that allow an application to be notified of events that are related to controls that the application has added to a common file dialog.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * <b>IFileDialogControlEvents</b> is implemented by an application on the same object that it implements <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialogevents">IFileDialogEvents</a> in.
 * 
 * The dialog does not check the return values of this interface's methods.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ifiledialogcontrolevents
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IFileDialogControlEvents extends IUnknown {
    /**
     * The interface identifier for IFileDialogControlEvents
     * @type {Guid}
     */
    static IID := Guid("{36116642-d713-4b97-9b83-7484a9d00433}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFileDialogControlEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnItemSelected       : IntPtr
        OnButtonClicked      : IntPtr
        OnCheckButtonToggled : IntPtr
        OnControlActivating  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFileDialogControlEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when an item is selected in a combo box, when a user clicks an option button (also known as a radio button), or an item is chosen from the Tools menu.
     * @remarks
     * This notification is not sent when the user chooses an item from the drop-down menu attached to the <b>Open</b> button, because the action taken in that case is always the same: close the dialog as if the user had simply clicked the <b>Open</b> button. For that situation, the application can call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialogcustomize-getselectedcontrolitem">GetSelectedControlItem</a> to obtain the item the user chose from that menu.
     * @param {IFileDialogCustomize} pfdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialogcustomize">IFileDialogCustomize</a>*</b>
     * 
     * A pointer to the interface through which the application added controls to the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the control in which the user made a selection.
     * @param {Integer} dwIDItem Type: <b>DWORD</b>
     * 
     * The ID of the selection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifiledialogcontrolevents-onitemselected
     */
    OnItemSelected(pfdc, dwIDCtl, dwIDItem) {
        result := ComCall(3, this, "ptr", pfdc, "uint", dwIDCtl, "uint", dwIDItem, "HRESULT")
        return result
    }

    /**
     * Called when the user clicks a command button.
     * @param {IFileDialogCustomize} pfdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialogcustomize">IFileDialogCustomize</a>*</b>
     * 
     * A pointer to the interface through which the application added controls to the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the button that the user clicked.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifiledialogcontrolevents-onbuttonclicked
     */
    OnButtonClicked(pfdc, dwIDCtl) {
        result := ComCall(4, this, "ptr", pfdc, "uint", dwIDCtl, "HRESULT")
        return result
    }

    /**
     * Called when the user changes the state of a check button (check box).
     * @param {IFileDialogCustomize} pfdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialogcustomize">IFileDialogCustomize</a>*</b>
     * 
     * A pointer to the interface through which the application added controls to the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the button that the user clicked.
     * @param {BOOL} bChecked Type: <b>BOOL</b>
     * 
     * A <b>BOOL</b> indicating the current state of the check button. <b>TRUE</b> if checked; <b>FALSE</b> otherwise.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifiledialogcontrolevents-oncheckbuttontoggled
     */
    OnCheckButtonToggled(pfdc, dwIDCtl, bChecked) {
        result := ComCall(5, this, "ptr", pfdc, "uint", dwIDCtl, BOOL, bChecked, "HRESULT")
        return result
    }

    /**
     * Called when an Open button drop-down list customized through EnableOpenDropDown or a Tools menu is about to display its contents.
     * @remarks
     * In response to this notification, an application can update the contents of the menu or list about to be displayed, based on the current state of the dialog.
     * @param {IFileDialogCustomize} pfdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialogcustomize">IFileDialogCustomize</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialogcustomize">IFileDialogCustomize</a> object through which the application adds controls to the dialog.
     * @param {Integer} dwIDCtl Type: <b>DWORD</b>
     * 
     * The ID of the list or menu about to display.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifiledialogcontrolevents-oncontrolactivating
     */
    OnControlActivating(pfdc, dwIDCtl) {
        result := ComCall(6, this, "ptr", pfdc, "uint", dwIDCtl, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFileDialogControlEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnItemSelected := CallbackCreate(GetMethod(implObj, "OnItemSelected"), flags, 4)
        this.vtbl.OnButtonClicked := CallbackCreate(GetMethod(implObj, "OnButtonClicked"), flags, 3)
        this.vtbl.OnCheckButtonToggled := CallbackCreate(GetMethod(implObj, "OnCheckButtonToggled"), flags, 4)
        this.vtbl.OnControlActivating := CallbackCreate(GetMethod(implObj, "OnControlActivating"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnItemSelected)
        CallbackFree(this.vtbl.OnButtonClicked)
        CallbackFree(this.vtbl.OnCheckButtonToggled)
        CallbackFree(this.vtbl.OnControlActivating)
    }
}
