#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcLuRecoveryInitiatedByLuWork extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HandleTheirXln", "GetOurLogNameSize", "GetOurXln", "HandleConfirmationOfOurXln", "HandleTheirCompareStates", "HandleConfirmationOfOurCompareStates", "HandleErrorFromOurCompareStates", "ConversationLost"]

    /**
     * 
     * @param {Integer} lRecoverySeqNum 
     * @param {Integer} Xln 
     * @param {Pointer<Integer>} pRemoteLogName 
     * @param {Integer} cbRemoteLogName 
     * @param {Pointer<Integer>} pOurLogName 
     * @param {Integer} cbOurLogName 
     * @param {Integer} dwProtocol 
     * @param {Pointer<Integer>} pResponse 
     * @returns {HRESULT} 
     */
    HandleTheirXln(lRecoverySeqNum, Xln, pRemoteLogName, cbRemoteLogName, pOurLogName, cbOurLogName, dwProtocol, pResponse) {
        result := ComCall(3, this, "int", lRecoverySeqNum, "int", Xln, "char*", pRemoteLogName, "uint", cbRemoteLogName, "char*", pOurLogName, "uint", cbOurLogName, "uint", dwProtocol, "int*", pResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbOurLogName 
     * @returns {HRESULT} 
     */
    GetOurLogNameSize(pcbOurLogName) {
        result := ComCall(4, this, "uint*", pcbOurLogName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pXln 
     * @param {Pointer<Integer>} pOurLogName 
     * @param {Pointer<Integer>} pdwProtocol 
     * @returns {HRESULT} 
     */
    GetOurXln(pXln, pOurLogName, pdwProtocol) {
        result := ComCall(5, this, "int*", pXln, "char*", pOurLogName, "uint*", pdwProtocol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Confirmation 
     * @returns {HRESULT} 
     */
    HandleConfirmationOfOurXln(Confirmation) {
        result := ComCall(6, this, "int", Confirmation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRemoteTransId 
     * @param {Integer} cbRemoteTransId 
     * @param {Integer} CompareState 
     * @param {Pointer<Integer>} pResponse 
     * @param {Pointer<Integer>} pCompareState 
     * @returns {HRESULT} 
     */
    HandleTheirCompareStates(pRemoteTransId, cbRemoteTransId, CompareState, pResponse, pCompareState) {
        result := ComCall(7, this, "char*", pRemoteTransId, "uint", cbRemoteTransId, "int", CompareState, "int*", pResponse, "int*", pCompareState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Confirmation 
     * @returns {HRESULT} 
     */
    HandleConfirmationOfOurCompareStates(Confirmation) {
        result := ComCall(8, this, "int", Confirmation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Error 
     * @returns {HRESULT} 
     */
    HandleErrorFromOurCompareStates(Error) {
        result := ComCall(9, this, "int", Error, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ConversationLost() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
