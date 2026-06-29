#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRemoteDebugApplication110.ahk" { IRemoteDebugApplication110 }
#Import ".\IDebugThreadCall64.ahk" { IDebugThreadCall64 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugApplication11064 extends IRemoteDebugApplication110 {
    /**
     * The interface identifier for IDebugApplication11064
     * @type {Guid}
     */
    static IID := Guid("{2039d958-4eeb-496a-87bb-2e5201eadeef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugApplication11064 interfaces
    */
    struct Vtbl extends IRemoteDebugApplication110.Vtbl {
        SynchronousCallInMainThread  : IntPtr
        AsynchronousCallInMainThread : IntPtr
        CallableWaitForHandles       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugApplication11064.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDebugThreadCall64} pptc 
     * @param {Pointer} dwParam1 
     * @param {Pointer} dwParam2 
     * @param {Pointer} dwParam3 
     * @returns {HRESULT} 
     */
    SynchronousCallInMainThread(pptc, dwParam1, dwParam2, dwParam3) {
        result := ComCall(6, this, "ptr", pptc, "ptr", dwParam1, "ptr", dwParam2, "ptr", dwParam3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugThreadCall64} pptc 
     * @param {Pointer} dwParam1 
     * @param {Pointer} dwParam2 
     * @param {Pointer} dwParam3 
     * @returns {HRESULT} 
     */
    AsynchronousCallInMainThread(pptc, dwParam1, dwParam2, dwParam3) {
        result := ComCall(7, this, "ptr", pptc, "ptr", dwParam1, "ptr", dwParam2, "ptr", dwParam3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} handleCount 
     * @param {Pointer<HANDLE>} pHandles 
     * @returns {Integer} 
     */
    CallableWaitForHandles(handleCount, pHandles) {
        result := ComCall(8, this, "uint", handleCount, HANDLE.Ptr, pHandles, "uint*", &pIndex := 0, "HRESULT")
        return pIndex
    }

    Query(iid) {
        if (IDebugApplication11064.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SynchronousCallInMainThread := CallbackCreate(GetMethod(implObj, "SynchronousCallInMainThread"), flags, 5)
        this.vtbl.AsynchronousCallInMainThread := CallbackCreate(GetMethod(implObj, "AsynchronousCallInMainThread"), flags, 5)
        this.vtbl.CallableWaitForHandles := CallbackCreate(GetMethod(implObj, "CallableWaitForHandles"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SynchronousCallInMainThread)
        CallbackFree(this.vtbl.AsynchronousCallInMainThread)
        CallbackFree(this.vtbl.CallableWaitForHandles)
    }
}
