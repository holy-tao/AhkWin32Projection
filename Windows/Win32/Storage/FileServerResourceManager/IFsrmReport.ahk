#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to configure the description and filters for a single report.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nn-fsrmreports-ifsrmreport
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmReport extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmReport
     * @type {Guid}
     */
    static IID => Guid("{d8cc81d9-46b8-4fa4-bfa5-4aa9dec9b638}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_Name", "put_Name", "get_Description", "put_Description", "get_LastGeneratedFileNamePrefix", "GetFilter", "SetFilter", "Delete"]

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BSTR} 
     */
    LastGeneratedFileNamePrefix {
        get => this.get_LastGeneratedFileNamePrefix()
    }

    /**
     * Retrieves the type of report to generate.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreport-get_type
     */
    get_Type() {
        result := ComCall(7, this, "int*", &reportType := 0, "HRESULT")
        return reportType
    }

    /**
     * Retrieves or sets the name of the report.
     * @remarks
     * 
     * If not set, FSRM generates a unique name for you.
     * 
     * The name is used in the report.  If email notification is sent, the subject contains the report name.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreport-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(8, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * Retrieves or sets the name of the report.
     * @remarks
     * 
     * If not set, FSRM generates a unique name for you.
     * 
     * The name is used in the report.  If email notification is sent, the subject contains the report name.
     * 
     * 
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreport-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(9, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the description of the report.
     * @remarks
     * 
     * The description is used in the report.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreport-get_description
     */
    get_Description() {
        description := BSTR()
        result := ComCall(10, this, "ptr", description, "HRESULT")
        return description
    }

    /**
     * Retrieves or sets the description of the report.
     * @remarks
     * 
     * The description is used in the report.
     * 
     * 
     * 
     * @param {BSTR} description 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreport-put_description
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(11, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * Retrieves the report's generated file name for the last time the report was run.
     * @remarks
     * 
     * The file names are generated to identify the collection of files that were generated for a report job the last time the report job ran.
     * 
     * To determine where the reports are stored, access the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_lastgeneratedindirectory">IFsrmReportJob::LastGeneratedInDirectory</a> property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreport-get_lastgeneratedfilenameprefix
     */
    get_LastGeneratedFileNamePrefix() {
        prefix := BSTR()
        result := ComCall(12, this, "ptr", prefix, "HRESULT")
        return prefix
    }

    /**
     * Retrieves the value of the specified report filter.
     * @param {Integer} filter The filter used to limit the files listed in a report. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportfilter">FsrmReportFilter</a> enumeration.
     * @returns {VARIANT} The filter value for the specified report filter.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreport-getfilter
     */
    GetFilter(filter) {
        filterValue := VARIANT()
        result := ComCall(13, this, "int", filter, "ptr", filterValue, "HRESULT")
        return filterValue
    }

    /**
     * Sets the current value of the specified report filter.
     * @param {Integer} filter The filter used to  limit the files listed in a report. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportfilter">FsrmReportFilter</a> enumeration.
     * @param {VARIANT} filterValue The filter value to use for the specified report filter. The filter value cannot contain the following: 
     *       slash mark (/), backslash (\\), greater than sign (&gt;), less than sign (&lt;), vertical bar (|), double 
     *       quote ("), or colon (:).
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreport-setfilter
     */
    SetFilter(filter, filterValue) {
        result := ComCall(14, this, "int", filter, "ptr", filterValue, "HRESULT")
        return result
    }

    /**
     * Removes this report object from the report job object.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreport-delete
     */
    Delete() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
