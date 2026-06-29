#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ToggleState.ahk" { ToggleState }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to controls that can cycle through a set of states and maintain a state after it is set.
 * @remarks
 * Implemented on a Microsoft UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingtoggle">Toggle</a> control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-itoggleprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IToggleProvider extends IUnknown {
    /**
     * The interface identifier for IToggleProvider
     * @type {Guid}
     */
    static IID := Guid("{56d00bd0-c4f4-433c-a836-1a52a57e0892}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IToggleProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Toggle          : IntPtr
        get_ToggleState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IToggleProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ToggleState} 
     */
    ToggleState {
        get => this.get_ToggleState()
    }

    /**
     * Cycles through the toggle states of a control.
     * @remarks
     * A control must cycle through its <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-togglestate">ToggleState</a> in this order: 
     * <b>ToggleState_On</b>, <b>ToggleState_Off</b> 
     * and, if supported, <b>ToggleState_Indeterminate</b>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itoggleprovider-toggle
     */
    Toggle() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Specifies the toggle state of the control.
     * @remarks
     * A control must cycle through its <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-togglestate">ToggleState</a> in this order:  
     * <b>ToggleState_On</b>, <b>ToggleState_Off</b> 
     * and, if supported, <b>ToggleState_Indeterminate</b>.
     * @returns {ToggleState} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itoggleprovider-get_togglestate
     */
    get_ToggleState() {
        result := ComCall(4, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (IToggleProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Toggle := CallbackCreate(GetMethod(implObj, "Toggle"), flags, 1)
        this.vtbl.get_ToggleState := CallbackCreate(GetMethod(implObj, "get_ToggleState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Toggle)
        CallbackFree(this.vtbl.get_ToggleState)
    }
}
