#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Converts the log records to viewable format so that they can be presented using a generic monitoring tool.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icrmformatlogrecords
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICrmFormatLogRecords extends IUnknown{
    /**
     * The interface identifier for ICrmFormatLogRecords
     * @type {Guid}
     */
    static IID => Guid("{9c51d821-c98b-11d1-82fb-00a0c91eede9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} plColumnCount 
     * @returns {HRESULT} 
     */
    GetColumnCount(plColumnCount) {
        result := ComCall(3, this, "int*", plColumnCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pHeaders 
     * @returns {HRESULT} 
     */
    GetColumnHeaders(pHeaders) {
        result := ComCall(4, this, "ptr", pHeaders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {CrmLogRecordRead} CrmLogRec 
     * @param {Pointer<VARIANT>} pFormattedLogRecord 
     * @returns {HRESULT} 
     */
    GetColumn(CrmLogRec, pFormattedLogRecord) {
        result := ComCall(5, this, "ptr", CrmLogRec, "ptr", pFormattedLogRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} LogRecord 
     * @param {Pointer<VARIANT>} pFormattedLogRecord 
     * @returns {HRESULT} 
     */
    GetColumnVariants(LogRecord, pFormattedLogRecord) {
        result := ComCall(6, this, "ptr", LogRecord, "ptr", pFormattedLogRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
