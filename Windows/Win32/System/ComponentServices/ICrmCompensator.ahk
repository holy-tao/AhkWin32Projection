#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Delivers unstructured log records to the CRM Compensator when using Microsoft Visual C++.
 * @remarks
 * The CRM clerk determines the CLSID of the CRM Compensator using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator">ICrmLogControl::RegisterCompensator</a> method. It next calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> specifying the CLSID of this CRM Compensator, and then it calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for both the <b>ICrmCompensator</b> interface and the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-icrmcompensatorvariants">ICrmCompensatorVariants</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nn-comsvcs-icrmcompensator
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICrmCompensator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICrmCompensator
     * @type {Guid}
     */
    static IID => Guid("{bbc01830-8d3b-11d1-82ec-00a0c91eede9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetLogControl", "BeginPrepare", "PrepareRecord", "EndPrepare", "BeginCommit", "CommitRecord", "EndCommit", "BeginAbort", "AbortRecord", "EndAbort"]

    /**
     * Delivers an ICrmLogControl interface to the CRM Compensator so that it can write further log records during transaction completion.
     * @remarks
     * CRM Compensator errors cause failfast of the server process, unless this has been specifically overridden (through a registry flag) for this particular CRM Compensator CLSID. See <a href="https://docs.microsoft.com/windows/desktop/cossdk/com--crm-registry-settings">COM+ CRM Registry Settings</a> for more information.
     * @param {ICrmLogControl} pLogControl A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-icrmlogcontrol">ICrmLogControl</a> interface of the CRM clerk.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensator-setlogcontrol
     */
    SetLogControl(pLogControl) {
        result := ComCall(3, this, "ptr", pLogControl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the CRM Compensator of the prepare phase of the transaction completion and that records are about to be delivered. (ICrmCompensator.BeginPrepare)
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensator-beginprepare
     */
    BeginPrepare() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Delivers a log record in forward order during the prepare phase.
     * @remarks
     * Unstructured log records are delivered as a <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-crmlogrecordread">CrmLogRecordRead</a> structure. In addition to the user data (as a single BLOB), this structure contains a couple of additional fields that might be useful for debugging or fault-finding if human compensation is necessary. The <b>dwCrmFlags</b> member is a bitfield that provides further information about whether this record was forgotten at some point and when it was written. The <b>dwSequenceNumber</b> member provides the sequence number of the log record. In most cases, sequence numbers are sequential but are not necessarily contiguous due to internal log records that are not delivered to the CRM Compensator.
     * 
     * If no log records are written by the CRM Worker, the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensator-beginprepare">BeginPrepare</a> and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensator-endprepare">EndPrepare</a> methods are received but there are no <b>PrepareRecord</b> method calls. This is to allow for CRM Compensators that write log records at prepare time only.
     * 
     * The CRM Compensator can choose to forget the record that is delivered to it during this phase by setting the forget flag on return from this method.
     * @param {CrmLogRecordRead} crmLogRec The log record, as a <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-crmlogrecordread">CrmLogRecordRead</a> structure.
     * @returns {BOOL} Indicates whether the delivered record should be forgotten.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensator-preparerecord
     */
    PrepareRecord(crmLogRec) {
        result := ComCall(5, this, "ptr", crmLogRec, "int*", &pfForget := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfForget
    }

    /**
     * Notifies the CRM Compensator that it has had all the log records available during the prepare phase. (ICrmCompensator.EndPrepare)
     * @returns {BOOL} Indicates whether the prepare phase succeeded, in which case it is OK to commit this transaction.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensator-endprepare
     */
    EndPrepare() {
        result := ComCall(6, this, "int*", &pfOkToPrepare := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfOkToPrepare
    }

    /**
     * Notifies the CRM Compensator of the commit phase of the transaction completion and that records are about to be delivered.
     * @remarks
     * The commit or abort phases are received by the compensator without a prepare phase during recovery. Also, the abort phase can be received during normal processing without a prepare phase if the client decides to initiate abort.
     * 
     * The CRM Compensator should not depend on any state to be maintained between the prepare and commit/abort phases; the CRM infrastructure is free to release the CRM Compensator between these two phases if it needs to do so. However, state is maintained between the Begin-Record-End calls, and the CRM Compensator always gets the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-icrmlogcontrol">ICrmLogControl</a> interface before delivery of any transaction outcome methods.
     * @param {BOOL} fRecovery Indicates whether this method is being called during recovery (TRUE) or normal processing (FALSE).
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensator-begincommit
     */
    BeginCommit(fRecovery) {
        result := ComCall(7, this, "int", fRecovery, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Delivers a log record in forward order during the commit phase.
     * @remarks
     * This method can be received by the CRM Compensator multiple times, once for each log record that is written. If no log records are written, the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensator-begincommit">BeginCommit</a> and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensator-endcommit">EndCommit</a> methods are received but there are no <b>CommitRecord</b> method calls.
     * 
     * The CRM Compensator can choose to forget the record that was delivered to it during this phase by setting the forget flag on return from this method.
     * @param {CrmLogRecordRead} crmLogRec The log record, as a <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-crmlogrecordread">CrmLogRecordRead</a> structure.
     * @returns {BOOL} Indicates whether the delivered record should be forgotten.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensator-commitrecord
     */
    CommitRecord(crmLogRec) {
        result := ComCall(8, this, "ptr", crmLogRec, "int*", &pfForget := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfForget
    }

    /**
     * Notifies the CRM Compensator that it has delivered all the log records available during the commit phase. (ICrmCompensator.EndCommit)
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensator-endcommit
     */
    EndCommit() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the CRM Compensator of the abort phase of the transaction completion and that records are about to be delivered. (ICrmCompensator.BeginAbort)
     * @remarks
     * The abort phase can be received during normal processing without a prepare phase should the client decide to initiate abort.
     * 
     * The CRM Compensator should not depend on any state to be maintained between the prepare phase and this phase; the CRM infrastructure is free to release the CRM Compensator between these two phases if it needs to do so. However, state is maintained between the Begin-Record-End calls, and the CRM Compensator always gets the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-icrmlogcontrol">ICrmLogControl</a> interface before delivery of any transaction outcome methods.
     * @param {BOOL} fRecovery Indicates whether this method is being called during recovery.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensator-beginabort
     */
    BeginAbort(fRecovery) {
        result := ComCall(10, this, "int", fRecovery, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Delivers a log record to the CRM Compensator during the abort phase. (ICrmCompensator.AbortRecord)
     * @remarks
     * Log records are delivered in the reverse order in which they were written. This method can be received by the CRM Compensator multiple times, once for each log record that was written. If no log records are written, the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensator-beginabort">BeginAbort</a> and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensator-endabort">EndAbort</a> methods are received but there are no <b>AbortRecord</b> method calls.
     * 
     * The CRM Compensator can choose to forget the record that is delivered to it during this phase by setting the forget flag on return from this method.
     * @param {CrmLogRecordRead} crmLogRec The log record, as a <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-crmlogrecordread">CrmLogRecordRead</a> structure.
     * @returns {BOOL} Indicates whether the delivered record should be forgotten.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensator-abortrecord
     */
    AbortRecord(crmLogRec) {
        result := ComCall(11, this, "ptr", crmLogRec, "int*", &pfForget := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfForget
    }

    /**
     * Notifies the CRM Compensator that it has received all the log records available during the abort phase. (ICrmCompensator.EndAbort)
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensator-endabort
     */
    EndAbort() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
