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
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_Count(pVal) {
        result := ComCall(3, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_TransactionState(pVal) {
        result := ComCall(4, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_StructuredRecords(pVal) {
        result := ComCall(5, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<CrmLogRecordRead>} pCrmLogRec 
     * @returns {HRESULT} 
     */
    GetLogRecord(dwIndex, pCrmLogRec) {
        result := ComCall(6, this, "uint", dwIndex, "ptr", pCrmLogRec, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} IndexNumber 
     * @param {Pointer<VARIANT>} pLogRecord 
     * @returns {HRESULT} 
     */
    GetLogRecordVariants(IndexNumber, pLogRecord) {
        result := ComCall(7, this, "ptr", IndexNumber, "ptr", pLogRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
