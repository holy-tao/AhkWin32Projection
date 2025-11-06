#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Converts the log records to viewable format so that they can be presented using a generic monitoring tool.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icrmformatlogrecords
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICrmFormatLogRecords extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetColumnCount", "GetColumnHeaders", "GetColumn", "GetColumnVariants"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmformatlogrecords-getcolumncount
     */
    GetColumnCount() {
        result := ComCall(3, this, "int*", &plColumnCount := 0, "HRESULT")
        return plColumnCount
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmformatlogrecords-getcolumnheaders
     */
    GetColumnHeaders() {
        pHeaders := VARIANT()
        result := ComCall(4, this, "ptr", pHeaders, "HRESULT")
        return pHeaders
    }

    /**
     * 
     * @param {CrmLogRecordRead} CrmLogRec 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmformatlogrecords-getcolumn
     */
    GetColumn(CrmLogRec) {
        pFormattedLogRecord := VARIANT()
        result := ComCall(5, this, "ptr", CrmLogRec, "ptr", pFormattedLogRecord, "HRESULT")
        return pFormattedLogRecord
    }

    /**
     * 
     * @param {VARIANT} LogRecord 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmformatlogrecords-getcolumnvariants
     */
    GetColumnVariants(LogRecord) {
        pFormattedLogRecord := VARIANT()
        result := ComCall(6, this, "ptr", LogRecord, "ptr", pFormattedLogRecord, "HRESULT")
        return pFormattedLogRecord
    }
}
