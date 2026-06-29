#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugAsyncOperationCallBack.ahk" { IDebugAsyncOperationCallBack }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugSyncOperation.ahk" { IDebugSyncOperation }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugAsyncOperation extends IUnknown {
    /**
     * The interface identifier for IDebugAsyncOperation
     * @type {Guid}
     */
    static IID := Guid("{51973c1b-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugAsyncOperation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSyncDebugOperation : IntPtr
        Start                 : IntPtr
        Abort                 : IntPtr
        QueryIsComplete       : IntPtr
        GetResult             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugAsyncOperation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IDebugSyncOperation} 
     */
    GetSyncDebugOperation() {
        result := ComCall(3, this, "ptr*", &ppsdo := 0, "HRESULT")
        return IDebugSyncOperation(ppsdo)
    }

    /**
     * 
     * @param {IDebugAsyncOperationCallBack} padocb 
     * @returns {HRESULT} 
     */
    Start(padocb) {
        result := ComCall(4, this, "ptr", padocb, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryIsComplete() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phrResult 
     * @param {Pointer<IUnknown>} ppunkResult 
     * @returns {HRESULT} 
     */
    GetResult(phrResult, ppunkResult) {
        phrResultMarshal := phrResult is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, phrResultMarshal, phrResult, IUnknown.Ptr, ppunkResult, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugAsyncOperation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSyncDebugOperation := CallbackCreate(GetMethod(implObj, "GetSyncDebugOperation"), flags, 2)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 2)
        this.vtbl.Abort := CallbackCreate(GetMethod(implObj, "Abort"), flags, 1)
        this.vtbl.QueryIsComplete := CallbackCreate(GetMethod(implObj, "QueryIsComplete"), flags, 1)
        this.vtbl.GetResult := CallbackCreate(GetMethod(implObj, "GetResult"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSyncDebugOperation)
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Abort)
        CallbackFree(this.vtbl.QueryIsComplete)
        CallbackFree(this.vtbl.GetResult)
    }
}
