#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\FsrmReportFilter.ahk" { FsrmReportFilter }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FsrmReportType.ahk" { FsrmReportType }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Used to configure the description and filters for a single report.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nn-fsrmreports-ifsrmreport
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmReport extends IDispatch {
    /**
     * The interface identifier for IFsrmReport
     * @type {Guid}
     */
    static IID := Guid("{d8cc81d9-46b8-4fa4-bfa5-4aa9dec9b638}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmReport interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Type                        : IntPtr
        get_Name                        : IntPtr
        put_Name                        : IntPtr
        get_Description                 : IntPtr
        put_Description                 : IntPtr
        get_LastGeneratedFileNamePrefix : IntPtr
        GetFilter                       : IntPtr
        SetFilter                       : IntPtr
        Delete                          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmReport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {FsrmReportType} 
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
     * @returns {FsrmReportType} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-get_type
     */
    get_Type() {
        result := ComCall(7, this, "int*", &reportType := 0, "HRESULT")
        return reportType
    }

    /**
     * Retrieves or sets the name of the report. (Get)
     * @remarks
     * If not set, FSRM generates a unique name for you.
     * 
     * The name is used in the report.  If email notification is sent, the subject contains the report name.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-get_name
     */
    get_Name() {
        name := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * Retrieves or sets the name of the report. (Put)
     * @remarks
     * If not set, FSRM generates a unique name for you.
     * 
     * The name is used in the report.  If email notification is sent, the subject contains the report name.
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(9, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the description of the report. (Get)
     * @remarks
     * The description is used in the report.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-get_description
     */
    get_Description() {
        description := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, description, "HRESULT")
        return description
    }

    /**
     * Retrieves or sets the description of the report. (Put)
     * @remarks
     * The description is used in the report.
     * @param {BSTR} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-put_description
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(11, this, BSTR, description, "HRESULT")
        return result
    }

    /**
     * Retrieves the report's generated file name for the last time the report was run.
     * @remarks
     * The file names are generated to identify the collection of files that were generated for a report job the last time the report job ran.
     * 
     * To determine where the reports are stored, access the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_lastgeneratedindirectory">IFsrmReportJob::LastGeneratedInDirectory</a> property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-get_lastgeneratedfilenameprefix
     */
    get_LastGeneratedFileNamePrefix() {
        prefix := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, prefix, "HRESULT")
        return prefix
    }

    /**
     * Retrieves the value of the specified report filter.
     * @param {FsrmReportFilter} filter The filter used to limit the files listed in a report. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportfilter">FsrmReportFilter</a> enumeration.
     * @returns {VARIANT} The filter value for the specified report filter.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-getfilter
     */
    GetFilter(filter) {
        filterValue := VARIANT()
        result := ComCall(13, this, FsrmReportFilter, filter, VARIANT.Ptr, filterValue, "HRESULT")
        return filterValue
    }

    /**
     * Sets the current value of the specified report filter.
     * @remarks
     * The filter value overrides the default value set using the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-setdefaultfilter">IFsrmReportManager::SetDefaultFilter</a> 
     *     method.
     * 
     * Note that each report type supports a specific set of filters. To determine if the filter is valid for the 
     *     report type, call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-isfiltervalidforreporttype">IFsrmReportManager::IsFilterValidForReportType</a> 
     *     method.
     * 
     * The following list lists the variant types associated with the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportfilter">FsrmReportFilter</a> enumeration values used for the 
     *     <i>filter</i> parameter.
     * 
     * <table>
     * <tr>
     * <th>Filter type</th>
     * <th>Variant type</th>
     * </tr>
     * <tr>
     * <td><b>FsrmReportFilter_FileGroups</b></td>
     * <td>
     * <b>VT_BSTR</b> | <b>VT_ARRAY</b>. Set the 
     *        <b>parray</b> member of the variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportFilter_MinAgeDays</b></td>
     * <td>
     * <b>VT_I4</b>. Set the <b>lVal</b> member of the variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportFilter_MaxAgeDays</b></td>
     * <td>
     * <b>VT_I4</b>. Set the <b>lVal</b> member of the variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportFilter_MinQuotaUsage</b></td>
     * <td>
     * <b>VT_I4</b>. Set the <b>lVal</b> member of the variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportFilter_MinSize</b></td>
     * <td>
     * <b>VT_I8</b>. Set the <b>llVal</b> member of the variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportFilter_NamePattern</b></td>
     * <td>
     * <b>VT_BSTR</b>. Set the <b>bstrVal</b> member of the variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportFilter_Owners</b></td>
     * <td>
     * <b>VT_BSTR</b> | <b>VT_ARRAY</b>. Set the 
     *        <b>parray</b> member of the variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportFilter_Property</b></td>
     * <td>
     * <b>VT_BSTR</b>. Set the <b>bstrVal</b> member of the variant.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {FsrmReportFilter} filter The filter used to  limit the files listed in a report. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportfilter">FsrmReportFilter</a> enumeration.
     * @param {VARIANT} filterValue The filter value to use for the specified report filter. The filter value cannot contain the following: 
     *       slash mark (/), backslash (\\), greater than sign (&gt;), less than sign (&lt;), vertical bar (|), double 
     *       quote ("), or colon (:).
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-setfilter
     */
    SetFilter(filter, filterValue) {
        result := ComCall(14, this, FsrmReportFilter, filter, VARIANT, filterValue, "HRESULT")
        return result
    }

    /**
     * Removes this report object from the report job object.
     * @remarks
     * Note that the reports are not deleted until you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmReportJob::Commit</a> method.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-delete
     */
    Delete() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmReport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_LastGeneratedFileNamePrefix := CallbackCreate(GetMethod(implObj, "get_LastGeneratedFileNamePrefix"), flags, 2)
        this.vtbl.GetFilter := CallbackCreate(GetMethod(implObj, "GetFilter"), flags, 3)
        this.vtbl.SetFilter := CallbackCreate(GetMethod(implObj, "SetFilter"), flags, 3)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_LastGeneratedFileNamePrefix)
        CallbackFree(this.vtbl.GetFilter)
        CallbackFree(this.vtbl.SetFilter)
        CallbackFree(this.vtbl.Delete)
    }
}
