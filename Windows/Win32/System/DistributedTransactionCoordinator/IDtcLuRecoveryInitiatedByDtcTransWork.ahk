#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcLuRecoveryInitiatedByDtcTransWork extends IUnknown{
    /**
     * The interface identifier for IDtcLuRecoveryInitiatedByDtcTransWork
     * @type {Guid}
     */
    static IID => Guid("{4131e765-1aea-11d0-944b-00a0c905416e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pcbOurLogName 
     * @param {Pointer<UInt32>} pcbRemoteLogName 
     * @returns {HRESULT} 
     */
    GetLogNameSizes(pcbOurLogName, pcbRemoteLogName) {
        result := ComCall(3, this, "uint*", pcbOurLogName, "uint*", pcbRemoteLogName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pXln 
     * @param {Pointer<Byte>} pOurLogName 
     * @param {Pointer<Byte>} pRemoteLogName 
     * @param {Pointer<UInt32>} pdwProtocol 
     * @returns {HRESULT} 
     */
    GetOurXln(pXln, pOurLogName, pRemoteLogName, pdwProtocol) {
        result := ComCall(4, this, "int*", pXln, "char*", pOurLogName, "char*", pRemoteLogName, "uint*", pdwProtocol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Confirmation 
     * @returns {HRESULT} 
     */
    HandleConfirmationFromOurXln(Confirmation) {
        result := ComCall(5, this, "int", Confirmation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Xln 
     * @param {Pointer<Byte>} pRemoteLogName 
     * @param {Integer} cbRemoteLogName 
     * @param {Integer} dwProtocol 
     * @param {Pointer<Int32>} pConfirmation 
     * @returns {HRESULT} 
     */
    HandleTheirXlnResponse(Xln, pRemoteLogName, cbRemoteLogName, dwProtocol, pConfirmation) {
        result := ComCall(6, this, "int", Xln, "char*", pRemoteLogName, "uint", cbRemoteLogName, "uint", dwProtocol, "int*", pConfirmation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Error 
     * @returns {HRESULT} 
     */
    HandleErrorFromOurXln(Error) {
        result := ComCall(7, this, "int", Error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fCompareStates 
     * @returns {HRESULT} 
     */
    CheckForCompareStates(fCompareStates) {
        result := ComCall(8, this, "ptr", fCompareStates, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcbOurTransId 
     * @returns {HRESULT} 
     */
    GetOurTransIdSize(pcbOurTransId) {
        result := ComCall(9, this, "uint*", pcbOurTransId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pOurTransId 
     * @param {Pointer<Int32>} pCompareState 
     * @returns {HRESULT} 
     */
    GetOurCompareStates(pOurTransId, pCompareState) {
        result := ComCall(10, this, "char*", pOurTransId, "int*", pCompareState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CompareState 
     * @param {Pointer<Int32>} pConfirmation 
     * @returns {HRESULT} 
     */
    HandleTheirCompareStatesResponse(CompareState, pConfirmation) {
        result := ComCall(11, this, "int", CompareState, "int*", pConfirmation, "int")
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
        result := ComCall(12, this, "int", Error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ConversationLost() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plRecoverySeqNum 
     * @returns {HRESULT} 
     */
    GetRecoverySeqNum(plRecoverySeqNum) {
        result := ComCall(14, this, "int*", plRecoverySeqNum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lNewRecoverySeqNum 
     * @returns {HRESULT} 
     */
    ObsoleteRecoverySeqNum(lNewRecoverySeqNum) {
        result := ComCall(15, this, "int", lNewRecoverySeqNum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
