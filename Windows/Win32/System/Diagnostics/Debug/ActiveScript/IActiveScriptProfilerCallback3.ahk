#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IActiveScriptProfilerCallback2.ahk" { IActiveScriptProfilerCallback2 }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptProfilerCallback3 extends IActiveScriptProfilerCallback2 {
    /**
     * The interface identifier for IActiveScriptProfilerCallback3
     * @type {Guid}
     */
    static IID := Guid("{6ac5ad25-2037-4687-91df-b59979d93d73}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptProfilerCallback3 interfaces
    */
    struct Vtbl extends IActiveScriptProfilerCallback2.Vtbl {
        SetWebWorkerId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptProfilerCallback3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} webWorkerId 
     * @returns {HRESULT} 
     */
    SetWebWorkerId(webWorkerId) {
        result := ComCall(11, this, "uint", webWorkerId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptProfilerCallback3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetWebWorkerId := CallbackCreate(GetMethod(implObj, "SetWebWorkerId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetWebWorkerId)
    }
}
