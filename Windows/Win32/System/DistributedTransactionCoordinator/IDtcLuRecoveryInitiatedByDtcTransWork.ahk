#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DTCLUXLN.ahk" { DTCLUXLN }
#Import ".\DTCLUXLNCONFIRMATION.ahk" { DTCLUXLNCONFIRMATION }
#Import ".\DTCLUCOMPARESTATESERROR.ahk" { DTCLUCOMPARESTATESERROR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DTCLUCOMPARESTATESCONFIRMATION.ahk" { DTCLUCOMPARESTATESCONFIRMATION }
#Import ".\DTCLUCOMPARESTATE.ahk" { DTCLUCOMPARESTATE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DTCLUXLNERROR.ahk" { DTCLUXLNERROR }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IDtcLuRecoveryInitiatedByDtcTransWork extends IUnknown {
    /**
     * The interface identifier for IDtcLuRecoveryInitiatedByDtcTransWork
     * @type {Guid}
     */
    static IID := Guid("{4131e765-1aea-11d0-944b-00a0c905416e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDtcLuRecoveryInitiatedByDtcTransWork interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLogNameSizes                  : IntPtr
        GetOurXln                        : IntPtr
        HandleConfirmationFromOurXln     : IntPtr
        HandleTheirXlnResponse           : IntPtr
        HandleErrorFromOurXln            : IntPtr
        CheckForCompareStates            : IntPtr
        GetOurTransIdSize                : IntPtr
        GetOurCompareStates              : IntPtr
        HandleTheirCompareStatesResponse : IntPtr
        HandleErrorFromOurCompareStates  : IntPtr
        ConversationLost                 : IntPtr
        GetRecoverySeqNum                : IntPtr
        ObsoleteRecoverySeqNum           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDtcLuRecoveryInitiatedByDtcTransWork.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {Pointer<DTCLUXLN>} pXln 
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
     * @param {DTCLUXLNCONFIRMATION} Confirmation 
     * @returns {HRESULT} 
     */
    HandleConfirmationFromOurXln(Confirmation) {
        result := ComCall(5, this, DTCLUXLNCONFIRMATION, Confirmation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {DTCLUXLN} Xln 
     * @param {Pointer<Integer>} pRemoteLogName 
     * @param {Integer} cbRemoteLogName 
     * @param {Integer} dwProtocol 
     * @param {Pointer<DTCLUXLNCONFIRMATION>} pConfirmation 
     * @returns {HRESULT} 
     */
    HandleTheirXlnResponse(Xln, pRemoteLogName, cbRemoteLogName, dwProtocol, pConfirmation) {
        pRemoteLogNameMarshal := pRemoteLogName is VarRef ? "char*" : "ptr"
        pConfirmationMarshal := pConfirmation is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, DTCLUXLN, Xln, pRemoteLogNameMarshal, pRemoteLogName, "uint", cbRemoteLogName, "uint", dwProtocol, pConfirmationMarshal, pConfirmation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {DTCLUXLNERROR} _Error 
     * @returns {HRESULT} 
     */
    HandleErrorFromOurXln(_Error) {
        result := ComCall(7, this, DTCLUXLNERROR, _Error, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fCompareStates 
     * @returns {HRESULT} 
     */
    CheckForCompareStates(fCompareStates) {
        fCompareStatesMarshal := fCompareStates is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, fCompareStatesMarshal, fCompareStates, "HRESULT")
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
     * @param {Pointer<DTCLUCOMPARESTATE>} pCompareState 
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
     * @param {DTCLUCOMPARESTATE} CompareState 
     * @param {Pointer<DTCLUCOMPARESTATESCONFIRMATION>} pConfirmation 
     * @returns {HRESULT} 
     */
    HandleTheirCompareStatesResponse(CompareState, pConfirmation) {
        pConfirmationMarshal := pConfirmation is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, DTCLUCOMPARESTATE, CompareState, pConfirmationMarshal, pConfirmation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {DTCLUCOMPARESTATESERROR} _Error 
     * @returns {HRESULT} 
     */
    HandleErrorFromOurCompareStates(_Error) {
        result := ComCall(12, this, DTCLUCOMPARESTATESERROR, _Error, "HRESULT")
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

    Query(iid) {
        if (IDtcLuRecoveryInitiatedByDtcTransWork.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLogNameSizes := CallbackCreate(GetMethod(implObj, "GetLogNameSizes"), flags, 3)
        this.vtbl.GetOurXln := CallbackCreate(GetMethod(implObj, "GetOurXln"), flags, 5)
        this.vtbl.HandleConfirmationFromOurXln := CallbackCreate(GetMethod(implObj, "HandleConfirmationFromOurXln"), flags, 2)
        this.vtbl.HandleTheirXlnResponse := CallbackCreate(GetMethod(implObj, "HandleTheirXlnResponse"), flags, 6)
        this.vtbl.HandleErrorFromOurXln := CallbackCreate(GetMethod(implObj, "HandleErrorFromOurXln"), flags, 2)
        this.vtbl.CheckForCompareStates := CallbackCreate(GetMethod(implObj, "CheckForCompareStates"), flags, 2)
        this.vtbl.GetOurTransIdSize := CallbackCreate(GetMethod(implObj, "GetOurTransIdSize"), flags, 2)
        this.vtbl.GetOurCompareStates := CallbackCreate(GetMethod(implObj, "GetOurCompareStates"), flags, 3)
        this.vtbl.HandleTheirCompareStatesResponse := CallbackCreate(GetMethod(implObj, "HandleTheirCompareStatesResponse"), flags, 3)
        this.vtbl.HandleErrorFromOurCompareStates := CallbackCreate(GetMethod(implObj, "HandleErrorFromOurCompareStates"), flags, 2)
        this.vtbl.ConversationLost := CallbackCreate(GetMethod(implObj, "ConversationLost"), flags, 1)
        this.vtbl.GetRecoverySeqNum := CallbackCreate(GetMethod(implObj, "GetRecoverySeqNum"), flags, 2)
        this.vtbl.ObsoleteRecoverySeqNum := CallbackCreate(GetMethod(implObj, "ObsoleteRecoverySeqNum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLogNameSizes)
        CallbackFree(this.vtbl.GetOurXln)
        CallbackFree(this.vtbl.HandleConfirmationFromOurXln)
        CallbackFree(this.vtbl.HandleTheirXlnResponse)
        CallbackFree(this.vtbl.HandleErrorFromOurXln)
        CallbackFree(this.vtbl.CheckForCompareStates)
        CallbackFree(this.vtbl.GetOurTransIdSize)
        CallbackFree(this.vtbl.GetOurCompareStates)
        CallbackFree(this.vtbl.HandleTheirCompareStatesResponse)
        CallbackFree(this.vtbl.HandleErrorFromOurCompareStates)
        CallbackFree(this.vtbl.ConversationLost)
        CallbackFree(this.vtbl.GetRecoverySeqNum)
        CallbackFree(this.vtbl.ObsoleteRecoverySeqNum)
    }
}
