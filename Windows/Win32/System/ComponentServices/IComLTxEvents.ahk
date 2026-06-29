#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber of events that relate to COM+ transactions.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomltxevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComLTxEvents extends IUnknown {
    /**
     * The interface identifier for IComLTxEvents
     * @type {Guid}
     */
    static IID := Guid("{605cf82c-578e-4298-975d-82babcd9e053}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComLTxEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnLtxTransactionStart   : IntPtr
        OnLtxTransactionPrepare : IntPtr
        OnLtxTransactionAbort   : IntPtr
        OnLtxTransactionCommit  : IntPtr
        OnLtxTransactionPromote : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComLTxEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when a transaction is started.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidLtx A GUID that identifies the transaction.
     * @param {Guid} tsid A GUID that identifies the COM+ transaction context.
     * @param {BOOL} fRoot Indicates whether the COM+ transaction context is a root transaction context.
     * @param {Integer} nIsolationLevel The transaction isolation level of the root COM+ transactional context.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomltxevents-onltxtransactionstart
     */
    OnLtxTransactionStart(pInfo, guidLtx, tsid, fRoot, nIsolationLevel) {
        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidLtx, Guid, tsid, BOOL, fRoot, "int", nIsolationLevel, "HRESULT")
        return result
    }

    /**
     * Generated when COM+ receives a prepare notification for a transaction.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidLtx A GUID that identifies the transaction.
     * @param {BOOL} fVote The COM+ vote for the prepare request.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomltxevents-onltxtransactionprepare
     */
    OnLtxTransactionPrepare(pInfo, guidLtx, fVote) {
        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidLtx, BOOL, fVote, "HRESULT")
        return result
    }

    /**
     * Generated when a transaction is aborted.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidLtx A GUID that identifies the transaction.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomltxevents-onltxtransactionabort
     */
    OnLtxTransactionAbort(pInfo, guidLtx) {
        result := ComCall(5, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidLtx, "HRESULT")
        return result
    }

    /**
     * Generated when a transaction is committed.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidLtx A GUID that identifies the transaction.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomltxevents-onltxtransactioncommit
     */
    OnLtxTransactionCommit(pInfo, guidLtx) {
        result := ComCall(6, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidLtx, "HRESULT")
        return result
    }

    /**
     * Generated when a transaction is promoted.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidLtx A GUID that identifies the original transaction.
     * @param {Guid} txnId A GUID that identifies the promoted transaction.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomltxevents-onltxtransactionpromote
     */
    OnLtxTransactionPromote(pInfo, guidLtx, txnId) {
        result := ComCall(7, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidLtx, Guid, txnId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComLTxEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnLtxTransactionStart := CallbackCreate(GetMethod(implObj, "OnLtxTransactionStart"), flags, 6)
        this.vtbl.OnLtxTransactionPrepare := CallbackCreate(GetMethod(implObj, "OnLtxTransactionPrepare"), flags, 4)
        this.vtbl.OnLtxTransactionAbort := CallbackCreate(GetMethod(implObj, "OnLtxTransactionAbort"), flags, 3)
        this.vtbl.OnLtxTransactionCommit := CallbackCreate(GetMethod(implObj, "OnLtxTransactionCommit"), flags, 3)
        this.vtbl.OnLtxTransactionPromote := CallbackCreate(GetMethod(implObj, "OnLtxTransactionPromote"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnLtxTransactionStart)
        CallbackFree(this.vtbl.OnLtxTransactionPrepare)
        CallbackFree(this.vtbl.OnLtxTransactionAbort)
        CallbackFree(this.vtbl.OnLtxTransactionCommit)
        CallbackFree(this.vtbl.OnLtxTransactionPromote)
    }
}
