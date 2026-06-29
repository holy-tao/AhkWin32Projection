#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber if the Microsoft Distributed Transaction Coordinator (DTC) transaction starts, commits, or aborts.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomtransactionevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComTransactionEvents extends IUnknown {
    /**
     * The interface identifier for IComTransactionEvents
     * @type {Guid}
     */
    static IID := Guid("{683130a8-2e50-11d2-98a5-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComTransactionEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnTransactionStart   : IntPtr
        OnTransactionPrepare : IntPtr
        OnTransactionAbort   : IntPtr
        OnTransactionCommit  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComTransactionEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when a Microsoft Distributed Transaction Coordinator (DTC) transaction starts. (IComTransactionEvents.OnTransactionStart)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidTx The transaction identifier.
     * @param {Pointer<Guid>} tsid The transaction stream identifier; a unique identifier for correlation to objects.
     * @param {BOOL} fRoot Indicates whether this is a root transaction.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtransactionevents-ontransactionstart
     */
    OnTransactionStart(pInfo, guidTx, tsid, fRoot) {
        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidTx, Guid.Ptr, tsid, BOOL, fRoot, "HRESULT")
        return result
    }

    /**
     * Generated when the prepare phase of the two-phase commit protocol of the transaction is completed.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidTx The transaction identifier.
     * @param {BOOL} fVoteYes The resource managers result concerning the outcome of the prepare phase.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtransactionevents-ontransactionprepare
     */
    OnTransactionPrepare(pInfo, guidTx, fVoteYes) {
        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidTx, BOOL, fVoteYes, "HRESULT")
        return result
    }

    /**
     * Generated when a transaction aborts. (IComTransactionEvents.OnTransactionAbort)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidTx The transaction identifier.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtransactionevents-ontransactionabort
     */
    OnTransactionAbort(pInfo, guidTx) {
        result := ComCall(5, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidTx, "HRESULT")
        return result
    }

    /**
     * Generated when a transaction commits. (IComTransactionEvents.OnTransactionCommit)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidTx The transaction identifier.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtransactionevents-ontransactioncommit
     */
    OnTransactionCommit(pInfo, guidTx) {
        result := ComCall(6, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidTx, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComTransactionEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnTransactionStart := CallbackCreate(GetMethod(implObj, "OnTransactionStart"), flags, 5)
        this.vtbl.OnTransactionPrepare := CallbackCreate(GetMethod(implObj, "OnTransactionPrepare"), flags, 4)
        this.vtbl.OnTransactionAbort := CallbackCreate(GetMethod(implObj, "OnTransactionAbort"), flags, 3)
        this.vtbl.OnTransactionCommit := CallbackCreate(GetMethod(implObj, "OnTransactionCommit"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnTransactionStart)
        CallbackFree(this.vtbl.OnTransactionPrepare)
        CallbackFree(this.vtbl.OnTransactionAbort)
        CallbackFree(this.vtbl.OnTransactionCommit)
    }
}
