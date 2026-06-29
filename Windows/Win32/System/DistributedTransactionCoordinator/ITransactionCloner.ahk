#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITransaction.ahk" { ITransaction }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionCloner extends ITransaction {
    /**
     * The interface identifier for ITransactionCloner
     * @type {Guid}
     */
    static IID := Guid("{02656950-2152-11d0-944c-00a0c905416e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionCloner interfaces
    */
    struct Vtbl extends ITransaction.Vtbl {
        CloneWithCommitDisabled : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionCloner.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ITransaction} 
     */
    CloneWithCommitDisabled() {
        result := ComCall(6, this, "ptr*", &ppITransaction := 0, "HRESULT")
        return ITransaction(ppITransaction)
    }

    Query(iid) {
        if (ITransactionCloner.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CloneWithCommitDisabled := CallbackCreate(GetMethod(implObj, "CloneWithCommitDisabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CloneWithCommitDisabled)
    }
}
