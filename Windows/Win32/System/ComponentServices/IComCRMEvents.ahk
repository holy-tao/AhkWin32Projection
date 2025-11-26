#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber about activities of the Compensating Resource Manager (CRM) feature of Component Services.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomcrmevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComCRMEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComCRMEvents
     * @type {Guid}
     */
    static IID => Guid("{683130b5-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCRMRecoveryStart", "OnCRMRecoveryDone", "OnCRMCheckpoint", "OnCRMBegin", "OnCRMPrepare", "OnCRMCommit", "OnCRMAbort", "OnCRMIndoubt", "OnCRMDone", "OnCRMRelease", "OnCRMAnalyze", "OnCRMWrite", "OnCRMForget", "OnCRMForce", "OnCRMDeliver"]

    /**
     * Generated when CRM recovery has started.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The globally unique identifier (GUID) of the application.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomcrmevents-oncrmrecoverystart
     */
    OnCRMRecoveryStart(pInfo, guidApp) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidApp, "HRESULT")
        return result
    }

    /**
     * Generated when CRM recovery is done.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The globally unique identifier (GUID) of the application.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomcrmevents-oncrmrecoverydone
     */
    OnCRMRecoveryDone(pInfo, guidApp) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidApp, "HRESULT")
        return result
    }

    /**
     * Generated when a CRM checkpoint occurs.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The globally unique identifier (GUID) of the application.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomcrmevents-oncrmcheckpoint
     */
    OnCRMCheckpoint(pInfo, guidApp) {
        result := ComCall(5, this, "ptr", pInfo, "ptr", guidApp, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomcrmevents-oncrmbegin
     */
    OnCRMBegin(pInfo, guidClerkCLSID, guidActivity, guidTx, szProgIdCompensator, szDescription) {
        szProgIdCompensator := szProgIdCompensator is String ? StrPtr(szProgIdCompensator) : szProgIdCompensator
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        result := ComCall(6, this, "ptr", pInfo, "ptr", guidClerkCLSID, "ptr", guidActivity, "ptr", guidTx, "ptr", szProgIdCompensator, "ptr", szDescription, "HRESULT")
        return result
    }

    /**
     * Generated when CRM clerk receives a prepare notification to pass on to the CRM compensator.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomcrmevents-oncrmprepare
     */
    OnCRMPrepare(pInfo, guidClerkCLSID) {
        result := ComCall(7, this, "ptr", pInfo, "ptr", guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * Generated when CRM clerk receives a commit notification to pass on to the CRM compensator.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomcrmevents-oncrmcommit
     */
    OnCRMCommit(pInfo, guidClerkCLSID) {
        result := ComCall(8, this, "ptr", pInfo, "ptr", guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * Generated when CRM clerk receives an abort notification to pass on to the CRM compensator.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomcrmevents-oncrmabort
     */
    OnCRMAbort(pInfo, guidClerkCLSID) {
        result := ComCall(9, this, "ptr", pInfo, "ptr", guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * Generated when CRM clerk receives an in-doubt notification to pass on to the CRM compensator.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomcrmevents-oncrmindoubt
     */
    OnCRMIndoubt(pInfo, guidClerkCLSID) {
        result := ComCall(10, this, "ptr", pInfo, "ptr", guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * Generated when CRM clerk is done processing transaction outcome notifications.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomcrmevents-oncrmdone
     */
    OnCRMDone(pInfo, guidClerkCLSID) {
        result := ComCall(11, this, "ptr", pInfo, "ptr", guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * Generated when the CRM clerk is finished and releases its resource locks.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomcrmevents-oncrmrelease
     */
    OnCRMRelease(pInfo, guidClerkCLSID) {
        result := ComCall(12, this, "ptr", pInfo, "ptr", guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * Generated when a CRM clerk receives a record during the analysis phase of recovery.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @param {Integer} dwCrmRecordType The CRM log record type (internal).
     * @param {Integer} dwRecordSize The log record size (approximate).
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomcrmevents-oncrmanalyze
     */
    OnCRMAnalyze(pInfo, guidClerkCLSID, dwCrmRecordType, dwRecordSize) {
        result := ComCall(13, this, "ptr", pInfo, "ptr", guidClerkCLSID, "uint", dwCrmRecordType, "uint", dwRecordSize, "HRESULT")
        return result
    }

    /**
     * Generated when a CRM clerk receives a request to write a log record, either from the CRM worker or CRM compensator.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @param {BOOL} fVariants Indicates whether the log record is being written as a <b>Variant</b> array.
     * @param {Integer} dwRecordSize The log record size (approximate).
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomcrmevents-oncrmwrite
     */
    OnCRMWrite(pInfo, guidClerkCLSID, fVariants, dwRecordSize) {
        result := ComCall(14, this, "ptr", pInfo, "ptr", guidClerkCLSID, "int", fVariants, "uint", dwRecordSize, "HRESULT")
        return result
    }

    /**
     * Generated when a CRM clerk receives a request to forget a log record, either from the CRM worker or from the CRM compensator.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomcrmevents-oncrmforget
     */
    OnCRMForget(pInfo, guidClerkCLSID) {
        result := ComCall(15, this, "ptr", pInfo, "ptr", guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * Generated when a CRM clerk receives a request to force log records to disk, either from the CRM worker or from the CRM compensator.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomcrmevents-oncrmforce
     */
    OnCRMForce(pInfo, guidClerkCLSID) {
        result := ComCall(16, this, "ptr", pInfo, "ptr", guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * Generated when a CRM clerk delivers a record to a CRM compensator.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidClerkCLSID The identifier of the CRM clerk.
     * @param {BOOL} fVariants Indicates whether the log record is being written as a <b>Variant</b> array.
     * @param {Integer} dwRecordSize The log record size (approximate).
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomcrmevents-oncrmdeliver
     */
    OnCRMDeliver(pInfo, guidClerkCLSID, fVariants, dwRecordSize) {
        result := ComCall(17, this, "ptr", pInfo, "ptr", guidClerkCLSID, "int", fVariants, "uint", dwRecordSize, "HRESULT")
        return result
    }
}
