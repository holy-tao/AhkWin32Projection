#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber about activities of the Compensating Resource Manager (CRM) feature of Component Services.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomcrmevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComCRMEvents extends IUnknown {
    /**
     * The interface identifier for IComCRMEvents
     * @type {Guid}
     */
    static IID := Guid("{683130b5-2e50-11d2-98a5-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComCRMEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnCRMRecoveryStart : IntPtr
        OnCRMRecoveryDone  : IntPtr
        OnCRMCheckpoint    : IntPtr
        OnCRMBegin         : IntPtr
        OnCRMPrepare       : IntPtr
        OnCRMCommit        : IntPtr
        OnCRMAbort         : IntPtr
        OnCRMIndoubt       : IntPtr
        OnCRMDone          : IntPtr
        OnCRMRelease       : IntPtr
        OnCRMAnalyze       : IntPtr
        OnCRMWrite         : IntPtr
        OnCRMForget        : IntPtr
        OnCRMForce         : IntPtr
        OnCRMDeliver       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComCRMEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when CRM recovery has started.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The globally unique identifier (GUID) of the application.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmrecoverystart
     */
    OnCRMRecoveryStart(pInfo, guidApp) {
        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidApp, "HRESULT")
        return result
    }

    /**
     * Generated when CRM recovery is done.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The globally unique identifier (GUID) of the application.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmrecoverydone
     */
    OnCRMRecoveryDone(pInfo, guidApp) {
        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidApp, "HRESULT")
        return result
    }

    /**
     * Generated when a CRM checkpoint occurs.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The globally unique identifier (GUID) of the application.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmcheckpoint
     */
    OnCRMCheckpoint(pInfo, guidApp) {
        result := ComCall(5, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidApp, "HRESULT")
        return result
    }

    /**
     * Generated when a CRM clerk is starting, either due to a client registering a compensator or during recovery.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @param {Guid} guidActivity The activity identifier (NULL if recovery).
     * @param {Guid} guidTx The identifier of the Transaction Unit Of Work (UOW).
     * @param {PWSTR} szProgIdCompensator The ProgID of the CRM compensator.
     * @param {PWSTR} szDescription The description (blank if recovery).
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmbegin
     */
    OnCRMBegin(pInfo, guidClerkCLSID, guidActivity, guidTx, szProgIdCompensator, szDescription) {
        szProgIdCompensator := szProgIdCompensator is String ? StrPtr(szProgIdCompensator) : szProgIdCompensator
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        result := ComCall(6, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidClerkCLSID, Guid, guidActivity, Guid, guidTx, "ptr", szProgIdCompensator, "ptr", szDescription, "HRESULT")
        return result
    }

    /**
     * Generated when CRM clerk receives a prepare notification to pass on to the CRM compensator.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmprepare
     */
    OnCRMPrepare(pInfo, guidClerkCLSID) {
        result := ComCall(7, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * Generated when CRM clerk receives a commit notification to pass on to the CRM compensator.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmcommit
     */
    OnCRMCommit(pInfo, guidClerkCLSID) {
        result := ComCall(8, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * Generated when CRM clerk receives an abort notification to pass on to the CRM compensator.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmabort
     */
    OnCRMAbort(pInfo, guidClerkCLSID) {
        result := ComCall(9, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * Generated when CRM clerk receives an in-doubt notification to pass on to the CRM compensator.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmindoubt
     */
    OnCRMIndoubt(pInfo, guidClerkCLSID) {
        result := ComCall(10, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * Generated when CRM clerk is done processing transaction outcome notifications.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmdone
     */
    OnCRMDone(pInfo, guidClerkCLSID) {
        result := ComCall(11, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * Generated when the CRM clerk is finished and releases its resource locks.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmrelease
     */
    OnCRMRelease(pInfo, guidClerkCLSID) {
        result := ComCall(12, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * Generated when a CRM clerk receives a record during the analysis phase of recovery.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @param {Integer} dwCrmRecordType The CRM log record type (internal).
     * @param {Integer} dwRecordSize The log record size (approximate).
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmanalyze
     */
    OnCRMAnalyze(pInfo, guidClerkCLSID, dwCrmRecordType, dwRecordSize) {
        result := ComCall(13, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidClerkCLSID, "uint", dwCrmRecordType, "uint", dwRecordSize, "HRESULT")
        return result
    }

    /**
     * Generated when a CRM clerk receives a request to write a log record, either from the CRM worker or CRM compensator.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @param {BOOL} fVariants Indicates whether the log record is being written as a <b>Variant</b> array.
     * @param {Integer} dwRecordSize The log record size (approximate).
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmwrite
     */
    OnCRMWrite(pInfo, guidClerkCLSID, fVariants, dwRecordSize) {
        result := ComCall(14, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidClerkCLSID, BOOL, fVariants, "uint", dwRecordSize, "HRESULT")
        return result
    }

    /**
     * Generated when a CRM clerk receives a request to forget a log record, either from the CRM worker or from the CRM compensator.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmforget
     */
    OnCRMForget(pInfo, guidClerkCLSID) {
        result := ComCall(15, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * Generated when a CRM clerk receives a request to force log records to disk, either from the CRM worker or from the CRM compensator.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmforce
     */
    OnCRMForce(pInfo, guidClerkCLSID) {
        result := ComCall(16, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * Generated when a CRM clerk delivers a record to a CRM compensator.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @param {BOOL} fVariants Indicates whether the log record is being written as a <b>Variant</b> array.
     * @param {Integer} dwRecordSize The log record size (approximate).
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmdeliver
     */
    OnCRMDeliver(pInfo, guidClerkCLSID, fVariants, dwRecordSize) {
        result := ComCall(17, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidClerkCLSID, BOOL, fVariants, "uint", dwRecordSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComCRMEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnCRMRecoveryStart := CallbackCreate(GetMethod(implObj, "OnCRMRecoveryStart"), flags, 3)
        this.vtbl.OnCRMRecoveryDone := CallbackCreate(GetMethod(implObj, "OnCRMRecoveryDone"), flags, 3)
        this.vtbl.OnCRMCheckpoint := CallbackCreate(GetMethod(implObj, "OnCRMCheckpoint"), flags, 3)
        this.vtbl.OnCRMBegin := CallbackCreate(GetMethod(implObj, "OnCRMBegin"), flags, 7)
        this.vtbl.OnCRMPrepare := CallbackCreate(GetMethod(implObj, "OnCRMPrepare"), flags, 3)
        this.vtbl.OnCRMCommit := CallbackCreate(GetMethod(implObj, "OnCRMCommit"), flags, 3)
        this.vtbl.OnCRMAbort := CallbackCreate(GetMethod(implObj, "OnCRMAbort"), flags, 3)
        this.vtbl.OnCRMIndoubt := CallbackCreate(GetMethod(implObj, "OnCRMIndoubt"), flags, 3)
        this.vtbl.OnCRMDone := CallbackCreate(GetMethod(implObj, "OnCRMDone"), flags, 3)
        this.vtbl.OnCRMRelease := CallbackCreate(GetMethod(implObj, "OnCRMRelease"), flags, 3)
        this.vtbl.OnCRMAnalyze := CallbackCreate(GetMethod(implObj, "OnCRMAnalyze"), flags, 5)
        this.vtbl.OnCRMWrite := CallbackCreate(GetMethod(implObj, "OnCRMWrite"), flags, 5)
        this.vtbl.OnCRMForget := CallbackCreate(GetMethod(implObj, "OnCRMForget"), flags, 3)
        this.vtbl.OnCRMForce := CallbackCreate(GetMethod(implObj, "OnCRMForce"), flags, 3)
        this.vtbl.OnCRMDeliver := CallbackCreate(GetMethod(implObj, "OnCRMDeliver"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnCRMRecoveryStart)
        CallbackFree(this.vtbl.OnCRMRecoveryDone)
        CallbackFree(this.vtbl.OnCRMCheckpoint)
        CallbackFree(this.vtbl.OnCRMBegin)
        CallbackFree(this.vtbl.OnCRMPrepare)
        CallbackFree(this.vtbl.OnCRMCommit)
        CallbackFree(this.vtbl.OnCRMAbort)
        CallbackFree(this.vtbl.OnCRMIndoubt)
        CallbackFree(this.vtbl.OnCRMDone)
        CallbackFree(this.vtbl.OnCRMRelease)
        CallbackFree(this.vtbl.OnCRMAnalyze)
        CallbackFree(this.vtbl.OnCRMWrite)
        CallbackFree(this.vtbl.OnCRMForget)
        CallbackFree(this.vtbl.OnCRMForce)
        CallbackFree(this.vtbl.OnCRMDeliver)
    }
}
