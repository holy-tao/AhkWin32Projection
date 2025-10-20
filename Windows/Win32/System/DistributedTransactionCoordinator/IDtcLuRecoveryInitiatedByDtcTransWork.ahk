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
        result := ComCall(3, this, "uint*", pcbOurLogName, "uint*", pcbRemoteLogName, "HRESULT")
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
        result := ComCall(4, this, "int*", pXln, "char*", pOurLogName, "char*", pRemoteLogName, "uint*", pdwProtocol, "HRESULT")
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
        result := ComCall(6, this, "int", Xln, "char*", pRemoteLogName, "uint", cbRemoteLogName, "uint", dwProtocol, "int*", pConfirmation, "HRESULT")
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
        result := ComCall(9, this, "uint*", pcbOurTransId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pOurTransId 
     * @param {Pointer<Integer>} pCompareState 
     * @returns {HRESULT} 
     */
    GetOurCompareStates(pOurTransId, pCompareState) {
        result := ComCall(10, this, "char*", pOurTransId, "int*", pCompareState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CompareState 
     * @param {Pointer<Integer>} pConfirmation 
     * @returns {HRESULT} 
     */
    HandleTheirCompareStatesResponse(CompareState, pConfirmation) {
        result := ComCall(11, this, "int", CompareState, "int*", pConfirmation, "HRESULT")
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
        result := ComCall(14, this, "int*", plRecoverySeqNum, "HRESULT")
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
