#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICorProfilerCallback2.ahk" { ICorProfilerCallback2 }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerCallback3 extends ICorProfilerCallback2 {
    /**
     * The interface identifier for ICorProfilerCallback3
     * @type {Guid}
     */
    static IID := Guid("{4fd2ed52-7731-4b8d-9469-03d2cc3086c5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerCallback3 interfaces
    */
    struct Vtbl extends ICorProfilerCallback2.Vtbl {
        InitializeForAttach     : IntPtr
        ProfilerAttachComplete  : IntPtr
        ProfilerDetachSucceeded : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerCallback3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pCorProfilerInfoUnk 
     * @param {Pointer<Void>} pvClientData 
     * @param {Integer} cbClientData 
     * @returns {HRESULT} 
     */
    InitializeForAttach(pCorProfilerInfoUnk, pvClientData, cbClientData) {
        pvClientDataMarshal := pvClientData is VarRef ? "ptr" : "ptr"

        result := ComCall(80, this, "ptr", pCorProfilerInfoUnk, pvClientDataMarshal, pvClientData, "uint", cbClientData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ProfilerAttachComplete() {
        result := ComCall(81, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ProfilerDetachSucceeded() {
        result := ComCall(82, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerCallback3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeForAttach := CallbackCreate(GetMethod(implObj, "InitializeForAttach"), flags, 4)
        this.vtbl.ProfilerAttachComplete := CallbackCreate(GetMethod(implObj, "ProfilerAttachComplete"), flags, 1)
        this.vtbl.ProfilerDetachSucceeded := CallbackCreate(GetMethod(implObj, "ProfilerDetachSucceeded"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeForAttach)
        CallbackFree(this.vtbl.ProfilerAttachComplete)
        CallbackFree(this.vtbl.ProfilerDetachSucceeded)
    }
}
