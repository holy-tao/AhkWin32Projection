#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ToggleState.ahk" { ToggleState }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a control that can cycle through a set of states, and maintain a state after it is set.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationtogglepattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationTogglePattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationTogglePattern
     * @type {Guid}
     */
    static IID := Guid("{94cf8058-9b8d-4ab9-8bfd-4cd0a33c8c70}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationTogglePattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Toggle                 : IntPtr
        get_CurrentToggleState : IntPtr
        get_CachedToggleState  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationTogglePattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ToggleState} 
     */
    CurrentToggleState {
        get => this.get_CurrentToggleState()
    }

    /**
     * @type {ToggleState} 
     */
    CachedToggleState {
        get => this.get_CachedToggleState()
    }

    /**
     * Cycles through the toggle states of the control.
     * @remarks
     * A control cycles through its states in this order: <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-togglestate">ToggleState_On</a>, <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-togglestate">ToggleState_Off</a> and, if supported, <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-togglestate">ToggleState_Indeterminate</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtogglepattern-toggle
     */
    Toggle() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the state of the control.
     * @returns {ToggleState} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtogglepattern-get_currenttogglestate
     */
    get_CurrentToggleState() {
        result := ComCall(4, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached state of the control.
     * @returns {ToggleState} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtogglepattern-get_cachedtogglestate
     */
    get_CachedToggleState() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationTogglePattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Toggle := CallbackCreate(GetMethod(implObj, "Toggle"), flags, 1)
        this.vtbl.get_CurrentToggleState := CallbackCreate(GetMethod(implObj, "get_CurrentToggleState"), flags, 2)
        this.vtbl.get_CachedToggleState := CallbackCreate(GetMethod(implObj, "get_CachedToggleState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Toggle)
        CallbackFree(this.vtbl.get_CurrentToggleState)
        CallbackFree(this.vtbl.get_CachedToggleState)
    }
}
