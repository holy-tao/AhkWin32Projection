#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcLuRecoveryInitiatedByLuWork extends IUnknown{
    /**
     * The interface identifier for IDtcLuRecoveryInitiatedByLuWork
     * @type {Guid}
     */
    static IID => Guid("{ac2b8ad1-d6f0-11d0-b386-00a0c9083365}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lRecoverySeqNum 
     * @param {Integer} Xln 
     * @param {Pointer<Byte>} pRemoteLogName 
     * @param {Integer} cbRemoteLogName 
     * @param {Pointer<Byte>} pOurLogName 
     * @param {Integer} cbOurLogName 
     * @param {Integer} dwProtocol 
     * @param {Pointer<Int32>} pResponse 
     * @returns {HRESULT} 
     */
    HandleTheirXln(lRecoverySeqNum, Xln, pRemoteLogName, cbRemoteLogName, pOurLogName, cbOurLogName, dwProtocol, pResponse) {
        result := ComCall(3, this, "int", lRecoverySeqNum, "int", Xln, "char*", pRemoteLogName, "uint", cbRemoteLogName, "char*", pOurLogName, "uint", cbOurLogName, "uint", dwProtocol, "int*", pResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcbOurLogName 
     * @returns {HRESULT} 
     */
    GetOurLogNameSize(pcbOurLogName) {
        result := ComCall(4, this, "uint*", pcbOurLogName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pXln 
     * @param {Pointer<Byte>} pOurLogName 
     * @param {Pointer<UInt32>} pdwProtocol 
     * @returns {HRESULT} 
     */
    GetOurXln(pXln, pOurLogName, pdwProtocol) {
        result := ComCall(5, this, "int*", pXln, "char*", pOurLogName, "uint*", pdwProtocol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Confirmation 
     * @returns {HRESULT} 
     */
    HandleConfirmationOfOurXln(Confirmation) {
        result := ComCall(6, this, "int", Confirmation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pRemoteTransId 
     * @param {Integer} cbRemoteTransId 
     * @param {Integer} CompareState 
     * @param {Pointer<Int32>} pResponse 
     * @param {Pointer<Int32>} pCompareState 
     * @returns {HRESULT} 
     */
    HandleTheirCompareStates(pRemoteTransId, cbRemoteTransId, CompareState, pResponse, pCompareState) {
        result := ComCall(7, this, "char*", pRemoteTransId, "uint", cbRemoteTransId, "int", CompareState, "int*", pResponse, "int*", pCompareState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Confirmation 
     * @returns {HRESULT} 
     */
    HandleConfirmationOfOurCompareStates(Confirmation) {
        result := ComCall(8, this, "int", Confirmation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Error 
     * @returns {HRESULT} 
     */
    HandleErrorFromOurCompareStates(Error) {
        result := ComCall(9, this, "int", Error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ConversationLost() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
