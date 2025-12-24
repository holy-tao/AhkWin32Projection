#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmCollection.ahk
#Include .\IFsrmReport.ahk
#Include .\IFsrmObject.ahk

/**
 * Used to configure a report job.
 * @remarks
 * 
 * To <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">commit</a> the job, you must specify at least one 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-createreport">report type</a>, at least one 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_namespaceroots">namespace root</a>, and the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_task">task name</a>.
 * 
 * To <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-run">run</a> the job, you must specify at least one 
 *    <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-createreport">report type</a> and 
 *    <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_namespaceroots">namespace root</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nn-fsrmreports-ifsrmreportjob
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmReportJob extends IFsrmObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmReportJob
     * @type {Guid}
     */
    static IID => Guid("{38e87280-715c-4c7d-a280-ea1651a19fef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Task", "put_Task", "get_NamespaceRoots", "put_NamespaceRoots", "get_Formats", "put_Formats", "get_MailTo", "put_MailTo", "get_RunningStatus", "get_LastRun", "get_LastError", "get_LastGeneratedInDirectory", "EnumReports", "CreateReport", "Run", "WaitForCompletion", "Cancel"]

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
     * @type {Integer} 
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
     * Retrieves or sets the name of the report job.
     * @remarks
     * 
     * Typically, the name is the same name that you specify when you call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportscheduler-createscheduletask">IFsrmReportScheduler::CreateScheduleTask</a> 
     *     method to create a scheduled task that runs the report job.
     * 
     * Use the task name when calling the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-getreportjob">IFsrmReportManager::GetReportJob</a> method to 
     *     retrieve a report job.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportjob-get_task
     */
    get_Task() {
        taskName := BSTR()
        result := ComCall(12, this, "ptr", taskName, "HRESULT")
        return taskName
    }

    /**
     * Retrieves or sets the name of the report job.
     * @remarks
     * 
     * Typically, the name is the same name that you specify when you call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportscheduler-createscheduletask">IFsrmReportScheduler::CreateScheduleTask</a> 
     *     method to create a scheduled task that runs the report job.
     * 
     * Use the task name when calling the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-getreportjob">IFsrmReportManager::GetReportJob</a> method to 
     *     retrieve a report job.
     * 
     * 
     * 
     * @param {BSTR} taskName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportjob-put_task
     */
    put_Task(taskName) {
        taskName := taskName is String ? BSTR.Alloc(taskName).Value : taskName

        result := ComCall(13, this, "ptr", taskName, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets an array of local directory paths that will be scanned when the report job is run.
     * @remarks
     * 
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
     * 
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportjob-get_namespaceroots
     */
    get_NamespaceRoots() {
        result := ComCall(14, this, "ptr*", &namespaceRoots := 0, "HRESULT")
        return namespaceRoots
    }

    /**
     * Retrieves or sets an array of local directory paths that will be scanned when the report job is run.
     * @remarks
     * 
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
     * 
     * 
     * 
     * @param {Pointer<SAFEARRAY>} namespaceRoots 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportjob-put_namespaceroots
     */
    put_NamespaceRoots(namespaceRoots) {
        result := ComCall(15, this, "ptr", namespaceRoots, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets an array of formats that determine the content format of the reports.
     * @remarks
     * 
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
     * 
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportjob-get_formats
     */
    get_Formats() {
        result := ComCall(16, this, "ptr*", &formats := 0, "HRESULT")
        return formats
    }

    /**
     * Retrieves or sets an array of formats that determine the content format of the reports.
     * @remarks
     * 
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
     * 
     * 
     * 
     * @param {Pointer<SAFEARRAY>} formats 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportjob-put_formats
     */
    put_Formats(formats) {
        result := ComCall(17, this, "ptr", formats, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the email addresses of those that will receive the reports via email.
     * @remarks
     * 
     * This property is optional.
     * 
     * The email message is sent only if the job finishes successfully. Email is not sent for 
     *     <b>FsrmReportType_ExportReport</b> report types. The reports are attached to the email 
     *     message. You can specify [Admin Email] to send notification to the administrator (if the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-get_adminemail">IFsrmSetting::AdminEmail</a> property is set). The 
     *     subject is "&lt;ReportType&gt;: &lt;ReportName&gt;". The body of the email message is empty.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportjob-get_mailto
     */
    get_MailTo() {
        mailTo := BSTR()
        result := ComCall(18, this, "ptr", mailTo, "HRESULT")
        return mailTo
    }

    /**
     * Retrieves or sets the email addresses of those that will receive the reports via email.
     * @remarks
     * 
     * This property is optional.
     * 
     * The email message is sent only if the job finishes successfully. Email is not sent for 
     *     <b>FsrmReportType_ExportReport</b> report types. The reports are attached to the email 
     *     message. You can specify [Admin Email] to send notification to the administrator (if the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-get_adminemail">IFsrmSetting::AdminEmail</a> property is set). The 
     *     subject is "&lt;ReportType&gt;: &lt;ReportName&gt;". The body of the email message is empty.
     * 
     * 
     * @param {BSTR} mailTo 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportjob-put_mailto
     */
    put_MailTo(mailTo) {
        mailTo := mailTo is String ? BSTR.Alloc(mailTo).Value : mailTo

        result := ComCall(19, this, "ptr", mailTo, "HRESULT")
        return result
    }

    /**
     * Retrieves the running status of the report job.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportjob-get_runningstatus
     */
    get_RunningStatus() {
        result := ComCall(20, this, "int*", &runningStatus := 0, "HRESULT")
        return runningStatus
    }

    /**
     * Retrieves the time stamp for when the reports were last run.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportjob-get_lastrun
     */
    get_LastRun() {
        result := ComCall(21, this, "double*", &lastRun := 0, "HRESULT")
        return lastRun
    }

    /**
     * Retrieves the error message from the last time the reports were run.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportjob-get_lasterror
     */
    get_LastError() {
        lastError := BSTR()
        result := ComCall(22, this, "ptr", lastError, "HRESULT")
        return lastError
    }

    /**
     * Retrieves the local directory path where the reports were stored the last time the reports were run.
     * @remarks
     * 
     * If the reports failed, this is the path where the reports would have been stored. The directory may contain reports that completed successfully before the failure occurred.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportjob-get_lastgeneratedindirectory
     */
    get_LastGeneratedInDirectory() {
        path := BSTR()
        result := ComCall(23, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * Enumerates all the reports configured for this report job.
     * @returns {IFsrmCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcollection">IFsrmCollection</a> interface that contains a collection of reports. The collection is empty if no reports are defined for the job.
     * 
     * Each item of the collection is a <b>VARIANT</b> of type <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member to get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nn-fsrmreports-ifsrmreport">IFsrmReport</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportjob-enumreports
     */
    EnumReports() {
        result := ComCall(24, this, "ptr*", &reports := 0, "HRESULT")
        return IFsrmCollection(reports)
    }

    /**
     * Creates a new report object of the specified type.
     * @param {Integer} reportType Type of report to generate. For possible values, see the<a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreporttype">FsrmReportType</a> enumeration.
     * 
     * Note that the job can contain only one report of each type.
     * @returns {IFsrmReport} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nn-fsrmreports-ifsrmreport">IFsrmReport</a> interface to the newly created report. Use the interface to configure the report.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportjob-createreport
     */
    CreateReport(reportType) {
        result := ComCall(25, this, "int", reportType, "ptr*", &report := 0, "HRESULT")
        return IFsrmReport(report)
    }

    /**
     * Runs all the reports in the job.
     * @param {Integer} context Specifies to which subdirectory the reports are written. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportgenerationcontext">FsrmReportGenerationContext</a> enumeration.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportjob-run
     */
    Run(context) {
        result := ComCall(26, this, "int", context, "HRESULT")
        return result
    }

    /**
     * Waits for the reports in the job to complete.
     * @param {Integer} waitSeconds The number of seconds to wait for the reports to complete. The method returns when the period expires or the reports complete. To wait indefinitely, set the value to –1.
     * @returns {VARIANT_BOOL} Is <b>VARIANT_TRUE</b> if the reports completed; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportjob-waitforcompletion
     */
    WaitForCompletion(waitSeconds) {
        result := ComCall(27, this, "int", waitSeconds, "short*", &completed := 0, "HRESULT")
        return completed
    }

    /**
     * Cancels the running reports for this report job.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportjob-cancel
     */
    Cancel() {
        result := ComCall(28, this, "HRESULT")
        return result
    }
}
