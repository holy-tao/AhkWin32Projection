#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IActionOnCLREvent.ahk" { IActionOnCLREvent }
#Import ".\EClrEvent.ahk" { EClrEvent }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLROnEventManager extends IUnknown {
    /**
     * The interface identifier for ICLROnEventManager
     * @type {Guid}
     */
    static IID := Guid("{1d0e0132-e64f-493d-9260-025c0e32c175}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLROnEventManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterActionOnEvent   : IntPtr
        UnregisterActionOnEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLROnEventManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {EClrEvent} event 
     * @param {IActionOnCLREvent} pAction 
     * @returns {HRESULT} 
     */
    RegisterActionOnEvent(event, pAction) {
        result := ComCall(3, this, EClrEvent, event, "ptr", pAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {EClrEvent} event 
     * @param {IActionOnCLREvent} pAction 
     * @returns {HRESULT} 
     */
    UnregisterActionOnEvent(event, pAction) {
        result := ComCall(4, this, EClrEvent, event, "ptr", pAction, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLROnEventManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterActionOnEvent := CallbackCreate(GetMethod(implObj, "RegisterActionOnEvent"), flags, 3)
        this.vtbl.UnregisterActionOnEvent := CallbackCreate(GetMethod(implObj, "UnregisterActionOnEvent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterActionOnEvent)
        CallbackFree(this.vtbl.UnregisterActionOnEvent)
    }
}
