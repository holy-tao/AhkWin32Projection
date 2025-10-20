#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if a Microsoft Distributed Transaction Coordinator (DTC) transaction starts, commits, or aborts. The subscriber is also notified when the transaction is in the prepare phase of the two-phase commit protocol.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomtransaction2events
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComTransaction2Events extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComTransaction2Events
     * @type {Guid}
     */
    static IID => Guid("{a136f62a-2f94-4288-86e0-d8a1fa4c0299}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnTransactionStart2", "OnTransactionPrepare2", "OnTransactionAbort2", "OnTransactionCommit2"]

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidTx 
     * @param {Pointer<Guid>} tsid 
     * @param {BOOL} fRoot 
     * @param {Integer} nIsolationLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtransaction2events-ontransactionstart2
     */
    OnTransactionStart2(pInfo, guidTx, tsid, fRoot, nIsolationLevel) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidTx, "ptr", tsid, "int", fRoot, "int", nIsolationLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidTx 
     * @param {BOOL} fVoteYes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtransaction2events-ontransactionprepare2
     */
    OnTransactionPrepare2(pInfo, guidTx, fVoteYes) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidTx, "int", fVoteYes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidTx 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtransaction2events-ontransactionabort2
     */
    OnTransactionAbort2(pInfo, guidTx) {
        result := ComCall(5, this, "ptr", pInfo, "ptr", guidTx, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidTx 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtransaction2events-ontransactioncommit2
     */
    OnTransactionCommit2(pInfo, guidTx) {
        result := ComCall(6, this, "ptr", pInfo, "ptr", guidTx, "HRESULT")
        return result
    }
}
