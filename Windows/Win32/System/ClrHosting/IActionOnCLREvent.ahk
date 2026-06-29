#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\EClrEvent.ahk" { EClrEvent }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IActionOnCLREvent extends IUnknown {
    /**
     * The interface identifier for IActionOnCLREvent
     * @type {Guid}
     */
    static IID := Guid("{607be24b-d91b-4e28-a242-61871ce56e35}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActionOnCLREvent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActionOnCLREvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {EClrEvent} event 
     * @param {Pointer<Void>} data 
     * @returns {HRESULT} 
     */
    OnEvent(event, data) {
        dataMarshal := data is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, EClrEvent, event, dataMarshal, data, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActionOnCLREvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnEvent := CallbackCreate(GetMethod(implObj, "OnEvent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnEvent)
    }
}
