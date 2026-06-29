#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAutomationSelectionPattern.ahk" { IUIAutomationSelectionPattern }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Extends the IUIAutomationSelectionPattern interface to provide information about selected items.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationselectionpattern2
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationSelectionPattern2 extends IUIAutomationSelectionPattern {
    /**
     * The interface identifier for IUIAutomationSelectionPattern2
     * @type {Guid}
     */
    static IID := Guid("{0532bfae-c011-4e32-a343-6d642d798555}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationSelectionPattern2 interfaces
    */
    struct Vtbl extends IUIAutomationSelectionPattern.Vtbl {
        get_CurrentFirstSelectedItem   : IntPtr
        get_CurrentLastSelectedItem    : IntPtr
        get_CurrentCurrentSelectedItem : IntPtr
        get_CurrentItemCount           : IntPtr
        get_CachedFirstSelectedItem    : IntPtr
        get_CachedLastSelectedItem     : IntPtr
        get_CachedCurrentSelectedItem  : IntPtr
        get_CachedItemCount            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationSelectionPattern2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CurrentFirstSelectedItem {
        get => this.get_CurrentFirstSelectedItem()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CurrentLastSelectedItem {
        get => this.get_CurrentLastSelectedItem()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CurrentCurrentSelectedItem {
        get => this.get_CurrentCurrentSelectedItem()
    }

    /**
     * @type {Integer} 
     */
    CurrentItemCount {
        get => this.get_CurrentItemCount()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CachedFirstSelectedItem {
        get => this.get_CachedFirstSelectedItem()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CachedLastSelectedItem {
        get => this.get_CachedLastSelectedItem()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CachedCurrentSelectedItem {
        get => this.get_CachedCurrentSelectedItem()
    }

    /**
     * @type {Integer} 
     */
    CachedItemCount {
        get => this.get_CachedItemCount()
    }

    /**
     * Gets an IUIAutomationElement object representing the first item in a group of selected items.
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_currentfirstselecteditem
     */
    get_CurrentFirstSelectedItem() {
        result := ComCall(9, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Gets an IUIAutomationElement object representing the last item in a group of selected items.
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_currentlastselecteditem
     */
    get_CurrentLastSelectedItem() {
        result := ComCall(10, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Gets an IUIAutomationElement object representing the currently selected item.
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_currentcurrentselecteditem
     */
    get_CurrentCurrentSelectedItem() {
        result := ComCall(11, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Gets an integer value indicating the number of selected items.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_currentitemcount
     */
    get_CurrentItemCount() {
        result := ComCall(12, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Gets a cached IUIAutomationElement object representing the first item in a group of selected items.
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_cachedfirstselecteditem
     */
    get_CachedFirstSelectedItem() {
        result := ComCall(13, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Gets a cached IUIAutomationElement object representing the last item in a group of selected items.
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_cachedlastselecteditem
     */
    get_CachedLastSelectedItem() {
        result := ComCall(14, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Gets a cached IUIAutomationElement object representing the currently selected item.
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_cachedcurrentselecteditem
     */
    get_CachedCurrentSelectedItem() {
        result := ComCall(15, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Gets a cached integer value indicating the number of selected items.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_cacheditemcount
     */
    get_CachedItemCount() {
        result := ComCall(16, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationSelectionPattern2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentFirstSelectedItem := CallbackCreate(GetMethod(implObj, "get_CurrentFirstSelectedItem"), flags, 2)
        this.vtbl.get_CurrentLastSelectedItem := CallbackCreate(GetMethod(implObj, "get_CurrentLastSelectedItem"), flags, 2)
        this.vtbl.get_CurrentCurrentSelectedItem := CallbackCreate(GetMethod(implObj, "get_CurrentCurrentSelectedItem"), flags, 2)
        this.vtbl.get_CurrentItemCount := CallbackCreate(GetMethod(implObj, "get_CurrentItemCount"), flags, 2)
        this.vtbl.get_CachedFirstSelectedItem := CallbackCreate(GetMethod(implObj, "get_CachedFirstSelectedItem"), flags, 2)
        this.vtbl.get_CachedLastSelectedItem := CallbackCreate(GetMethod(implObj, "get_CachedLastSelectedItem"), flags, 2)
        this.vtbl.get_CachedCurrentSelectedItem := CallbackCreate(GetMethod(implObj, "get_CachedCurrentSelectedItem"), flags, 2)
        this.vtbl.get_CachedItemCount := CallbackCreate(GetMethod(implObj, "get_CachedItemCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentFirstSelectedItem)
        CallbackFree(this.vtbl.get_CurrentLastSelectedItem)
        CallbackFree(this.vtbl.get_CurrentCurrentSelectedItem)
        CallbackFree(this.vtbl.get_CurrentItemCount)
        CallbackFree(this.vtbl.get_CachedFirstSelectedItem)
        CallbackFree(this.vtbl.get_CachedLastSelectedItem)
        CallbackFree(this.vtbl.get_CachedCurrentSelectedItem)
        CallbackFree(this.vtbl.get_CachedItemCount)
    }
}
