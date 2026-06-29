#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber if a Microsoft Distributed Transaction Coordinator (DTC) transaction starts, commits, or aborts. The subscriber is also notified when the transaction is in the prepare phase of the two-phase commit protocol.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomtransaction2events
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComTransaction2Events extends IUnknown {
    /**
     * The interface identifier for IComTransaction2Events
     * @type {Guid}
     */
    static IID := Guid("{a136f62a-2f94-4288-86e0-d8a1fa4c0299}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComTransaction2Events interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnTransactionStart2   : IntPtr
        OnTransactionPrepare2 : IntPtr
        OnTransactionAbort2   : IntPtr
        OnTransactionCommit2  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComTransaction2Events.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when a Microsoft Distributed Transaction Coordinator (DTC) transaction starts. (IComTransaction2Events.OnTransactionStart2)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidTx The transaction identifier.
     * @param {Pointer<Guid>} tsid The transaction stream identifier for the correlation to objects.
     * @param {BOOL} fRoot Indicates whether the transaction is a root transaction.
     * @param {Integer} nIsolationLevel The isolation level of the transaction.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtransaction2events-ontransactionstart2
     */
    OnTransactionStart2(pInfo, guidTx, tsid, fRoot, nIsolationLevel) {
        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidTx, Guid.Ptr, tsid, BOOL, fRoot, "int", nIsolationLevel, "HRESULT")
        return result
    }

    /**
     * Generated when the transaction is in the prepare phase of the commit protocol.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidTx The transaction identifier.
     * @param {BOOL} fVoteYes The resource manager's result concerning the outcome of the prepare phase.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtransaction2events-ontransactionprepare2
     */
    OnTransactionPrepare2(pInfo, guidTx, fVoteYes) {
        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidTx, BOOL, fVoteYes, "HRESULT")
        return result
    }

    /**
     * Generated when a transaction aborts. (IComTransaction2Events.OnTransactionAbort2)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidTx The transaction identifier.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtransaction2events-ontransactionabort2
     */
    OnTransactionAbort2(pInfo, guidTx) {
        result := ComCall(5, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidTx, "HRESULT")
        return result
    }

    /**
     * Generated when a transaction commits. (IComTransaction2Events.OnTransactionCommit2)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidTx The transaction identifier.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtransaction2events-ontransactioncommit2
     */
    OnTransactionCommit2(pInfo, guidTx) {
        result := ComCall(6, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidTx, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComTransaction2Events.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnTransactionStart2 := CallbackCreate(GetMethod(implObj, "OnTransactionStart2"), flags, 6)
        this.vtbl.OnTransactionPrepare2 := CallbackCreate(GetMethod(implObj, "OnTransactionPrepare2"), flags, 4)
        this.vtbl.OnTransactionAbort2 := CallbackCreate(GetMethod(implObj, "OnTransactionAbort2"), flags, 3)
        this.vtbl.OnTransactionCommit2 := CallbackCreate(GetMethod(implObj, "OnTransactionCommit2"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnTransactionStart2)
        CallbackFree(this.vtbl.OnTransactionPrepare2)
        CallbackFree(this.vtbl.OnTransactionAbort2)
        CallbackFree(this.vtbl.OnTransactionCommit2)
    }
}
