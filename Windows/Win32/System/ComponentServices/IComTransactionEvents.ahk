#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if the Microsoft Distributed Transaction Coordinator (DTC) transaction starts, commits, or aborts.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomtransactionevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComTransactionEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComTransactionEvents
     * @type {Guid}
     */
    static IID => Guid("{683130a8-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnTransactionStart", "OnTransactionPrepare", "OnTransactionAbort", "OnTransactionCommit"]

    /**
     * Generated when a Microsoft Distributed Transaction Coordinator (DTC) transaction starts.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidTx The transaction identifier.
     * @param {Pointer<Guid>} tsid The transaction stream identifier; a unique identifier for correlation to objects.
     * @param {BOOL} fRoot Indicates whether this is a root transaction.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomtransactionevents-ontransactionstart
     */
    OnTransactionStart(pInfo, guidTx, tsid, fRoot) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidTx, "ptr", tsid, "int", fRoot, "HRESULT")
        return result
    }

    /**
     * Generated when the prepare phase of the two-phase commit protocol of the transaction is completed.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidTx The transaction identifier.
     * @param {BOOL} fVoteYes The resource managers result concerning the outcome of the prepare phase.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomtransactionevents-ontransactionprepare
     */
    OnTransactionPrepare(pInfo, guidTx, fVoteYes) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidTx, "int", fVoteYes, "HRESULT")
        return result
    }

    /**
     * Generated when a transaction aborts.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidTx The transaction identifier.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomtransactionevents-ontransactionabort
     */
    OnTransactionAbort(pInfo, guidTx) {
        result := ComCall(5, this, "ptr", pInfo, "ptr", guidTx, "HRESULT")
        return result
    }

    /**
     * Generated when a transaction commits.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidTx The transaction identifier.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomtransactionevents-ontransactioncommit
     */
    OnTransactionCommit(pInfo, guidTx) {
        result := ComCall(6, this, "ptr", pInfo, "ptr", guidTx, "HRESULT")
        return result
    }
}
