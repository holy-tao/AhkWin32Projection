#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugApplicationThreadEvents110 extends IUnknown {
    /**
     * The interface identifier for IDebugApplicationThreadEvents110
     * @type {Guid}
     */
    static IID := Guid("{84e5e468-d5da-48a8-83f4-40366429007b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugApplicationThreadEvents110 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnSuspendForBreakPoint  : IntPtr
        OnResumeFromBreakPoint  : IntPtr
        OnThreadRequestComplete : IntPtr
        OnBeginThreadRequest    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugApplicationThreadEvents110.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnSuspendForBreakPoint() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnResumeFromBreakPoint() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnThreadRequestComplete() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnBeginThreadRequest() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugApplicationThreadEvents110.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnSuspendForBreakPoint := CallbackCreate(GetMethod(implObj, "OnSuspendForBreakPoint"), flags, 1)
        this.vtbl.OnResumeFromBreakPoint := CallbackCreate(GetMethod(implObj, "OnResumeFromBreakPoint"), flags, 1)
        this.vtbl.OnThreadRequestComplete := CallbackCreate(GetMethod(implObj, "OnThreadRequestComplete"), flags, 1)
        this.vtbl.OnBeginThreadRequest := CallbackCreate(GetMethod(implObj, "OnBeginThreadRequest"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnSuspendForBreakPoint)
        CallbackFree(this.vtbl.OnResumeFromBreakPoint)
        CallbackFree(this.vtbl.OnThreadRequestComplete)
        CallbackFree(this.vtbl.OnBeginThreadRequest)
    }
}
