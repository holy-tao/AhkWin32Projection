#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITipPullSink.ahk" { ITipPullSink }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITransaction.ahk" { ITransaction }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITipHelper extends IUnknown {
    /**
     * The interface identifier for ITipHelper
     * @type {Guid}
     */
    static IID := Guid("{17cf72d1-bac5-11d1-b1bf-00c04fc2f3ef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITipHelper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Pull          : IntPtr
        PullAsync     : IntPtr
        GetLocalTmUrl : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITipHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} i_pszTxUrl 
     * @returns {ITransaction} 
     */
    Pull(i_pszTxUrl) {
        i_pszTxUrlMarshal := i_pszTxUrl is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, i_pszTxUrlMarshal, i_pszTxUrl, "ptr*", &o_ppITransaction := 0, "HRESULT")
        return ITransaction(o_ppITransaction)
    }

    /**
     * 
     * @param {Pointer<Integer>} i_pszTxUrl 
     * @param {ITipPullSink} i_pTipPullSink 
     * @returns {ITransaction} 
     */
    PullAsync(i_pszTxUrl, i_pTipPullSink) {
        i_pszTxUrlMarshal := i_pszTxUrl is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, i_pszTxUrlMarshal, i_pszTxUrl, "ptr", i_pTipPullSink, "ptr*", &o_ppITransaction := 0, "HRESULT")
        return ITransaction(o_ppITransaction)
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    GetLocalTmUrl() {
        result := ComCall(5, this, "ptr*", &o_ppszLocalTmUrl := 0, "HRESULT")
        return o_ppszLocalTmUrl
    }

    Query(iid) {
        if (ITipHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Pull := CallbackCreate(GetMethod(implObj, "Pull"), flags, 3)
        this.vtbl.PullAsync := CallbackCreate(GetMethod(implObj, "PullAsync"), flags, 4)
        this.vtbl.GetLocalTmUrl := CallbackCreate(GetMethod(implObj, "GetLocalTmUrl"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Pull)
        CallbackFree(this.vtbl.PullAsync)
        CallbackFree(this.vtbl.GetLocalTmUrl)
    }
}
