#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\XACTSTAT.ahk" { XACTSTAT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\BOID.ahk" { BOID }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionLastEnlistmentAsync extends IUnknown {
    /**
     * The interface identifier for ITransactionLastEnlistmentAsync
     * @type {Guid}
     */
    static IID := Guid("{c82bd533-5b30-11d3-8a91-00c04f79eb6d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionLastEnlistmentAsync interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        TransactionOutcome : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionLastEnlistmentAsync.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {XACTSTAT} _XactStat 
     * @param {Pointer<BOID>} pboidReason 
     * @returns {HRESULT} 
     */
    TransactionOutcome(_XactStat, pboidReason) {
        result := ComCall(3, this, XACTSTAT, _XactStat, BOID.Ptr, pboidReason, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITransactionLastEnlistmentAsync.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TransactionOutcome := CallbackCreate(GetMethod(implObj, "TransactionOutcome"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TransactionOutcome)
    }
}
