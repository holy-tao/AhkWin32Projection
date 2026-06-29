#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DTCLUCOMPARESTATESERROR.ahk" { DTCLUCOMPARESTATESERROR }
#Import ".\DTCLUXLNCONFIRMATION.ahk" { DTCLUXLNCONFIRMATION }
#Import ".\DTCLUXLN.ahk" { DTCLUXLN }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DTCLUCOMPARESTATESRESPONSE.ahk" { DTCLUCOMPARESTATESRESPONSE }
#Import ".\DTCLUXLNRESPONSE.ahk" { DTCLUXLNRESPONSE }
#Import ".\DTCLUCOMPARESTATE.ahk" { DTCLUCOMPARESTATE }
#Import ".\DTCLUCOMPARESTATESCONFIRMATION.ahk" { DTCLUCOMPARESTATESCONFIRMATION }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IDtcLuRecoveryInitiatedByLuWork extends IUnknown {
    /**
     * The interface identifier for IDtcLuRecoveryInitiatedByLuWork
     * @type {Guid}
     */
    static IID := Guid("{ac2b8ad1-d6f0-11d0-b386-00a0c9083365}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDtcLuRecoveryInitiatedByLuWork interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HandleTheirXln                       : IntPtr
        GetOurLogNameSize                    : IntPtr
        GetOurXln                            : IntPtr
        HandleConfirmationOfOurXln           : IntPtr
        HandleTheirCompareStates             : IntPtr
        HandleConfirmationOfOurCompareStates : IntPtr
        HandleErrorFromOurCompareStates      : IntPtr
        ConversationLost                     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDtcLuRecoveryInitiatedByLuWork.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} lRecoverySeqNum 
     * @param {DTCLUXLN} Xln 
     * @param {Pointer<Integer>} pRemoteLogName 
     * @param {Integer} cbRemoteLogName 
     * @param {Pointer<Integer>} pOurLogName 
     * @param {Integer} cbOurLogName 
     * @param {Integer} dwProtocol 
     * @param {Pointer<DTCLUXLNRESPONSE>} pResponse 
     * @returns {HRESULT} 
     */
    HandleTheirXln(lRecoverySeqNum, Xln, pRemoteLogName, cbRemoteLogName, pOurLogName, cbOurLogName, dwProtocol, pResponse) {
        pRemoteLogNameMarshal := pRemoteLogName is VarRef ? "char*" : "ptr"
        pOurLogNameMarshal := pOurLogName is VarRef ? "char*" : "ptr"
        pResponseMarshal := pResponse is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "int", lRecoverySeqNum, DTCLUXLN, Xln, pRemoteLogNameMarshal, pRemoteLogName, "uint", cbRemoteLogName, pOurLogNameMarshal, pOurLogName, "uint", cbOurLogName, "uint", dwProtocol, pResponseMarshal, pResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbOurLogName 
     * @returns {HRESULT} 
     */
    GetOurLogNameSize(pcbOurLogName) {
        pcbOurLogNameMarshal := pcbOurLogName is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pcbOurLogNameMarshal, pcbOurLogName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DTCLUXLN>} pXln 
     * @param {Pointer<Integer>} pOurLogName 
     * @param {Pointer<Integer>} pdwProtocol 
     * @returns {HRESULT} 
     */
    GetOurXln(pXln, pOurLogName, pdwProtocol) {
        pXlnMarshal := pXln is VarRef ? "int*" : "ptr"
        pOurLogNameMarshal := pOurLogName is VarRef ? "char*" : "ptr"
        pdwProtocolMarshal := pdwProtocol is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pXlnMarshal, pXln, pOurLogNameMarshal, pOurLogName, pdwProtocolMarshal, pdwProtocol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {DTCLUXLNCONFIRMATION} Confirmation 
     * @returns {HRESULT} 
     */
    HandleConfirmationOfOurXln(Confirmation) {
        result := ComCall(6, this, DTCLUXLNCONFIRMATION, Confirmation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRemoteTransId 
     * @param {Integer} cbRemoteTransId 
     * @param {DTCLUCOMPARESTATE} CompareState 
     * @param {Pointer<DTCLUCOMPARESTATESRESPONSE>} pResponse 
     * @param {Pointer<DTCLUCOMPARESTATE>} pCompareState 
     * @returns {HRESULT} 
     */
    HandleTheirCompareStates(pRemoteTransId, cbRemoteTransId, CompareState, pResponse, pCompareState) {
        pRemoteTransIdMarshal := pRemoteTransId is VarRef ? "char*" : "ptr"
        pResponseMarshal := pResponse is VarRef ? "int*" : "ptr"
        pCompareStateMarshal := pCompareState is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pRemoteTransIdMarshal, pRemoteTransId, "uint", cbRemoteTransId, DTCLUCOMPARESTATE, CompareState, pResponseMarshal, pResponse, pCompareStateMarshal, pCompareState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {DTCLUCOMPARESTATESCONFIRMATION} Confirmation 
     * @returns {HRESULT} 
     */
    HandleConfirmationOfOurCompareStates(Confirmation) {
        result := ComCall(8, this, DTCLUCOMPARESTATESCONFIRMATION, Confirmation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {DTCLUCOMPARESTATESERROR} _Error 
     * @returns {HRESULT} 
     */
    HandleErrorFromOurCompareStates(_Error) {
        result := ComCall(9, this, DTCLUCOMPARESTATESERROR, _Error, "HRESULT")
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

    Query(iid) {
        if (IDtcLuRecoveryInitiatedByLuWork.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HandleTheirXln := CallbackCreate(GetMethod(implObj, "HandleTheirXln"), flags, 9)
        this.vtbl.GetOurLogNameSize := CallbackCreate(GetMethod(implObj, "GetOurLogNameSize"), flags, 2)
        this.vtbl.GetOurXln := CallbackCreate(GetMethod(implObj, "GetOurXln"), flags, 4)
        this.vtbl.HandleConfirmationOfOurXln := CallbackCreate(GetMethod(implObj, "HandleConfirmationOfOurXln"), flags, 2)
        this.vtbl.HandleTheirCompareStates := CallbackCreate(GetMethod(implObj, "HandleTheirCompareStates"), flags, 6)
        this.vtbl.HandleConfirmationOfOurCompareStates := CallbackCreate(GetMethod(implObj, "HandleConfirmationOfOurCompareStates"), flags, 2)
        this.vtbl.HandleErrorFromOurCompareStates := CallbackCreate(GetMethod(implObj, "HandleErrorFromOurCompareStates"), flags, 2)
        this.vtbl.ConversationLost := CallbackCreate(GetMethod(implObj, "ConversationLost"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HandleTheirXln)
        CallbackFree(this.vtbl.GetOurLogNameSize)
        CallbackFree(this.vtbl.GetOurXln)
        CallbackFree(this.vtbl.HandleConfirmationOfOurXln)
        CallbackFree(this.vtbl.HandleTheirCompareStates)
        CallbackFree(this.vtbl.HandleConfirmationOfOurCompareStates)
        CallbackFree(this.vtbl.HandleErrorFromOurCompareStates)
        CallbackFree(this.vtbl.ConversationLost)
    }
}
