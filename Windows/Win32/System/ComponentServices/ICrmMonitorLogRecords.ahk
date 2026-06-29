#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CrmLogRecordRead.ahk" { CrmLogRecordRead }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CrmTransactionState.ahk" { CrmTransactionState }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Monitors the individual log records maintained by a specific CRM clerk for a given transaction.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icrmmonitorlogrecords
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ICrmMonitorLogRecords extends IUnknown {
    /**
     * The interface identifier for ICrmMonitorLogRecords
     * @type {Guid}
     */
    static IID := Guid("{70c8e441-c7ed-11d1-82fb-00a0c91eede9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICrmMonitorLogRecords interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Count             : IntPtr
        get_TransactionState  : IntPtr
        get_StructuredRecords : IntPtr
        GetLogRecord          : IntPtr
        GetLogRecordVariants  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICrmMonitorLogRecords.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {CrmTransactionState} 
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
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorlogrecords-get_count
     */
    get_Count() {
        result := ComCall(3, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the current state of the transaction.
     * @returns {CrmTransactionState} The current transaction state, represented by an <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-crmtransactionstate">CrmTransactionState</a> enumeration value.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorlogrecords-get_transactionstate
     */
    get_TransactionState() {
        result := ComCall(4, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves a flag indicating whether the log records written by this CRM clerk were structured.
     * @returns {VARIANT_BOOL} Indicates whether the log records are structured.
     * If this method is called before any log records have been written, this parameter is <b>TRUE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorlogrecords-get_structuredrecords
     */
    get_StructuredRecords() {
        result := ComCall(5, this, VARIANT_BOOL.Ptr, &pVal := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorlogrecords-getlogrecord
     */
    GetLogRecord(dwIndex, pCrmLogRec) {
        result := ComCall(6, this, "uint", dwIndex, CrmLogRecordRead.Ptr, pCrmLogRec, "HRESULT")
        return result
    }

    /**
     * Retrieves a structured log record given its numeric index.
     * @param {VARIANT} IndexNumber The index of the required log record.
     * @returns {VARIANT} The log record. See <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-preparerecordvariants">ICrmCompensatorVariants::PrepareRecordVariants</a> for the format.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorlogrecords-getlogrecordvariants
     */
    GetLogRecordVariants(IndexNumber) {
        pLogRecord := VARIANT()
        result := ComCall(7, this, VARIANT, IndexNumber, VARIANT.Ptr, pLogRecord, "HRESULT")
        return pLogRecord
    }

    Query(iid) {
        if (ICrmMonitorLogRecords.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_TransactionState := CallbackCreate(GetMethod(implObj, "get_TransactionState"), flags, 2)
        this.vtbl.get_StructuredRecords := CallbackCreate(GetMethod(implObj, "get_StructuredRecords"), flags, 2)
        this.vtbl.GetLogRecord := CallbackCreate(GetMethod(implObj, "GetLogRecord"), flags, 3)
        this.vtbl.GetLogRecordVariants := CallbackCreate(GetMethod(implObj, "GetLogRecordVariants"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_TransactionState)
        CallbackFree(this.vtbl.get_StructuredRecords)
        CallbackFree(this.vtbl.GetLogRecord)
        CallbackFree(this.vtbl.GetLogRecordVariants)
    }
}
