#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITipTransaction extends IUnknown {
    /**
     * The interface identifier for ITipTransaction
     * @type {Guid}
     */
    static IID := Guid("{17cf72d0-bac5-11d1-b1bf-00c04fc2f3ef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITipTransaction interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Push              : IntPtr
        GetTransactionUrl : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITipTransaction.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} i_pszRemoteTmUrl 
     * @returns {PSTR} 
     */
    Push(i_pszRemoteTmUrl) {
        i_pszRemoteTmUrlMarshal := i_pszRemoteTmUrl is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, i_pszRemoteTmUrlMarshal, i_pszRemoteTmUrl, PSTR.Ptr, &o_ppszRemoteTxUrl := 0, "HRESULT")
        return o_ppszRemoteTxUrl
    }

    /**
     * 
     * @returns {PSTR} 
     */
    GetTransactionUrl() {
        result := ComCall(4, this, PSTR.Ptr, &o_ppszLocalTxUrl := 0, "HRESULT")
        return o_ppszLocalTxUrl
    }

    Query(iid) {
        if (ITipTransaction.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Push := CallbackCreate(GetMethod(implObj, "Push"), flags, 3)
        this.vtbl.GetTransactionUrl := CallbackCreate(GetMethod(implObj, "GetTransactionUrl"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Push)
        CallbackFree(this.vtbl.GetTransactionUrl)
    }
}
