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
     * Retrieves the number of fields (columns) in a log record of the type used by this CRM Compensator.
     * @returns {Integer} The number of fields (columns) in the log record.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icrmformatlogrecords-getcolumncount
     */
    GetColumnCount() {
        result := ComCall(3, this, "int*", &plColumnCount := 0, "HRESULT")
        return plColumnCount
    }

    /**
     * Retrieves the names of the fields (columns) so that they can be used as column headings when the information is presented.
     * @returns {VARIANT} A <b>Variant</b> array containing the field names as <b>Variant</b> strings.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icrmformatlogrecords-getcolumnheaders
     */
    GetColumnHeaders() {
        pHeaders := VARIANT()
        result := ComCall(4, this, "ptr", pHeaders, "HRESULT")
        return pHeaders
    }

    /**
     * Formats one unstructured log record into an array of viewable fields.
     * @param {CrmLogRecordRead} CrmLogRec The unstructured log record to be formatted, as a <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-crmlogrecordread">CrmLogRecordRead</a> structure.
     * @returns {VARIANT} The formatted log record, as a <b>Variant</b> array of the fields in this log record as <b>Variant</b> strings.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icrmformatlogrecords-getcolumn
     */
    GetColumn(CrmLogRec) {
        pFormattedLogRecord := VARIANT()
        result := ComCall(5, this, "ptr", CrmLogRec, "ptr", pFormattedLogRecord, "HRESULT")
        return pFormattedLogRecord
    }

    /**
     * Formats one structured log record into an array of viewable fields.
     * @param {VARIANT} LogRecord The structured log record to be formatted.
     * @returns {VARIANT} A <b>Variant</b> array of the fields in this log record as <b>Variant</b> strings.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icrmformatlogrecords-getcolumnvariants
     */
    GetColumnVariants(LogRecord) {
        pFormattedLogRecord := VARIANT()
        result := ComCall(6, this, "ptr", LogRecord, "ptr", pFormattedLogRecord, "HRESULT")
        return pFormattedLogRecord
    }
}
