#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Provides access to the selectable child items of a container control that supports IUIAutomationSelectionPattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationselectionitempattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationSelectionItemPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationSelectionItemPattern
     * @type {Guid}
     */
    static IID := Guid("{a8efa66a-0fda-421a-9194-38021f3578ea}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationSelectionItemPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Select                        : IntPtr
        AddToSelection                : IntPtr
        RemoveFromSelection           : IntPtr
        get_CurrentIsSelected         : IntPtr
        get_CurrentSelectionContainer : IntPtr
        get_CachedIsSelected          : IntPtr
        get_CachedSelectionContainer  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationSelectionItemPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    CurrentIsSelected {
        get => this.get_CurrentIsSelected()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CurrentSelectionContainer {
        get => this.get_CurrentSelectionContainer()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsSelected {
        get => this.get_CachedIsSelected()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CachedSelectionContainer {
        get => this.get_CachedSelectionContainer()
    }

    /**
     * Clears any selected items and then selects the current element.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-select
     */
    Select() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Adds the current element to the collection of selected items. (IUIAutomationSelectionItemPattern.AddToSelection)
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-addtoselection
     */
    AddToSelection() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Removes this element from the selection.
     * @remarks
     * An error code is returned if this element is the only one in the selection and the selection container requires at least one element to be selected.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-removefromselection
     */
    RemoveFromSelection() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Indicates whether this item is selected.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-get_currentisselected
     */
    get_CurrentIsSelected() {
        result := ComCall(6, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the element that supports IUIAutomationSelectionPattern and acts as the container for this item.
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-get_currentselectioncontainer
     */
    get_CurrentSelectionContainer() {
        result := ComCall(7, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * A cached value that indicates whether this item is selected.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-get_cachedisselected
     */
    get_CachedIsSelected() {
        result := ComCall(8, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached element that supports IUIAutomationSelectionPattern and acts as the container for this item.
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-get_cachedselectioncontainer
     */
    get_CachedSelectionContainer() {
        result := ComCall(9, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    Query(iid) {
        if (IUIAutomationSelectionItemPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Select := CallbackCreate(GetMethod(implObj, "Select"), flags, 1)
        this.vtbl.AddToSelection := CallbackCreate(GetMethod(implObj, "AddToSelection"), flags, 1)
        this.vtbl.RemoveFromSelection := CallbackCreate(GetMethod(implObj, "RemoveFromSelection"), flags, 1)
        this.vtbl.get_CurrentIsSelected := CallbackCreate(GetMethod(implObj, "get_CurrentIsSelected"), flags, 2)
        this.vtbl.get_CurrentSelectionContainer := CallbackCreate(GetMethod(implObj, "get_CurrentSelectionContainer"), flags, 2)
        this.vtbl.get_CachedIsSelected := CallbackCreate(GetMethod(implObj, "get_CachedIsSelected"), flags, 2)
        this.vtbl.get_CachedSelectionContainer := CallbackCreate(GetMethod(implObj, "get_CachedSelectionContainer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Select)
        CallbackFree(this.vtbl.AddToSelection)
        CallbackFree(this.vtbl.RemoveFromSelection)
        CallbackFree(this.vtbl.get_CurrentIsSelected)
        CallbackFree(this.vtbl.get_CurrentSelectionContainer)
        CallbackFree(this.vtbl.get_CachedIsSelected)
        CallbackFree(this.vtbl.get_CachedSelectionContainer)
    }
}
