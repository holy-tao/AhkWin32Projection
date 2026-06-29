#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugThreadCall32.ahk" { IDebugThreadCall32 }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugApplicationThread11032 extends IUnknown {
    /**
     * The interface identifier for IDebugApplicationThread11032
     * @type {Guid}
     */
    static IID := Guid("{2194ac5c-6561-404a-a2e9-f57d72de3702}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugApplicationThread11032 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetActiveThreadRequestCount : IntPtr
        IsSuspendedForBreakPoint    : IntPtr
        IsThreadCallable            : IntPtr
        AsynchronousCallIntoThread  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugApplicationThread11032.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetActiveThreadRequestCount() {
        result := ComCall(3, this, "uint*", &puiThreadRequests := 0, "HRESULT")
        return puiThreadRequests
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsSuspendedForBreakPoint() {
        result := ComCall(4, this, BOOL.Ptr, &pfIsSuspended := 0, "HRESULT")
        return pfIsSuspended
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsThreadCallable() {
        result := ComCall(5, this, BOOL.Ptr, &pfIsCallable := 0, "HRESULT")
        return pfIsCallable
    }

    /**
     * 
     * @param {IDebugThreadCall32} pptc 
     * @param {Pointer} dwParam1 
     * @param {Pointer} dwParam2 
     * @param {Pointer} dwParam3 
     * @returns {HRESULT} 
     */
    AsynchronousCallIntoThread(pptc, dwParam1, dwParam2, dwParam3) {
        result := ComCall(6, this, "ptr", pptc, "ptr", dwParam1, "ptr", dwParam2, "ptr", dwParam3, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugApplicationThread11032.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetActiveThreadRequestCount := CallbackCreate(GetMethod(implObj, "GetActiveThreadRequestCount"), flags, 2)
        this.vtbl.IsSuspendedForBreakPoint := CallbackCreate(GetMethod(implObj, "IsSuspendedForBreakPoint"), flags, 2)
        this.vtbl.IsThreadCallable := CallbackCreate(GetMethod(implObj, "IsThreadCallable"), flags, 2)
        this.vtbl.AsynchronousCallIntoThread := CallbackCreate(GetMethod(implObj, "AsynchronousCallIntoThread"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetActiveThreadRequestCount)
        CallbackFree(this.vtbl.IsSuspendedForBreakPoint)
        CallbackFree(this.vtbl.IsThreadCallable)
        CallbackFree(this.vtbl.AsynchronousCallIntoThread)
    }
}
