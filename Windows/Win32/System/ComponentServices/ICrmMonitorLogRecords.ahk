#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorlogrecords-get_count
     */
    get_Count(pVal) {
        result := ComCall(3, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorlogrecords-get_transactionstate
     */
    get_TransactionState(pVal) {
        result := ComCall(4, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorlogrecords-get_structuredrecords
     */
    get_StructuredRecords(pVal) {
        result := ComCall(5, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<CrmLogRecordRead>} pCrmLogRec 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorlogrecords-getlogrecord
     */
    GetLogRecord(dwIndex, pCrmLogRec) {
        result := ComCall(6, this, "uint", dwIndex, "ptr", pCrmLogRec, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} IndexNumber 
     * @param {Pointer<VARIANT>} pLogRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorlogrecords-getlogrecordvariants
     */
    GetLogRecordVariants(IndexNumber, pLogRecord) {
        result := ComCall(7, this, "ptr", IndexNumber, "ptr", pLogRecord, "HRESULT")
        return result
    }
}
