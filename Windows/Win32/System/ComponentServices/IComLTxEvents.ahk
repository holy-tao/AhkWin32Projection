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
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidLtx 
     * @param {Guid} tsid 
     * @param {BOOL} fRoot 
     * @param {Integer} nIsolationLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomltxevents-onltxtransactionstart
     */
    OnLtxTransactionStart(pInfo, guidLtx, tsid, fRoot, nIsolationLevel) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidLtx, "ptr", tsid, "int", fRoot, "int", nIsolationLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidLtx 
     * @param {BOOL} fVote 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomltxevents-onltxtransactionprepare
     */
    OnLtxTransactionPrepare(pInfo, guidLtx, fVote) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidLtx, "int", fVote, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidLtx 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomltxevents-onltxtransactionabort
     */
    OnLtxTransactionAbort(pInfo, guidLtx) {
        result := ComCall(5, this, "ptr", pInfo, "ptr", guidLtx, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidLtx 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomltxevents-onltxtransactioncommit
     */
    OnLtxTransactionCommit(pInfo, guidLtx) {
        result := ComCall(6, this, "ptr", pInfo, "ptr", guidLtx, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidLtx 
     * @param {Guid} txnId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomltxevents-onltxtransactionpromote
     */
    OnLtxTransactionPromote(pInfo, guidLtx, txnId) {
        result := ComCall(7, this, "ptr", pInfo, "ptr", guidLtx, "ptr", txnId, "HRESULT")
        return result
    }
}
