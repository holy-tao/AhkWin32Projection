#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Is the means by which the CRM Worker and CRM Compensator write records to the log and make them durable.
 * @remarks
 * 
 * The CRM Compensator receives this interface after its instantiation using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensator-setlogcontrol">ICrmCompensator::SetLogControl</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-setlogcontrolvariants">ICrmCompensatorVariants::SetLogControlVariants</a> method.
 * 
 * In addition to the return values listed for each method, the methods can also return error codes from the Distributed Transaction Coordinator (DTC) or other standard COM error codes.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icrmlogcontrol
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icrmlogcontrol-get_transactionuow
     */
    get_TransactionUOW() {
        pVal := BSTR()
        result := ComCall(3, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * The CRM Worker uses this method to register the CRM Compensator with the CRM infrastructure.
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
     * This method was called in the wrong state; either before <a href="/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator">RegisterCompensator</a> or when the transaction is completing (CRM Worker).
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
     * The CRM Compensator does not support at least one of the required interfaces (<a href="/windows/desktop/api/comsvcs/nn-comsvcs-icrmcompensator">ICrmCompensator</a> or <a href="/windows/desktop/api/comsvcs/nn-comsvcs-icrmcompensatorvariants">ICrmCompensatorVariants</a>).
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator
     */
    RegisterCompensator(lpcwstrProgIdCompensator, lpcwstrDescription, lCrmRegFlags) {
        lpcwstrProgIdCompensator := lpcwstrProgIdCompensator is String ? StrPtr(lpcwstrProgIdCompensator) : lpcwstrProgIdCompensator
        lpcwstrDescription := lpcwstrDescription is String ? StrPtr(lpcwstrDescription) : lpcwstrDescription

        result := ComCall(4, this, "ptr", lpcwstrProgIdCompensator, "ptr", lpcwstrDescription, "int", lCrmRegFlags, "HRESULT")
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
     * This method was called in the wrong state; either before <a href="/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator">RegisterCompensator</a> or when the transaction is completing (CRM Worker).
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icrmlogcontrol-writelogrecordvariants
     */
    WriteLogRecordVariants(pLogRecord) {
        result := ComCall(5, this, "ptr", pLogRecord, "HRESULT")
        return result
    }

    /**
     * Forces all log records to be durable on disk.
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
     * This method was called in the wrong state; either before <a href="/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator">RegisterCompensator</a> or when the transaction is completing (CRM Worker).
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icrmlogcontrol-forcelog
     */
    ForceLog() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Forgets the last log record written by this instance of the interface.
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
     * This method was called in the wrong state; either before <a href="/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator">RegisterCompensator</a> or when the transaction is completing (CRM Worker).
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icrmlogcontrol-forgetlogrecord
     */
    ForgetLogRecord() {
        result := ComCall(7, this, "HRESULT")
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
     * This method was called in the wrong state; either before <a href="/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator">RegisterCompensator</a> or when the transaction is completing (CRM Worker).
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icrmlogcontrol-forcetransactiontoabort
     */
    ForceTransactionToAbort() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The CRM Worker and CRM Compensator use this method to write unstructured log records to the log.
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
     * This method was called in the wrong state; either before <a href="/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator">RegisterCompensator</a> or when the transaction is completing (CRM Worker).
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icrmlogcontrol-writelogrecord
     */
    WriteLogRecord(rgBlob, cBlob) {
        result := ComCall(9, this, "ptr", rgBlob, "uint", cBlob, "HRESULT")
        return result
    }
}
