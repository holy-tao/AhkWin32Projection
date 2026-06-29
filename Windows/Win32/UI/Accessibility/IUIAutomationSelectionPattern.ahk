#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomationElementArray.ahk" { IUIAutomationElementArray }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a control that contains selectable child items. The children of this element support IUIAutomationSelectionItemPattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationselectionpattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationSelectionPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationSelectionPattern
     * @type {Guid}
     */
    static IID := Guid("{5ed5202e-b2ac-47a6-b638-4b0bf140d78e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationSelectionPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCurrentSelection            : IntPtr
        get_CurrentCanSelectMultiple   : IntPtr
        get_CurrentIsSelectionRequired : IntPtr
        GetCachedSelection             : IntPtr
        get_CachedCanSelectMultiple    : IntPtr
        get_CachedIsSelectionRequired  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationSelectionPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    CurrentCanSelectMultiple {
        get => this.get_CurrentCanSelectMultiple()
    }

    /**
     * @type {BOOL} 
     */
    CurrentIsSelectionRequired {
        get => this.get_CurrentIsSelectionRequired()
    }

    /**
     * @type {BOOL} 
     */
    CachedCanSelectMultiple {
        get => this.get_CachedCanSelectMultiple()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsSelectionRequired {
        get => this.get_CachedIsSelectionRequired()
    }

    /**
     * Retrieves the selected elements in the container.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to the collection of selected elements. The default is an empty array.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-getcurrentselection
     */
    GetCurrentSelection() {
        result := ComCall(3, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Indicates whether more than one item in the container can be selected at one time.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-get_currentcanselectmultiple
     */
    get_CurrentCanSelectMultiple() {
        result := ComCall(4, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether at least one item must be selected at all times.
     * @remarks
     * This property can be dynamic. For example, the initial state of a control might not have any items selected by default, but after an item is selected, the control must always have at least one item selected.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-get_currentisselectionrequired
     */
    get_CurrentIsSelectionRequired() {
        result := ComCall(5, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached selected elements in the container.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to the cached collection of selected elements. The default is an empty array.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-getcachedselection
     */
    GetCachedSelection() {
        result := ComCall(6, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves a cached value that indicates whether more than one item in the container can be selected at one time.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-get_cachedcanselectmultiple
     */
    get_CachedCanSelectMultiple() {
        result := ComCall(7, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether at least one item must be selected at all times.
     * @remarks
     * This property can be dynamic. For example, the initial state of a control might not have any items selected by default, but after an item is selected, the control must always have at least one item selected.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-get_cachedisselectionrequired
     */
    get_CachedIsSelectionRequired() {
        result := ComCall(8, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationSelectionPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCurrentSelection := CallbackCreate(GetMethod(implObj, "GetCurrentSelection"), flags, 2)
        this.vtbl.get_CurrentCanSelectMultiple := CallbackCreate(GetMethod(implObj, "get_CurrentCanSelectMultiple"), flags, 2)
        this.vtbl.get_CurrentIsSelectionRequired := CallbackCreate(GetMethod(implObj, "get_CurrentIsSelectionRequired"), flags, 2)
        this.vtbl.GetCachedSelection := CallbackCreate(GetMethod(implObj, "GetCachedSelection"), flags, 2)
        this.vtbl.get_CachedCanSelectMultiple := CallbackCreate(GetMethod(implObj, "get_CachedCanSelectMultiple"), flags, 2)
        this.vtbl.get_CachedIsSelectionRequired := CallbackCreate(GetMethod(implObj, "get_CachedIsSelectionRequired"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCurrentSelection)
        CallbackFree(this.vtbl.get_CurrentCanSelectMultiple)
        CallbackFree(this.vtbl.get_CurrentIsSelectionRequired)
        CallbackFree(this.vtbl.GetCachedSelection)
        CallbackFree(this.vtbl.get_CachedCanSelectMultiple)
        CallbackFree(this.vtbl.get_CachedIsSelectionRequired)
    }
}
