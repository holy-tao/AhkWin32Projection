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
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidTx 
     * @param {Pointer<Guid>} tsid 
     * @param {BOOL} fRoot 
     * @returns {HRESULT} 
     */
    OnTransactionStart(pInfo, guidTx, tsid, fRoot) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidTx, "ptr", tsid, "int", fRoot, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidTx 
     * @param {BOOL} fVoteYes 
     * @returns {HRESULT} 
     */
    OnTransactionPrepare(pInfo, guidTx, fVoteYes) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidTx, "int", fVoteYes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidTx 
     * @returns {HRESULT} 
     */
    OnTransactionAbort(pInfo, guidTx) {
        result := ComCall(5, this, "ptr", pInfo, "ptr", guidTx, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidTx 
     * @returns {HRESULT} 
     */
    OnTransactionCommit(pInfo, guidTx) {
        result := ComCall(6, this, "ptr", pInfo, "ptr", guidTx, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
