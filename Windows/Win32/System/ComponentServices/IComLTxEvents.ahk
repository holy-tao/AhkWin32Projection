#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber of events that relate to COM+ transactions.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomltxevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComLTxEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComLTxEvents
     * @type {Guid}
     */
    static IID => Guid("{605cf82c-578e-4298-975d-82babcd9e053}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnLtxTransactionStart", "OnLtxTransactionPrepare", "OnLtxTransactionAbort", "OnLtxTransactionCommit", "OnLtxTransactionPromote"]

    /**
     * Generated when a transaction is started.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidLtx A GUID that identifies the transaction.
     * @param {Guid} tsid A GUID that identifies the COM+ transaction context.
     * @param {BOOL} fRoot Indicates whether the COM+ transaction context is a root transaction context.
     * @param {Integer} nIsolationLevel The transaction isolation level of the root COM+ transactional context.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomltxevents-onltxtransactionstart
     */
    OnLtxTransactionStart(pInfo, guidLtx, tsid, fRoot, nIsolationLevel) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidLtx, "ptr", tsid, "int", fRoot, "int", nIsolationLevel, "HRESULT")
        return result
    }

    /**
     * Generated when COM+ receives a prepare notification for a transaction.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidLtx A GUID that identifies the transaction.
     * @param {BOOL} fVote The COM+ vote for the prepare request.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomltxevents-onltxtransactionprepare
     */
    OnLtxTransactionPrepare(pInfo, guidLtx, fVote) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidLtx, "int", fVote, "HRESULT")
        return result
    }

    /**
     * Generated when a transaction is aborted.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidLtx A GUID that identifies the transaction.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomltxevents-onltxtransactionabort
     */
    OnLtxTransactionAbort(pInfo, guidLtx) {
        result := ComCall(5, this, "ptr", pInfo, "ptr", guidLtx, "HRESULT")
        return result
    }

    /**
     * Generated when a transaction is committed.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidLtx A GUID that identifies the transaction.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomltxevents-onltxtransactioncommit
     */
    OnLtxTransactionCommit(pInfo, guidLtx) {
        result := ComCall(6, this, "ptr", pInfo, "ptr", guidLtx, "HRESULT")
        return result
    }

    /**
     * Generated when a transaction is promoted.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidLtx A GUID that identifies the original transaction.
     * @param {Guid} txnId A GUID that identifies the promoted transaction.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomltxevents-onltxtransactionpromote
     */
    OnLtxTransactionPromote(pInfo, guidLtx, txnId) {
        result := ComCall(7, this, "ptr", pInfo, "ptr", guidLtx, "ptr", txnId, "HRESULT")
        return result
    }
}
