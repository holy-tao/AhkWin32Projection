#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRemoteDebugApplication.ahk" { IRemoteDebugApplication }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IMachineDebugManagerEvents extends IUnknown {
    /**
     * The interface identifier for IMachineDebugManagerEvents
     * @type {Guid}
     */
    static IID := Guid("{51973c2e-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMachineDebugManagerEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        onAddApplication    : IntPtr
        onRemoveApplication : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMachineDebugManagerEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IRemoteDebugApplication} pda 
     * @param {Integer} dwAppCookie 
     * @returns {HRESULT} 
     */
    onAddApplication(pda, dwAppCookie) {
        result := ComCall(3, this, "ptr", pda, "uint", dwAppCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRemoteDebugApplication} pda 
     * @param {Integer} dwAppCookie 
     * @returns {HRESULT} 
     */
    onRemoveApplication(pda, dwAppCookie) {
        result := ComCall(4, this, "ptr", pda, "uint", dwAppCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMachineDebugManagerEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.onAddApplication := CallbackCreate(GetMethod(implObj, "onAddApplication"), flags, 3)
        this.vtbl.onRemoveApplication := CallbackCreate(GetMethod(implObj, "onRemoveApplication"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.onAddApplication)
        CallbackFree(this.vtbl.onRemoveApplication)
    }
}
