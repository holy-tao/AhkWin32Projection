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
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidLtx 
     * @param {Pointer<Guid>} tsid 
     * @param {BOOL} fRoot 
     * @param {Integer} nIsolationLevel 
     * @returns {HRESULT} 
     */
    OnLtxTransactionStart(pInfo, guidLtx, tsid, fRoot, nIsolationLevel) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidLtx, "ptr", tsid, "int", fRoot, "int", nIsolationLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidLtx 
     * @param {BOOL} fVote 
     * @returns {HRESULT} 
     */
    OnLtxTransactionPrepare(pInfo, guidLtx, fVote) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidLtx, "int", fVote, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidLtx 
     * @returns {HRESULT} 
     */
    OnLtxTransactionAbort(pInfo, guidLtx) {
        result := ComCall(5, this, "ptr", pInfo, "ptr", guidLtx, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidLtx 
     * @returns {HRESULT} 
     */
    OnLtxTransactionCommit(pInfo, guidLtx) {
        result := ComCall(6, this, "ptr", pInfo, "ptr", guidLtx, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidLtx 
     * @param {Pointer<Guid>} txnId 
     * @returns {HRESULT} 
     */
    OnLtxTransactionPromote(pInfo, guidLtx, txnId) {
        result := ComCall(7, this, "ptr", pInfo, "ptr", guidLtx, "ptr", txnId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
