#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CrmLogRecordRead.ahk" { CrmLogRecordRead }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Converts the log records to viewable format so that they can be presented using a generic monitoring tool.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icrmformatlogrecords
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ICrmFormatLogRecords extends IUnknown {
    /**
     * The interface identifier for ICrmFormatLogRecords
     * @type {Guid}
     */
    static IID := Guid("{9c51d821-c98b-11d1-82fb-00a0c91eede9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICrmFormatLogRecords interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetColumnCount    : IntPtr
        GetColumnHeaders  : IntPtr
        GetColumn         : IntPtr
        GetColumnVariants : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICrmFormatLogRecords.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the number of fields (columns) in a log record of the type used by this CRM Compensator.
     * @returns {Integer} The number of fields (columns) in the log record.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmformatlogrecords-getcolumncount
     */
    GetColumnCount() {
        result := ComCall(3, this, "int*", &plColumnCount := 0, "HRESULT")
        return plColumnCount
    }

    /**
     * Retrieves the names of the fields (columns) so that they can be used as column headings when the information is presented.
     * @returns {VARIANT} A <b>Variant</b> array containing the field names as <b>Variant</b> strings.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmformatlogrecords-getcolumnheaders
     */
    GetColumnHeaders() {
        pHeaders := VARIANT()
        result := ComCall(4, this, VARIANT.Ptr, pHeaders, "HRESULT")
        return pHeaders
    }

    /**
     * Formats one unstructured log record into an array of viewable fields.
     * @param {CrmLogRecordRead} CrmLogRec The unstructured log record to be formatted, as a <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-crmlogrecordread">CrmLogRecordRead</a> structure.
     * @returns {VARIANT} The formatted log record, as a <b>Variant</b> array of the fields in this log record as <b>Variant</b> strings.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmformatlogrecords-getcolumn
     */
    GetColumn(CrmLogRec) {
        pFormattedLogRecord := VARIANT()
        result := ComCall(5, this, CrmLogRecordRead, CrmLogRec, VARIANT.Ptr, pFormattedLogRecord, "HRESULT")
        return pFormattedLogRecord
    }

    /**
     * Formats one structured log record into an array of viewable fields.
     * @param {VARIANT} LogRecord The structured log record to be formatted.
     * @returns {VARIANT} A <b>Variant</b> array of the fields in this log record as <b>Variant</b> strings.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmformatlogrecords-getcolumnvariants
     */
    GetColumnVariants(LogRecord) {
        pFormattedLogRecord := VARIANT()
        result := ComCall(6, this, VARIANT, LogRecord, VARIANT.Ptr, pFormattedLogRecord, "HRESULT")
        return pFormattedLogRecord
    }

    Query(iid) {
        if (ICrmFormatLogRecords.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetColumnCount := CallbackCreate(GetMethod(implObj, "GetColumnCount"), flags, 2)
        this.vtbl.GetColumnHeaders := CallbackCreate(GetMethod(implObj, "GetColumnHeaders"), flags, 2)
        this.vtbl.GetColumn := CallbackCreate(GetMethod(implObj, "GetColumn"), flags, 3)
        this.vtbl.GetColumnVariants := CallbackCreate(GetMethod(implObj, "GetColumnVariants"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetColumnCount)
        CallbackFree(this.vtbl.GetColumnHeaders)
        CallbackFree(this.vtbl.GetColumn)
        CallbackFree(this.vtbl.GetColumnVariants)
    }
}
