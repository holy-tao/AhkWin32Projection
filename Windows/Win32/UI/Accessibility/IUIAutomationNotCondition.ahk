#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAutomationCondition.ahk" { IUIAutomationCondition }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents a condition that is the negative of another condition.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationnotcondition
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationNotCondition extends IUIAutomationCondition {
    /**
     * The interface identifier for IUIAutomationNotCondition
     * @type {Guid}
     */
    static IID := Guid("{f528b657-847b-498c-8896-d52b565407a1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationNotCondition interfaces
    */
    struct Vtbl extends IUIAutomationCondition.Vtbl {
        GetChild : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationNotCondition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the condition of which this condition is the negative.
     * @remarks
     * The returned condition is the one that was used in creating this condition.
     * @returns {IUIAutomationCondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>**</b>
     * 
     * Receives a pointer to the condition.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationnotcondition-getchild
     */
    GetChild() {
        result := ComCall(3, this, "ptr*", &condition := 0, "HRESULT")
        return IUIAutomationCondition(condition)
    }

    Query(iid) {
        if (IUIAutomationNotCondition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetChild := CallbackCreate(GetMethod(implObj, "GetChild"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetChild)
    }
}
