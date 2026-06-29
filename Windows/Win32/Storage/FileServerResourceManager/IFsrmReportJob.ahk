#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IFsrmObject.ahk" { IFsrmObject }
#Import ".\FsrmReportGenerationContext.ahk" { FsrmReportGenerationContext }
#Import ".\FsrmReportRunningStatus.ahk" { FsrmReportRunningStatus }
#Import ".\IFsrmCollection.ahk" { IFsrmCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFsrmReport.ahk" { IFsrmReport }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\FsrmReportType.ahk" { FsrmReportType }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Used to configure a report job.
 * @remarks
 * To <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">commit</a> the job, you must specify at least one 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-createreport">report type</a>, at least one 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_namespaceroots">namespace root</a>, and the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_task">task name</a>.
 * 
 * To <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-run">run</a> the job, you must specify at least one 
 *    <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-createreport">report type</a> and 
 *    <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_namespaceroots">namespace root</a>.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nn-fsrmreports-ifsrmreportjob
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmReportJob extends IFsrmObject {
    /**
     * The interface identifier for IFsrmReportJob
     * @type {Guid}
     */
    static IID := Guid("{38e87280-715c-4c7d-a280-ea1651a19fef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmReportJob interfaces
    */
    struct Vtbl extends IFsrmObject.Vtbl {
        get_Task                     : IntPtr
        put_Task                     : IntPtr
        get_NamespaceRoots           : IntPtr
        put_NamespaceRoots           : IntPtr
        get_Formats                  : IntPtr
        put_Formats                  : IntPtr
        get_MailTo                   : IntPtr
        put_MailTo                   : IntPtr
        get_RunningStatus            : IntPtr
        get_LastRun                  : IntPtr
        get_LastError                : IntPtr
        get_LastGeneratedInDirectory : IntPtr
        EnumReports                  : IntPtr
        CreateReport                 : IntPtr
        Run                          : IntPtr
        WaitForCompletion            : IntPtr
        Cancel                       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmReportJob.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Task {
        get => this.get_Task()
        set => this.put_Task(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    NamespaceRoots {
        get => this.get_NamespaceRoots()
        set => this.put_NamespaceRoots(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    Formats {
        get => this.get_Formats()
        set => this.put_Formats(value)
    }

    /**
     * @type {BSTR} 
     */
    MailTo {
        get => this.get_MailTo()
        set => this.put_MailTo(value)
    }

    /**
     * @type {FsrmReportRunningStatus} 
     */
    RunningStatus {
        get => this.get_RunningStatus()
    }

    /**
     * @type {Float} 
     */
    LastRun {
        get => this.get_LastRun()
    }

    /**
     * @type {BSTR} 
     */
    LastError {
        get => this.get_LastError()
    }

    /**
     * @type {BSTR} 
     */
    LastGeneratedInDirectory {
        get => this.get_LastGeneratedInDirectory()
    }

    /**
     * Retrieves or sets the name of the report job. (Get)
     * @remarks
     * Typically, the name is the same name that you specify when you call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportscheduler-createscheduletask">IFsrmReportScheduler::CreateScheduleTask</a> 
     *     method to create a scheduled task that runs the report job.
     * 
     * Use the task name when calling the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-getreportjob">IFsrmReportManager::GetReportJob</a> method to 
     *     retrieve a report job.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_task
     */
    get_Task() {
        taskName := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, taskName, "HRESULT")
        return taskName
    }

    /**
     * Retrieves or sets the name of the report job. (Put)
     * @remarks
     * Typically, the name is the same name that you specify when you call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportscheduler-createscheduletask">IFsrmReportScheduler::CreateScheduleTask</a> 
     *     method to create a scheduled task that runs the report job.
     * 
     * Use the task name when calling the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-getreportjob">IFsrmReportManager::GetReportJob</a> method to 
     *     retrieve a report job.
     * @param {BSTR} taskName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-put_task
     */
    put_Task(taskName) {
        taskName := taskName is String ? BSTR.Alloc(taskName).Value : taskName

        result := ComCall(13, this, BSTR, taskName, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets an array of local directory paths that will be scanned when the report job is run. (Get)
     * @remarks
     * All subdirectories under the specified path are also scanned (recursively).
     * 
     * If you schedule this job, specify the same namespaces when calling the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportscheduler-createscheduletask">IFsrmReportScheduler::CreateScheduleTask</a> 
     *     method.
     * 
     * This property calls the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportscheduler-verifynamespaces">IFsrmReportScheduler::VerifyNamespaces</a> 
     *     method to validate the paths. For validation details, see the Remarks section of 
     *     <b>VerifyNamespaces</b>.
     * 
     * Note that FSRM supports only NTFS file systems—you cannot specify paths on ReFS, FAT, 
     *     FAT32, UDF, or other non-NTFS file system.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_namespaceroots
     */
    get_NamespaceRoots() {
        result := ComCall(14, this, "ptr*", &namespaceRoots := 0, "HRESULT")
        return namespaceRoots
    }

    /**
     * Retrieves or sets an array of local directory paths that will be scanned when the report job is run. (Put)
     * @remarks
     * All subdirectories under the specified path are also scanned (recursively).
     * 
     * If you schedule this job, specify the same namespaces when calling the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportscheduler-createscheduletask">IFsrmReportScheduler::CreateScheduleTask</a> 
     *     method.
     * 
     * This property calls the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportscheduler-verifynamespaces">IFsrmReportScheduler::VerifyNamespaces</a> 
     *     method to validate the paths. For validation details, see the Remarks section of 
     *     <b>VerifyNamespaces</b>.
     * 
     * Note that FSRM supports only NTFS file systems—you cannot specify paths on ReFS, FAT, 
     *     FAT32, UDF, or other non-NTFS file system.
     * @param {Pointer<SAFEARRAY>} namespaceRoots 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-put_namespaceroots
     */
    put_NamespaceRoots(namespaceRoots) {
        result := ComCall(15, this, SAFEARRAY.Ptr, namespaceRoots, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets an array of formats that determine the content format of the reports. (Get)
     * @remarks
     * Each report in the job is generated in each of the specified formats.
     * 
     * The file name extension is based on the format. The extension for DHTML is 
     *     ".html", the extension for HTML is ".htm", the 
     *     extension for TXT is ".txt", the extension for CSV is 
     *     ".csv", and the extension for XML is 
     *     ".xml".
     * 
     * If the report type is <b>FsrmReportType_ExportReport</b>, you can specify only the 
     *     <b>FsrmReportFormat_Csv</b> and <b>FsrmReportFormat_Xml</b> formats. 
     *     The report is not run if one or both of these formats are not specified. Other formats are ignored.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_formats
     */
    get_Formats() {
        result := ComCall(16, this, "ptr*", &formats := 0, "HRESULT")
        return formats
    }

    /**
     * Retrieves or sets an array of formats that determine the content format of the reports. (Put)
     * @remarks
     * Each report in the job is generated in each of the specified formats.
     * 
     * The file name extension is based on the format. The extension for DHTML is 
     *     ".html", the extension for HTML is ".htm", the 
     *     extension for TXT is ".txt", the extension for CSV is 
     *     ".csv", and the extension for XML is 
     *     ".xml".
     * 
     * If the report type is <b>FsrmReportType_ExportReport</b>, you can specify only the 
     *     <b>FsrmReportFormat_Csv</b> and <b>FsrmReportFormat_Xml</b> formats. 
     *     The report is not run if one or both of these formats are not specified. Other formats are ignored.
     * @param {Pointer<SAFEARRAY>} formats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-put_formats
     */
    put_Formats(formats) {
        result := ComCall(17, this, SAFEARRAY.Ptr, formats, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the email addresses of those that will receive the reports via email. (Get)
     * @remarks
     * This property is optional.
     * 
     * The email message is sent only if the job finishes successfully. Email is not sent for 
     *     <b>FsrmReportType_ExportReport</b> report types. The reports are attached to the email 
     *     message. You can specify [Admin Email] to send notification to the administrator (if the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-get_adminemail">IFsrmSetting::AdminEmail</a> property is set). The 
     *     subject is "&lt;ReportType&gt;: &lt;ReportName&gt;". The body of the email message is empty.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_mailto
     */
    get_MailTo() {
        mailTo := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, mailTo, "HRESULT")
        return mailTo
    }

    /**
     * Retrieves or sets the email addresses of those that will receive the reports via email. (Put)
     * @remarks
     * This property is optional.
     * 
     * The email message is sent only if the job finishes successfully. Email is not sent for 
     *     <b>FsrmReportType_ExportReport</b> report types. The reports are attached to the email 
     *     message. You can specify [Admin Email] to send notification to the administrator (if the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-get_adminemail">IFsrmSetting::AdminEmail</a> property is set). The 
     *     subject is "&lt;ReportType&gt;: &lt;ReportName&gt;". The body of the email message is empty.
     * @param {BSTR} mailTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-put_mailto
     */
    put_MailTo(mailTo) {
        mailTo := mailTo is String ? BSTR.Alloc(mailTo).Value : mailTo

        result := ComCall(19, this, BSTR, mailTo, "HRESULT")
        return result
    }

    /**
     * Retrieves the running status of the report job.
     * @returns {FsrmReportRunningStatus} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_runningstatus
     */
    get_RunningStatus() {
        result := ComCall(20, this, "int*", &runningStatus := 0, "HRESULT")
        return runningStatus
    }

    /**
     * Retrieves the time stamp for when the reports were last run.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_lastrun
     */
    get_LastRun() {
        result := ComCall(21, this, "double*", &lastRun := 0, "HRESULT")
        return lastRun
    }

    /**
     * Retrieves the error message from the last time the reports were run.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_lasterror
     */
    get_LastError() {
        lastError := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, lastError, "HRESULT")
        return lastError
    }

    /**
     * Retrieves the local directory path where the reports were stored the last time the reports were run.
     * @remarks
     * If the reports failed, this is the path where the reports would have been stored. The directory may contain reports that completed successfully before the failure occurred.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_lastgeneratedindirectory
     */
    get_LastGeneratedInDirectory() {
        _path := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, _path, "HRESULT")
        return _path
    }

    /**
     * Enumerates all the reports configured for this report job.
     * @returns {IFsrmCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcollection">IFsrmCollection</a> interface that contains a collection of reports. The collection is empty if no reports are defined for the job.
     * 
     * Each item of the collection is a <b>VARIANT</b> of type <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member to get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nn-fsrmreports-ifsrmreport">IFsrmReport</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-enumreports
     */
    EnumReports() {
        result := ComCall(24, this, "ptr*", &reports := 0, "HRESULT")
        return IFsrmCollection(reports)
    }

    /**
     * Creates a new report object of the specified type.
     * @param {FsrmReportType} reportType Type of report to generate. For possible values, see the<a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreporttype">FsrmReportType</a> enumeration.
     * 
     * Note that the job can contain only one report of each type.
     * @returns {IFsrmReport} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nn-fsrmreports-ifsrmreport">IFsrmReport</a> interface to the newly created report. Use the interface to configure the report.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-createreport
     */
    CreateReport(reportType) {
        result := ComCall(25, this, FsrmReportType, reportType, "ptr*", &report := 0, "HRESULT")
        return IFsrmReport(report)
    }

    /**
     * Runs all the reports in the job.
     * @remarks
     * Note that reports that run in the scheduled context remain in the queue for five minutes before they are run; reports that run in the other contexts remain in the queue for 30 seconds.
     * 
     * If you call this method and the report job is already queued or running, the method returns an error. To determine the status of the job, access the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_runningstatus">IFsrmReportJob::RunningStatus</a> property.
     * @param {FsrmReportGenerationContext} _context Specifies to which subdirectory the reports are written. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportgenerationcontext">FsrmReportGenerationContext</a> enumeration.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-run
     */
    Run(_context) {
        result := ComCall(26, this, FsrmReportGenerationContext, _context, "HRESULT")
        return result
    }

    /**
     * Waits for the reports in the job to complete.
     * @remarks
     * To run the job, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-run">IFsrmReportJob::Run</a> method.
     * 
     * After <b>WaitForCompletion</b> returns, access the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_lasterror">IFsrmReportJob::LastError</a> property to determine if the reports completed successfully.
     * @param {Integer} waitSeconds The number of seconds to wait for the reports to complete. The method returns when the period expires or the reports complete. To wait indefinitely, set the value to –1.
     * @returns {VARIANT_BOOL} Is <b>VARIANT_TRUE</b> if the reports completed; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-waitforcompletion
     */
    WaitForCompletion(waitSeconds) {
        result := ComCall(27, this, "int", waitSeconds, VARIANT_BOOL.Ptr, &completed := 0, "HRESULT")
        return completed
    }

    /**
     * Cancels the running reports for this report job.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-cancel
     */
    Cancel() {
        result := ComCall(28, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmReportJob.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Task := CallbackCreate(GetMethod(implObj, "get_Task"), flags, 2)
        this.vtbl.put_Task := CallbackCreate(GetMethod(implObj, "put_Task"), flags, 2)
        this.vtbl.get_NamespaceRoots := CallbackCreate(GetMethod(implObj, "get_NamespaceRoots"), flags, 2)
        this.vtbl.put_NamespaceRoots := CallbackCreate(GetMethod(implObj, "put_NamespaceRoots"), flags, 2)
        this.vtbl.get_Formats := CallbackCreate(GetMethod(implObj, "get_Formats"), flags, 2)
        this.vtbl.put_Formats := CallbackCreate(GetMethod(implObj, "put_Formats"), flags, 2)
        this.vtbl.get_MailTo := CallbackCreate(GetMethod(implObj, "get_MailTo"), flags, 2)
        this.vtbl.put_MailTo := CallbackCreate(GetMethod(implObj, "put_MailTo"), flags, 2)
        this.vtbl.get_RunningStatus := CallbackCreate(GetMethod(implObj, "get_RunningStatus"), flags, 2)
        this.vtbl.get_LastRun := CallbackCreate(GetMethod(implObj, "get_LastRun"), flags, 2)
        this.vtbl.get_LastError := CallbackCreate(GetMethod(implObj, "get_LastError"), flags, 2)
        this.vtbl.get_LastGeneratedInDirectory := CallbackCreate(GetMethod(implObj, "get_LastGeneratedInDirectory"), flags, 2)
        this.vtbl.EnumReports := CallbackCreate(GetMethod(implObj, "EnumReports"), flags, 2)
        this.vtbl.CreateReport := CallbackCreate(GetMethod(implObj, "CreateReport"), flags, 3)
        this.vtbl.Run := CallbackCreate(GetMethod(implObj, "Run"), flags, 2)
        this.vtbl.WaitForCompletion := CallbackCreate(GetMethod(implObj, "WaitForCompletion"), flags, 3)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Task)
        CallbackFree(this.vtbl.put_Task)
        CallbackFree(this.vtbl.get_NamespaceRoots)
        CallbackFree(this.vtbl.put_NamespaceRoots)
        CallbackFree(this.vtbl.get_Formats)
        CallbackFree(this.vtbl.put_Formats)
        CallbackFree(this.vtbl.get_MailTo)
        CallbackFree(this.vtbl.put_MailTo)
        CallbackFree(this.vtbl.get_RunningStatus)
        CallbackFree(this.vtbl.get_LastRun)
        CallbackFree(this.vtbl.get_LastError)
        CallbackFree(this.vtbl.get_LastGeneratedInDirectory)
        CallbackFree(this.vtbl.EnumReports)
        CallbackFree(this.vtbl.CreateReport)
        CallbackFree(this.vtbl.Run)
        CallbackFree(this.vtbl.WaitForCompletion)
        CallbackFree(this.vtbl.Cancel)
    }
}
