#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAutomationCondition.ahk" { IUIAutomationCondition }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents a condition that can be either TRUE (selects all elements) or FALSE (selects no elements).
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationboolcondition
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationBoolCondition extends IUIAutomationCondition {
    /**
     * The interface identifier for IUIAutomationBoolCondition
     * @type {Guid}
     */
    static IID := Guid("{1b4e1f2e-75eb-4d0b-8952-5a69988e2307}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationBoolCondition interfaces
    */
    struct Vtbl extends IUIAutomationCondition.Vtbl {
        get_BooleanValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationBoolCondition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    BooleanValue {
        get => this.get_BooleanValue()
    }

    /**
     * Retrieves the value of the condition:\_either TRUE or FALSE.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationboolcondition-get_booleanvalue
     */
    get_BooleanValue() {
        result := ComCall(3, this, BOOL.Ptr, &boolVal := 0, "HRESULT")
        return boolVal
    }

    Query(iid) {
        if (IUIAutomationBoolCondition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_BooleanValue := CallbackCreate(GetMethod(implObj, "get_BooleanValue"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_BooleanValue)
    }
}
