#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICLRTask.ahk" { ICLRTask }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRTask2 extends ICLRTask {
    /**
     * The interface identifier for ICLRTask2
     * @type {Guid}
     */
    static IID := Guid("{28e66a4a-9906-4225-b231-9187c3eb8612}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRTask2 interfaces
    */
    struct Vtbl extends ICLRTask.Vtbl {
        BeginPreventAsyncAbort : IntPtr
        EndPreventAsyncAbort   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRTask2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginPreventAsyncAbort() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndPreventAsyncAbort() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRTask2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeginPreventAsyncAbort := CallbackCreate(GetMethod(implObj, "BeginPreventAsyncAbort"), flags, 1)
        this.vtbl.EndPreventAsyncAbort := CallbackCreate(GetMethod(implObj, "EndPreventAsyncAbort"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeginPreventAsyncAbort)
        CallbackFree(this.vtbl.EndPreventAsyncAbort)
    }
}
