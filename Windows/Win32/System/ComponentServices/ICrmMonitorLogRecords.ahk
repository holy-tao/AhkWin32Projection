#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Monitors the individual log records maintained by a specific CRM clerk for a given transaction.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icrmmonitorlogrecords
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICrmMonitorLogRecords extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICrmMonitorLogRecords
     * @type {Guid}
     */
    static IID => Guid("{70c8e441-c7ed-11d1-82fb-00a0c91eede9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_TransactionState", "get_StructuredRecords", "GetLogRecord", "GetLogRecordVariants"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {Integer} 
     */
    TransactionState {
        get => this.get_TransactionState()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    StructuredRecords {
        get => this.get_StructuredRecords()
    }

    /**
     * Retrieves the number of log records written by this CRM clerk.
     * @returns {Integer} The number of log records written by this CRM clerk.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icrmmonitorlogrecords-get_count
     */
    get_Count() {
        result := ComCall(3, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the current state of the transaction.
     * @returns {Integer} The current transaction state, represented by an <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-crmtransactionstate">CrmTransactionState</a> enumeration value.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icrmmonitorlogrecords-get_transactionstate
     */
    get_TransactionState() {
        result := ComCall(4, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves a flag indicating whether the log records written by this CRM clerk were structured.
     * @returns {VARIANT_BOOL} Indicates whether the log records are structured.
     * If this method is called before any log records have been written, this parameter is <b>TRUE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icrmmonitorlogrecords-get_structuredrecords
     */
    get_StructuredRecords() {
        result := ComCall(5, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves an unstructured log record given its numeric index.
     * @param {Integer} dwIndex The index of the required log record.
     * @param {Pointer<CrmLogRecordRead>} pCrmLogRec The log record, as a <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-crmlogrecordread">CrmLogRecordRead</a> structure.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The index is out of range.
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
     * Attempting to read unstructured records but written records are structured.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XACT_E_TRANSACTIONCLOSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transaction has completed, and the log records have been discarded from the log file. They are no longer available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icrmmonitorlogrecords-getlogrecord
     */
    GetLogRecord(dwIndex, pCrmLogRec) {
        result := ComCall(6, this, "uint", dwIndex, "ptr", pCrmLogRec, "HRESULT")
        return result
    }

    /**
     * Retrieves a structured log record given its numeric index.
     * @param {VARIANT} IndexNumber The index of the required log record.
     * @returns {VARIANT} The log record. See <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-preparerecordvariants">ICrmCompensatorVariants::PrepareRecordVariants</a> for the format.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icrmmonitorlogrecords-getlogrecordvariants
     */
    GetLogRecordVariants(IndexNumber) {
        pLogRecord := VARIANT()
        result := ComCall(7, this, "ptr", IndexNumber, "ptr", pLogRecord, "HRESULT")
        return pLogRecord
    }
}
