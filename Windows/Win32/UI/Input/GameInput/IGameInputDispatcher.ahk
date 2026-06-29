#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct IGameInputDispatcher extends IUnknown {
    /**
     * The interface identifier for IGameInputDispatcher
     * @type {Guid}
     */
    static IID := Guid("{415eed2e-98cb-42c2-8f28-b94601074e31}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGameInputDispatcher interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Dispatch       : IntPtr
        OpenWaitHandle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGameInputDispatcher.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} quotaInMicroseconds 
     * @returns {Boolean} 
     */
    Dispatch(quotaInMicroseconds) {
        result := ComCall(3, this, "uint", quotaInMicroseconds, Int32)
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    OpenWaitHandle() {
        waitHandle := HANDLE.Owned()
        result := ComCall(4, this, HANDLE.Ptr, waitHandle, "HRESULT")
        return waitHandle
    }

    Query(iid) {
        if (IGameInputDispatcher.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Dispatch := CallbackCreate(GetMethod(implObj, "Dispatch"), flags, 2)
        this.vtbl.OpenWaitHandle := CallbackCreate(GetMethod(implObj, "OpenWaitHandle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Dispatch)
        CallbackFree(this.vtbl.OpenWaitHandle)
    }
}
