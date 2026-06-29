#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ILastResourceManager extends IUnknown {
    /**
     * The interface identifier for ILastResourceManager
     * @type {Guid}
     */
    static IID := Guid("{4d964ad4-5b33-11d3-8a91-00c04f79eb6d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILastResourceManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        TransactionCommitted : IntPtr
        RecoveryDone         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILastResourceManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pPrepInfo 
     * @param {Integer} cbPrepInfo 
     * @returns {HRESULT} 
     */
    TransactionCommitted(pPrepInfo, cbPrepInfo) {
        pPrepInfoMarshal := pPrepInfo is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pPrepInfoMarshal, pPrepInfo, "uint", cbPrepInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RecoveryDone() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ILastResourceManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TransactionCommitted := CallbackCreate(GetMethod(implObj, "TransactionCommitted"), flags, 3)
        this.vtbl.RecoveryDone := CallbackCreate(GetMethod(implObj, "RecoveryDone"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TransactionCommitted)
        CallbackFree(this.vtbl.RecoveryDone)
    }
}
