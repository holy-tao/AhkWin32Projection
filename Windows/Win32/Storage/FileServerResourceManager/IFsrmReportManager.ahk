#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\FsrmReportGenerationContext.ahk" { FsrmReportGenerationContext }
#Import ".\FsrmReportFilter.ahk" { FsrmReportFilter }
#Import ".\IFsrmCollection.ahk" { IFsrmCollection }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\FsrmReportType.ahk" { FsrmReportType }
#Import ".\FsrmReportLimit.ahk" { FsrmReportLimit }
#Import ".\FsrmEnumOptions.ahk" { FsrmEnumOptions }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IFsrmReportJob.ahk" { IFsrmReportJob }

/**
 * Used to manage report jobs.
 * @remarks
 * A storage report job specifies a set of directories that will be analyzed to generate one or more different 
 *     report types that help administrators to better understand how storage is utilized in the specified directories. 
 *     You can configure report jobs to execute according to a schedule or on demand.
 * 
 * To create this object from a script, use the "Fsrm.FsrmReportManager" program 
 *     identifier.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nn-fsrmreports-ifsrmreportmanager
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmReportManager extends IDispatch {
    /**
     * The interface identifier for IFsrmReportManager
     * @type {Guid}
     */
    static IID := Guid("{27b899fe-6ffa-4481-a184-d3daade8a02b}")

    /**
     * The class identifier for FsrmReportManager
     * @type {Guid}
     */
    static CLSID := Guid("{0058ef37-aa66-4c48-bd5b-2fce432ab0c8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmReportManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        EnumReportJobs             : IntPtr
        CreateReportJob            : IntPtr
        GetReportJob               : IntPtr
        GetOutputDirectory         : IntPtr
        SetOutputDirectory         : IntPtr
        IsFilterValidForReportType : IntPtr
        GetDefaultFilter           : IntPtr
        SetDefaultFilter           : IntPtr
        GetReportSizeLimit         : IntPtr
        SetReportSizeLimit         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmReportManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enumerates the report jobs.
     * @param {FsrmEnumOptions} options The options to use when enumerating the report jobs. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * 
     * <div class="alert"><b>Note</b>  The <b>FsrmEnumOptions_Asynchronous</b> option is not supported for this 
     *        method.</div>
     * <div> </div>
     * @returns {IFsrmCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcollection">IFsrmCollection</a> interface that contains a 
     *       collection of the report jobs. The collection is empty if no report jobs.
     * 
     * Each item of the collection is a <b>VARIANT</b> of type 
     *        <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member to get the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nn-fsrmreports-ifsrmreportjob">IFsrmReportJob</a> interface.
     * 
     * The collection can contain committed and uncommitted report jobs. For an uncommitted report job to be 
     *        included in the collection, the running status of the job must be 
     *        <b>FsrmReportRunningStatus_Queued</b> or 
     *        <b>FsrmReportRunningStatus_Running</b>.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-enumreportjobs
     */
    EnumReportJobs(options) {
        result := ComCall(7, this, FsrmEnumOptions, options, "ptr*", &reportJobs := 0, "HRESULT")
        return IFsrmCollection(reportJobs)
    }

    /**
     * Creates a report job.
     * @returns {IFsrmReportJob} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nn-fsrmreports-ifsrmreportjob">IFsrmReportJob</a> interface of the newly created 
     *       report job object. Use the interface to add reports to the job and run the reports. To add the report job to 
     *       FSRM, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmReportJob::Commit</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-createreportjob
     */
    CreateReportJob() {
        result := ComCall(8, this, "ptr*", &reportJob := 0, "HRESULT")
        return IFsrmReportJob(reportJob)
    }

    /**
     * Retrieves the specified report job.
     * @param {BSTR} taskName The task name that identifies the report job to retrieve. The string is limited to 230 characters.
     * @returns {IFsrmReportJob} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nn-fsrmreports-ifsrmreportjob">IFsrmReportJob</a> interface to the retrieved job.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-getreportjob
     */
    GetReportJob(taskName) {
        taskName := taskName is String ? BSTR.Alloc(taskName).Value : taskName

        result := ComCall(9, this, BSTR, taskName, "ptr*", &reportJob := 0, "HRESULT")
        return IFsrmReportJob(reportJob)
    }

    /**
     * Retrieves the local directory path where the reports with the specified context are stored.
     * @param {FsrmReportGenerationContext} _context The report context (for example, if the report is scheduled or run on demand). For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportgenerationcontext">FsrmReportGenerationContext</a> enumeration.
     * @returns {BSTR} The local directory path where the reports are stored.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-getoutputdirectory
     */
    GetOutputDirectory(_context) {
        _path := BSTR.Owned()
        result := ComCall(10, this, FsrmReportGenerationContext, _context, BSTR.Ptr, _path, "HRESULT")
        return _path
    }

    /**
     * Sets the local directory path where reports are stored.
     * @remarks
     * The reports are stored in the following folders under the given path.
     * 
     * <table>
     * <tr>
     * <th>Context</th>
     * <th>Folder</th>
     * </tr>
     * <tr>
     * <td><b>FsrmReportGenerationContext_ScheduledReport</b></td>
     * <td>Scheduled</td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportGenerationContext_InteractiveReport</b></td>
     * <td>Interactive</td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportGenerationContext_IncidentReport</b></td>
     * <td>Incident</td>
     * </tr>
     * </table>
     *  
     * 
     * For example, if <i>path</i> is set to "C:\StorageReports" and 
     *     <i>context</i> is set to 
     *     <b>FsrmReportGenerationContext_ScheduledReport</b>, the path for the scheduled reports would 
     *     be "C:\StorageReports\Scheduled".
     * 
     * The default output directories are:
     * 
     * <ul>
     * <li>"%systemdrive%\StorageReports\Scheduled"</li>
     * <li>"%systemdrive%\StorageReports\Incident"</li>
     * <li>"%systemdrive%\StorageReports\Interactive"</li>
     * </ul>
     * @param {FsrmReportGenerationContext} _context The report context (for example, if the report is scheduled or runs on demand). For possible values, see 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportgenerationcontext">FsrmReportGenerationContext</a> 
     *       enumeration.
     * @param {BSTR} _path The full path to the local directory where the reports are stored. The path can contain environment 
     *       variables. The path is limited to 150 characters.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-setoutputdirectory
     */
    SetOutputDirectory(_context, _path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(11, this, FsrmReportGenerationContext, _context, BSTR, _path, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that determines whether a specified report filter is configurable for the specified report type.
     * @param {FsrmReportType} reportType Report type. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreporttype">FsrmReportType</a> enumeration.
     * @param {FsrmReportFilter} filter Report filter. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportfilter">FsrmReportFilter</a> enumeration.
     * @returns {VARIANT_BOOL} Is <b>VARIANT_TRUE</b> if the filter is configurable for the report type, otherwise it is <b>VARIANT_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-isfiltervalidforreporttype
     */
    IsFilterValidForReportType(reportType, filter) {
        result := ComCall(12, this, FsrmReportType, reportType, FsrmReportFilter, filter, VARIANT_BOOL.Ptr, &valid := 0, "HRESULT")
        return valid
    }

    /**
     * Retrieves the default report filter value that is used with the specified report type.
     * @remarks
     * This value is used if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreport-setfilter">IFsrmReport::SetFilter</a> method was not called to specify a filter value for the report.
     * @param {FsrmReportType} reportType Report type. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreporttype">FsrmReportType</a> enumeration.
     * @param {FsrmReportFilter} filter Report filter. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportfilter">FsrmReportFilter</a> enumeration.
     * @returns {VARIANT} The default report filter value.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-getdefaultfilter
     */
    GetDefaultFilter(reportType, filter) {
        filterValue := VARIANT()
        result := ComCall(13, this, FsrmReportType, reportType, FsrmReportFilter, filter, VARIANT.Ptr, filterValue, "HRESULT")
        return filterValue
    }

    /**
     * Sets the default report filter value to use with the specified report type.
     * @remarks
     * This value is used if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreport-setfilter">IFsrmReport::SetFilter</a> method was not called to specify a filter value for the report.
     * 
     * Note that each report type supports a specific set of filters. To determine if the filter is valid, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-isfiltervalidforreporttype">IFsrmReportManager::IsFilterValidForReportType</a> method.
     * 
     * The following list lists the variant types associated with the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportfilter">FsrmReportFilter</a> enumeration values used for the <i>filterValue</i> parameter.
     * 
     * <table>
     * <tr>
     * <th>Filter type</th>
     * <th>Variant type</th>
     * </tr>
     * <tr>
     * <td><b>FsrmReportFilter_FileGroups</b></td>
     * <td>
     * <b>VT_BSTR</b> | <b>VT_ARRAY</b>. Set the <b>parray</b> member of the variant.
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
     * <b>VT_BSTR</b> | <b>VT_ARRAY</b>. Set the <b>parray</b> member of the variant.
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
     *  
     * 
     * The default filter values are used for report actions.
     * @param {FsrmReportType} reportType The report type. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreporttype">FsrmReportType</a> enumeration.
     * @param {FsrmReportFilter} filter The report filter. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportfilter">FsrmReportFilter</a> enumeration.
     * @param {VARIANT} filterValue The default report filter value.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-setdefaultfilter
     */
    SetDefaultFilter(reportType, filter, filterValue) {
        result := ComCall(14, this, FsrmReportType, reportType, FsrmReportFilter, filter, VARIANT, filterValue, "HRESULT")
        return result
    }

    /**
     * Retrieves the current value of the specified report size limit.
     * @param {FsrmReportLimit} limit The report size limit which is used to limit the files listed in a report. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportlimit">FsrmReportLimit</a> enumeration.
     * @returns {VARIANT} The limit. The variant type is <b>VT_I4</b>. Use the <b>lVal</b> member of the variant to access the limit value.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-getreportsizelimit
     */
    GetReportSizeLimit(limit) {
        limitValue := VARIANT()
        result := ComCall(15, this, FsrmReportLimit, limit, VARIANT.Ptr, limitValue, "HRESULT")
        return limitValue
    }

    /**
     * Sets the current value of the specified report size limit.
     * @remarks
     * The following list lists the default limits for the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportlimit">FsrmReportLimit</a> enumeration values used for 
     *      the <i>limit</i> parameter.
     * 
     * <table>
     * <tr>
     * <th>Limit</th>
     * <th>Default value</th>
     * </tr>
     * <tr>
     * <td><b>FsrmReportLimit_MaxDuplicateGroups</b></td>
     * <td>100 duplicate groups</td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportLimit_MaxFiles</b></td>
     * <td>1,000 files</td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportLimit_MaxFileGroups</b></td>
     * <td>10 groups</td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportLimit_MaxFileScreenEvents</b></td>
     * <td>1,000 file screen events</td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportLimit_MaxFilesPerDuplGroup</b></td>
     * <td>10 files per duplicate group</td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportLimit_MaxFilesPerFileGroup</b></td>
     * <td>100 files per group</td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportLimit_MaxFilesPerOwner</b></td>
     * <td>100 files per owner</td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportLimit_MaxFilesPerPropertyValue</b></td>
     * <td>100 files per property</td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportLimit_MaxOwners</b></td>
     * <td>10 owners</td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportLimit_MaxPropertyValues</b></td>
     * <td>10 properties</td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportLimit_MaxQuotas</b></td>
     * <td>1,000 quotas</td>
     * </tr>
     * <tr>
     * <td><b>FsrmReportLimit_MaxFolders</b></td>
     * <td>1,000 folders</td>
     * </tr>
     * </table>
     * @param {FsrmReportLimit} limit Identifies the limit which is used to limit the files listed in a report. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportlimit">FsrmReportLimit</a> enumeration.
     * @param {VARIANT} limitValue The limit. Must be greater than zero. You can specify the variant as a short, int, or long that is either 
     *       signed or unsigned. The method will also accept a string value. The method must be able to convert the value to 
     *       a positive, long number. For example, to pass the value as a long, set the variant type to 
     *       <b>VT_I4</b> and then set the <b>lVal</b> member of the variant to the 
     *       limit value.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-setreportsizelimit
     */
    SetReportSizeLimit(limit, limitValue) {
        result := ComCall(16, this, FsrmReportLimit, limit, VARIANT, limitValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmReportManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumReportJobs := CallbackCreate(GetMethod(implObj, "EnumReportJobs"), flags, 3)
        this.vtbl.CreateReportJob := CallbackCreate(GetMethod(implObj, "CreateReportJob"), flags, 2)
        this.vtbl.GetReportJob := CallbackCreate(GetMethod(implObj, "GetReportJob"), flags, 3)
        this.vtbl.GetOutputDirectory := CallbackCreate(GetMethod(implObj, "GetOutputDirectory"), flags, 3)
        this.vtbl.SetOutputDirectory := CallbackCreate(GetMethod(implObj, "SetOutputDirectory"), flags, 3)
        this.vtbl.IsFilterValidForReportType := CallbackCreate(GetMethod(implObj, "IsFilterValidForReportType"), flags, 4)
        this.vtbl.GetDefaultFilter := CallbackCreate(GetMethod(implObj, "GetDefaultFilter"), flags, 4)
        this.vtbl.SetDefaultFilter := CallbackCreate(GetMethod(implObj, "SetDefaultFilter"), flags, 4)
        this.vtbl.GetReportSizeLimit := CallbackCreate(GetMethod(implObj, "GetReportSizeLimit"), flags, 3)
        this.vtbl.SetReportSizeLimit := CallbackCreate(GetMethod(implObj, "SetReportSizeLimit"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumReportJobs)
        CallbackFree(this.vtbl.CreateReportJob)
        CallbackFree(this.vtbl.GetReportJob)
        CallbackFree(this.vtbl.GetOutputDirectory)
        CallbackFree(this.vtbl.SetOutputDirectory)
        CallbackFree(this.vtbl.IsFilterValidForReportType)
        CallbackFree(this.vtbl.GetDefaultFilter)
        CallbackFree(this.vtbl.SetDefaultFilter)
        CallbackFree(this.vtbl.GetReportSizeLimit)
        CallbackFree(this.vtbl.SetReportSizeLimit)
    }
}
