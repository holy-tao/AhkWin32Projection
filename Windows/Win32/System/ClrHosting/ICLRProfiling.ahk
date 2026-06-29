#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRProfiling extends IUnknown {
    /**
     * The interface identifier for ICLRProfiling
     * @type {Guid}
     */
    static IID := Guid("{b349abe3-b56f-4689-bfcd-76bf39d888ea}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRProfiling interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AttachProfiler : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRProfiling.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwProfileeProcessID 
     * @param {Integer} dwMillisecondsMax 
     * @param {Pointer<Guid>} pClsidProfiler 
     * @param {PWSTR} wszProfilerPath 
     * @param {Pointer<Void>} pvClientData 
     * @param {Integer} cbClientData 
     * @returns {HRESULT} 
     */
    AttachProfiler(dwProfileeProcessID, dwMillisecondsMax, pClsidProfiler, wszProfilerPath, pvClientData, cbClientData) {
        wszProfilerPath := wszProfilerPath is String ? StrPtr(wszProfilerPath) : wszProfilerPath

        pvClientDataMarshal := pvClientData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", dwProfileeProcessID, "uint", dwMillisecondsMax, Guid.Ptr, pClsidProfiler, "ptr", wszProfilerPath, pvClientDataMarshal, pvClientData, "uint", cbClientData, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRProfiling.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AttachProfiler := CallbackCreate(GetMethod(implObj, "AttachProfiler"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AttachProfiler)
    }
}
