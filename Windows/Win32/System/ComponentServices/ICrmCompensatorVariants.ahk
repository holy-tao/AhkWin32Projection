#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Delivers structured log records to the CRM Compensator when using Microsoft Visual Basic.
 * @remarks
 * The CRM clerk determines the CLSID of the CRM Compensator using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator">ICrmLogControl::RegisterCompensator</a> method. It next calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> specifying the CLSID of this CRM Compensator, and then it calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for both the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-icrmcompensator">ICrmCompensator</a> interface and the <b>ICrmCompensatorVariants</b> interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nn-comsvcs-icrmcompensatorvariants
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICrmCompensatorVariants extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICrmCompensatorVariants
     * @type {Guid}
     */
    static IID => Guid("{f0baf8e4-7804-11d1-82e9-00a0c91eede9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetLogControlVariants", "BeginPrepareVariants", "PrepareRecordVariants", "EndPrepareVariants", "BeginCommitVariants", "CommitRecordVariants", "EndCommitVariants", "BeginAbortVariants", "AbortRecordVariants", "EndAbortVariants"]

    /**
     * Delivers an ICrmLogControl interface to the CRM Compensator.
     * @remarks
     * To write additional log records, use the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-icrmlogcontrol">ICrmLogControl</a> interface.
     * @param {ICrmLogControl} pLogControl A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-icrmlogcontrol">ICrmLogControl</a> interface of the CRM clerk.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensatorvariants-setlogcontrolvariants
     */
    SetLogControlVariants(pLogControl) {
        result := ComCall(3, this, "ptr", pLogControl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the CRM Compensator of the prepare phase of the transaction completion and that records are about to be delivered. (ICrmCompensatorVariants.BeginPrepareVariants)
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensatorvariants-beginpreparevariants
     */
    BeginPrepareVariants() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Delivers a log record to the CRM Compensator during the prepare phase.
     * @remarks
     * This method can be received by the CRM Compensator multiple times, once for each log record that is written.
     * 
     * For the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-icrmcompensatorvariants">ICrmCompensatorVariants</a> interface, log records are delivered in the same way that they were written. The CRM flags and sequence number are appended as the last two elements in the array. (See <b>ICrmCompensator::PrepareRecord</b>.)
     * 
     * If no log records are written by the CRM Worker, the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-beginpreparevariants">BeginPrepareVariants</a> and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-endpreparevariants">EndPrepareVariants</a> methods are received by the CRM Compensator but there are no <b>PrepareRecordVariants</b> method calls. This is to allow for CRM Compensators that write log records at prepare time only.
     * 
     * The CRM Compensator can choose to forget the record that is delivered to it during this phase by setting the forget flag on return from this method.
     * @param {Pointer<VARIANT>} pLogRecord The log record (as a <b>Variant</b> array of <b>Variants</b>).
     * @returns {VARIANT_BOOL} Indicates whether the delivered record should be forgotten.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensatorvariants-preparerecordvariants
     */
    PrepareRecordVariants(pLogRecord) {
        result := ComCall(5, this, "ptr", pLogRecord, "short*", &pbForget := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbForget
    }

    /**
     * Notifies the CRM Compensator that it has had all the log records available during the prepare phase. (ICrmCompensatorVariants.EndPrepareVariants)
     * @returns {VARIANT_BOOL} Indicates whether the prepare phase succeeded, in which case it is OK to commit this transaction.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensatorvariants-endpreparevariants
     */
    EndPrepareVariants() {
        result := ComCall(6, this, "short*", &pbOkToPrepare := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbOkToPrepare
    }

    /**
     * Notifies the CRM Compensator of the commit phase (phase two) of the transaction completion and that records are about to be delivered.
     * @remarks
     * The CRM Compensator should not depend on any state to be maintained between the prepare phase and the commit phase. The CRM infrastructure is free to release the CRM Compensator between these two phases if it needs to do so. However, state is maintained between the Begin-Record-End calls, and the CRM Compensator always gets the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-icrmlogcontrol">ICrmLogControl</a> interface before delivery of any transaction outcome methods.
     * @param {VARIANT_BOOL} bRecovery Indicates whether this method is being called during recovery.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensatorvariants-begincommitvariants
     */
    BeginCommitVariants(bRecovery) {
        result := ComCall(7, this, "short", bRecovery, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Delivers a log record to the CRM Compensator during the commit phase.
     * @remarks
     * This method can be received by the CRM Compensator multiple times, once for each log record that is written. If no log records are written, the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-begincommitvariants">BeginCommitVariants</a> and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-endcommitvariants">EndCommitVariants</a> methods are received but there are no <b>CommitRecordVariants</b> method calls.
     * 
     * The CRM Compensator can choose to forget the record that is delivered to it during this method by setting the forget flag on return from this method.
     * @param {Pointer<VARIANT>} pLogRecord The log record (as a Variant array of Variants).
     * @returns {VARIANT_BOOL} Indicates whether the delivered record should be forgotten.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensatorvariants-commitrecordvariants
     */
    CommitRecordVariants(pLogRecord) {
        result := ComCall(8, this, "ptr", pLogRecord, "short*", &pbForget := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbForget
    }

    /**
     * Notifies the CRM Compensator that it has delivered all the log records available during the commit phase. (ICrmCompensatorVariants.EndCommitVariants)
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensatorvariants-endcommitvariants
     */
    EndCommitVariants() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the CRM Compensator of the abort phase of the transaction completion and that records are about to be delivered. (ICrmCompensatorVariants.BeginAbortVariants)
     * @remarks
     * The CRM Compensator should not depend on any state to be maintained between the prepare phase and the abort phase. The CRM infrastructure is free to release the CRM Compensator between these two phases if it needs to do so. However, state is maintained between the Begin-Record-End calls, and the CRM Compensator always gets the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-icrmlogcontrol">ICrmLogControl</a> interface before delivery of any transaction outcome methods.
     * @param {VARIANT_BOOL} bRecovery Indicates whether this method is being called during recovery.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensatorvariants-beginabortvariants
     */
    BeginAbortVariants(bRecovery) {
        result := ComCall(10, this, "short", bRecovery, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Delivers a log record to the CRM Compensator during the abort phase. (ICrmCompensatorVariants.AbortRecordVariants)
     * @remarks
     * This method may be received by the CRM Compensator multiple times, once for each log record that is written. If no log records are written, the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-beginabortvariants">BeginAbortVariants</a> and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-endabortvariants">EndAbortVariants</a> methods are received but there are no <b>AbortRecordVariants</b> method calls.
     * 
     * The CRM Compensator can choose to forget the record that is delivered to it during this phase by setting the forget flag on return from this method.
     * @param {Pointer<VARIANT>} pLogRecord The log record (as a <b>Variant</b> array of <b>Variants</b>).
     * @returns {VARIANT_BOOL} Indicates whether the delivered record should be forgotten.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensatorvariants-abortrecordvariants
     */
    AbortRecordVariants(pLogRecord) {
        result := ComCall(11, this, "ptr", pLogRecord, "short*", &pbForget := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbForget
    }

    /**
     * Notifies the CRM Compensator that it has received all the log records available during the abort phase. (ICrmCompensatorVariants.EndAbortVariants)
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmcompensatorvariants-endabortvariants
     */
    EndAbortVariants() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
