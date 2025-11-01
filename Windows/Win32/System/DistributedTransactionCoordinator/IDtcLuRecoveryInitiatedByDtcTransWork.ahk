#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcLuRecoveryInitiatedByDtcTransWork extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLogNameSizes", "GetOurXln", "HandleConfirmationFromOurXln", "HandleTheirXlnResponse", "HandleErrorFromOurXln", "CheckForCompareStates", "GetOurTransIdSize", "GetOurCompareStates", "HandleTheirCompareStatesResponse", "HandleErrorFromOurCompareStates", "ConversationLost", "GetRecoverySeqNum", "ObsoleteRecoverySeqNum"]

    /**
     * 
     * @param {Pointer<Integer>} pcbOurLogName 
     * @param {Pointer<Integer>} pcbRemoteLogName 
     * @returns {HRESULT} 
     */
    GetLogNameSizes(pcbOurLogName, pcbRemoteLogName) {
        pcbOurLogNameMarshal := pcbOurLogName is VarRef ? "uint*" : "ptr"
        pcbRemoteLogNameMarshal := pcbRemoteLogName is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcbOurLogNameMarshal, pcbOurLogName, pcbRemoteLogNameMarshal, pcbRemoteLogName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pXln 
     * @param {Pointer<Integer>} pOurLogName 
     * @param {Pointer<Integer>} pRemoteLogName 
     * @param {Pointer<Integer>} pdwProtocol 
     * @returns {HRESULT} 
     */
    GetOurXln(pXln, pOurLogName, pRemoteLogName, pdwProtocol) {
        pXlnMarshal := pXln is VarRef ? "int*" : "ptr"
        pOurLogNameMarshal := pOurLogName is VarRef ? "char*" : "ptr"
        pRemoteLogNameMarshal := pRemoteLogName is VarRef ? "char*" : "ptr"
        pdwProtocolMarshal := pdwProtocol is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pXlnMarshal, pXln, pOurLogNameMarshal, pOurLogName, pRemoteLogNameMarshal, pRemoteLogName, pdwProtocolMarshal, pdwProtocol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Confirmation 
     * @returns {HRESULT} 
     */
    HandleConfirmationFromOurXln(Confirmation) {
        result := ComCall(5, this, "int", Confirmation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Xln 
     * @param {Pointer<Integer>} pRemoteLogName 
     * @param {Integer} cbRemoteLogName 
     * @param {Integer} dwProtocol 
     * @param {Pointer<Integer>} pConfirmation 
     * @returns {HRESULT} 
     */
    HandleTheirXlnResponse(Xln, pRemoteLogName, cbRemoteLogName, dwProtocol, pConfirmation) {
        pRemoteLogNameMarshal := pRemoteLogName is VarRef ? "char*" : "ptr"
        pConfirmationMarshal := pConfirmation is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "int", Xln, pRemoteLogNameMarshal, pRemoteLogName, "uint", cbRemoteLogName, "uint", dwProtocol, pConfirmationMarshal, pConfirmation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Error 
     * @returns {HRESULT} 
     */
    HandleErrorFromOurXln(Error) {
        result := ComCall(7, this, "int", Error, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fCompareStates 
     * @returns {HRESULT} 
     */
    CheckForCompareStates(fCompareStates) {
        result := ComCall(8, this, "ptr", fCompareStates, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbOurTransId 
     * @returns {HRESULT} 
     */
    GetOurTransIdSize(pcbOurTransId) {
        pcbOurTransIdMarshal := pcbOurTransId is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pcbOurTransIdMarshal, pcbOurTransId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pOurTransId 
     * @param {Pointer<Integer>} pCompareState 
     * @returns {HRESULT} 
     */
    GetOurCompareStates(pOurTransId, pCompareState) {
        pOurTransIdMarshal := pOurTransId is VarRef ? "char*" : "ptr"
        pCompareStateMarshal := pCompareState is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pOurTransIdMarshal, pOurTransId, pCompareStateMarshal, pCompareState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CompareState 
     * @param {Pointer<Integer>} pConfirmation 
     * @returns {HRESULT} 
     */
    HandleTheirCompareStatesResponse(CompareState, pConfirmation) {
        pConfirmationMarshal := pConfirmation is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "int", CompareState, pConfirmationMarshal, pConfirmation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Error 
     * @returns {HRESULT} 
     */
    HandleErrorFromOurCompareStates(Error) {
        result := ComCall(12, this, "int", Error, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ConversationLost() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRecoverySeqNum 
     * @returns {HRESULT} 
     */
    GetRecoverySeqNum(plRecoverySeqNum) {
        plRecoverySeqNumMarshal := plRecoverySeqNum is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, plRecoverySeqNumMarshal, plRecoverySeqNum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lNewRecoverySeqNum 
     * @returns {HRESULT} 
     */
    ObsoleteRecoverySeqNum(lNewRecoverySeqNum) {
        result := ComCall(15, this, "int", lNewRecoverySeqNum, "HRESULT")
        return result
    }
}
