#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Is the means by which the CRM Worker and CRM Compensator write records to the log and make them durable.
 * @remarks
 * The CRM Compensator receives this interface after its instantiation using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensator-setlogcontrol">ICrmCompensator::SetLogControl</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-setlogcontrolvariants">ICrmCompensatorVariants::SetLogControlVariants</a> method.
 * 
 * In addition to the return values listed for each method, the methods can also return error codes from the Distributed Transaction Coordinator (DTC) or other standard COM error codes.
 * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nn-comsvcs-icrmlogcontrol
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICrmLogControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICrmLogControl
     * @type {Guid}
     */
    static IID => Guid("{a0e174b3-d26e-11d2-8f84-00805fc7bcd9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TransactionUOW", "RegisterCompensator", "WriteLogRecordVariants", "ForceLog", "ForgetLogRecord", "ForceTransactionToAbort", "WriteLogRecord"]

    /**
     * @type {BSTR} 
     */
    TransactionUOW {
        get => this.get_TransactionUOW()
    }

    /**
     * Retrieves the transaction unit of work (UOW) without having to log the transaction UOW in the log record.
     * @returns {BSTR} The UOW of the transaction.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmlogcontrol-get_transactionuow
     */
    get_TransactionUOW() {
        pVal := BSTR()
        result := ComCall(3, this, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * The CRM Worker uses this method to register the CRM Compensator with the CRM infrastructure.
     * @remarks
     * The <i>lCrmRegFlags</i> parameter enables the implementer to decide which phases of transaction completion the CRM Compensator wants to receive. Some CRM Compensators might perform no work in the prepare phase and therefore have no need to receive prepare notifications; it can improve performance to specify that no prepare phase is required in this case.
     * 
     * It is recommended that CRM Workers and CRM Compensators be developed as "Both" threaded components (Threading Model = Any Apartment). However, in some cases this might not be possible due to language constraints (for example, when developing CRMs with Visual Basic). Apartment-threaded CRM Compensators (Threading Model = Single Thread Apartment) will deadlock in the prepare phase unless their synchronization property is set to "not supported". Another alternative for Apartment-threaded CRM Compensators is to skip the prepare phase if it is not necessary.
     * 
     * In scenarios with multiple Distributed Transaction Coordinators (DTCs), it is possible that a DTC transaction can go into the in-doubt state. Normally, this is because an interruption occurred during a transaction and the originator of the transaction cannot be contacted to find out the outcome of the transaction. In this case, the CRM infrastructure cannot determine the outcome of the transaction. A CRM implementer can decide whether new transactions should be allowed in this case.
     * 
     * The "fail if in-doubts remain" flag is used as follows: By specifying the "fail if in-doubts remain" flag on <b>RegisterCompensator</b>, if in-doubt transactions remain after recovery, the call to <b>RegisterCompensator</b> fails with a "recovery failed" error code. If the "fail if in-doubts remain" flag is not specified, the recovery succeeds, new transactions are allowed, and the in-doubt transactions remain in the CRM log file. The CRM infrastructure attempts to resolve these in-doubt transactions again on the next recovery (when the application server process is restarted).
     * @param {PWSTR} lpcwstrProgIdCompensator The ProgId of the CRM Compensator. The CLSID of the CRM Compensator in string form is also accepted.
     * @param {PWSTR} lpcwstrDescription The description string to be used by the monitoring interfaces.
     * @param {Integer} lCrmRegFlags Flags from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-crmregflags">CRMREGFLAGS</a> enumeration that control which phases of transaction completion should be received by the CRM Compensator and whether recovery should fail if in-doubt transactions remain after recovery has been attempted.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <b>NULL</b> pointer was provided as an argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XACT_E_NOTRANSACTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The component creating the CRM clerk does not have a transaction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XACT_E_RECOVERYINPROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recovery of the CRM log file is still in progress.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XACT_E_RECOVERY_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recovery of the CRM log file failed because in-doubt transactions remain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XACT_E_WRONGSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method was called in the wrong state; either before <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator">RegisterCompensator</a> or when the transaction is completing (CRM Worker).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An out of memory error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CRM Compensator does not support at least one of the required interfaces (<a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-icrmcompensator">ICrmCompensator</a> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-icrmcompensatorvariants">ICrmCompensatorVariants</a>).
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator
     */
    RegisterCompensator(lpcwstrProgIdCompensator, lpcwstrDescription, lCrmRegFlags) {
        lpcwstrProgIdCompensator := lpcwstrProgIdCompensator is String ? StrPtr(lpcwstrProgIdCompensator) : lpcwstrProgIdCompensator
        lpcwstrDescription := lpcwstrDescription is String ? StrPtr(lpcwstrDescription) : lpcwstrDescription

        result := ComCall(4, this, "ptr", lpcwstrProgIdCompensator, "ptr", lpcwstrDescription, "int", lCrmRegFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The CRM Worker and CRM Compensator use this method to write structured log records to the log.
     * @param {Pointer<VARIANT>} pLogRecord A pointer to a <b>Variant</b> array of <b>Variants</b>. This must be a single-dimension array whose lower bound is zero.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <b>NULL</b> pointer was provided as an argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XACT_E_WRONGSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method was called in the wrong state; either before <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator">RegisterCompensator</a> or when the transaction is completing (CRM Worker).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XACT_E_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transaction has aborted, most likely because of a transaction time-out.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmlogcontrol-writelogrecordvariants
     */
    WriteLogRecordVariants(pLogRecord) {
        result := ComCall(5, this, "ptr", pLogRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Forces all log records to be durable on disk.
     * @remarks
     * The CRM Worker and CRM Compensator use this method to write log records lazily to the log, which means they are not made durable until they have been forced to the log. Calling <b>ForceLog</b> will make all log records that have been written durable on disk.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XACT_E_WRONGSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method was called in the wrong state; either before <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator">RegisterCompensator</a> or when the transaction is completing (CRM Worker).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XACT_E_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transaction has aborted, most likely because of a transaction time-out.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmlogcontrol-forcelog
     */
    ForceLog() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Forgets the last log record written by this instance of the interface.
     * @remarks
     * This method can be used to forget only the last record because there is no concept of nesting; that is, write, forget, write, forget is valid, but write, write, forget, forget is not. A log record that has been forgotten is not delivered to the CRM Compensator during transaction outcome notifications.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no valid log record to forget.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XACT_E_WRONGSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method was called in the wrong state; either before <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator">RegisterCompensator</a> or when the transaction is completing (CRM Worker).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XACT_E_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transaction has aborted, most likely because of a transaction time-out.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmlogcontrol-forgetlogrecord
     */
    ForgetLogRecord() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Performs an immediate abort call on the transaction.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XACT_E_WRONGSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method was called in the wrong state; either before <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator">RegisterCompensator</a> or when the transaction is completing (CRM Worker).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XACT_E_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transaction has aborted, most likely because of a transaction time-out.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmlogcontrol-forcetransactiontoabort
     */
    ForceTransactionToAbort() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The CRM Worker and CRM Compensator use this method to write unstructured log records to the log.
     * @remarks
     * Unstructured records are simply a buffer of bytes. The method implements a gather capability by allowing sections of the specific CRM log record to be built up from an array of BLOBs, which is a structure containing a pointer to the data plus a count of the number of bytes. This reduces the copying of data, leading to only one copy directly from the CRM memory space into the buffer of the log manager.
     * 
     * Unstructured and structured log records cannot be mixed; either <b>WriteLogRecord</b> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-writelogrecordvariants">WriteLogRecordVariants</a> can be called, but not both by the same CRM Worker or CRM Compensator.
     * 
     * You should not include pointer types within datastructures contained in BLOBs in a log record. Object references are no longer valid during recovery phase because the CRM Compensator runs in a different process than that of the CRM Worker that wrote the log record. Including pointer types within BLOBs in a log record can cause an application to crash or corrupt itself during recovery.
     * @param {Pointer<BLOB>} rgBlob An array of BLOBs that form the log record. A BLOB is a Windows data type that is used to store an arbitrary amount of binary data.
     * @param {Integer} cBlob The number of BLOBs in the array.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The count of the number of BLOBs is zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <b>NULL</b> pointer was provided as an argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XACT_E_WRONGSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method was called in the wrong state; either before <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator">RegisterCompensator</a> or when the transaction is completing (CRM Worker).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XACT_E_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transaction has aborted, most likely because of a transaction time-out.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icrmlogcontrol-writelogrecord
     */
    WriteLogRecord(rgBlob, cBlob) {
        result := ComCall(9, this, "ptr", rgBlob, "uint", cBlob, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
