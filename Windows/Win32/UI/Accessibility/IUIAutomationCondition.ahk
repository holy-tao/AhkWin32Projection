#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This is the primary interface for conditions used in filtering when searching for elements in the UI Automation tree.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationCondition extends IUnknown {
    /**
     * The interface identifier for IUIAutomationCondition
     * @type {Guid}
     */
    static IID := Guid("{352ffba8-0973-437c-a61f-f64cafd81df9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationCondition interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationCondition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IUIAutomationCondition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
