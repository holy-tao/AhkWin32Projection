#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmActionCommand.ahk
#Include .\IFsrmCollection.ahk
#Include .\IFsrmAction.ahk
#Include .\IFsrmPropertyCondition.ahk
#Include .\IFsrmObject.ahk

/**
 * Defines a file management job.
 * @remarks
 * 
 * When a file management job runs, it scans the files in the specified folders and if a file in the folder meets 
 *     the conditions specified by the job, FSRM moves the file to the specified expired files folder if the type is 
 *     expiration, or runs the custom action if defined. If notifications or actions are specified, FSRM sends the 
 *     notifications and performs the actions.
 * 
 * Use the following properties to specify the expiration conditions:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_dayssincefilecreated">DaysSinceFileCreated</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_dayssincefilelastaccessed">DaysSinceFileLastAccessed</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_dayssincefilelastmodified">DaysSinceFileLastModified</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_propertyconditions">PropertyConditions</a> (use 
 *       the 
 *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-createpropertycondition">CreatePropertyCondition</a> 
 *       method to create the property condition)</li>
 * </ul>
 * FSRM performs a logical AND on all the conditions to determine if the file meets those conditions.
 * 
 * FSRM does not expire files in the system directories (for example, "\Windows", 
 *     "\System Volume Information", "$Event", and 
 *     "$Recycle").
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nn-fsrmreports-ifsrmfilemanagementjob
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmFileManagementJob extends IFsrmObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmFileManagementJob
     * @type {Guid}
     */
    static IID => Guid("{0770687e-9f36-4d6f-8778-599d188461c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "get_NamespaceRoots", "put_NamespaceRoots", "get_Enabled", "put_Enabled", "get_OperationType", "put_OperationType", "get_ExpirationDirectory", "put_ExpirationDirectory", "get_CustomAction", "get_Notifications", "get_Logging", "put_Logging", "get_ReportEnabled", "put_ReportEnabled", "get_Formats", "put_Formats", "get_MailTo", "put_MailTo", "get_DaysSinceFileCreated", "put_DaysSinceFileCreated", "get_DaysSinceFileLastAccessed", "put_DaysSinceFileLastAccessed", "get_DaysSinceFileLastModified", "put_DaysSinceFileLastModified", "get_PropertyConditions", "get_FromDate", "put_FromDate", "get_Task", "put_Task", "get_Parameters", "put_Parameters", "get_RunningStatus", "get_LastError", "get_LastReportPathWithoutExtension", "get_LastRun", "get_FileNamePattern", "put_FileNamePattern", "Run", "WaitForCompletion", "Cancel", "AddNotification", "DeleteNotification", "ModifyNotification", "CreateNotificationAction", "EnumNotificationActions", "CreatePropertyCondition", "CreateCustomAction"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    NamespaceRoots {
        get => this.get_NamespaceRoots()
        set => this.put_NamespaceRoots(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {Integer} 
     */
    OperationType {
        get => this.get_OperationType()
        set => this.put_OperationType(value)
    }

    /**
     * @type {BSTR} 
     */
    ExpirationDirectory {
        get => this.get_ExpirationDirectory()
        set => this.put_ExpirationDirectory(value)
    }

    /**
     * @type {IFsrmActionCommand} 
     */
    CustomAction {
        get => this.get_CustomAction()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    Notifications {
        get => this.get_Notifications()
    }

    /**
     * @type {Integer} 
     */
    Logging {
        get => this.get_Logging()
        set => this.put_Logging(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ReportEnabled {
        get => this.get_ReportEnabled()
        set => this.put_ReportEnabled(value)
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
    DaysSinceFileCreated {
        get => this.get_DaysSinceFileCreated()
        set => this.put_DaysSinceFileCreated(value)
    }

    /**
     * @type {Integer} 
     */
    DaysSinceFileLastAccessed {
        get => this.get_DaysSinceFileLastAccessed()
        set => this.put_DaysSinceFileLastAccessed(value)
    }

    /**
     * @type {Integer} 
     */
    DaysSinceFileLastModified {
        get => this.get_DaysSinceFileLastModified()
        set => this.put_DaysSinceFileLastModified(value)
    }

    /**
     * @type {IFsrmCollection} 
     */
    PropertyConditions {
        get => this.get_PropertyConditions()
    }

    /**
     * @type {Float} 
     */
    FromDate {
        get => this.get_FromDate()
        set => this.put_FromDate(value)
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
    Parameters {
        get => this.get_Parameters()
        set => this.put_Parameters(value)
    }

    /**
     * @type {Integer} 
     */
    RunningStatus {
        get => this.get_RunningStatus()
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
    LastReportPathWithoutExtension {
        get => this.get_LastReportPathWithoutExtension()
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
    FileNamePattern {
        get => this.get_FileNamePattern()
        set => this.put_FileNamePattern(value)
    }

    /**
     * The name of the file management job.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(12, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * The name of the file management job.
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * An array of local directory paths that will be scanned when the file management job is run.
     * @remarks
     * 
     * All subdirectories under each specified path are also scanned (recursively).
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
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_namespaceroots
     */
    get_NamespaceRoots() {
        result := ComCall(14, this, "ptr*", &namespaceRoots := 0, "HRESULT")
        return namespaceRoots
    }

    /**
     * An array of local directory paths that will be scanned when the file management job is run.
     * @remarks
     * 
     * All subdirectories under each specified path are also scanned (recursively).
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
     * @param {Pointer<SAFEARRAY>} namespaceRoots 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_namespaceroots
     */
    put_NamespaceRoots(namespaceRoots) {
        result := ComCall(15, this, "ptr", namespaceRoots, "HRESULT")
        return result
    }

    /**
     * Indicates whether the job enabled (can run).
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_enabled
     */
    get_Enabled() {
        result := ComCall(16, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Indicates whether the job enabled (can run).
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(17, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * The type of file management job. The type determines the operation to perform on a file when all conditions are met.
     * @remarks
     * 
     * If the type is <b>FsrmFileManagementType_Expiration</b>, FSRM moves the files that meet 
     *     all the file management job's conditions to the path specified by the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_expirationdirectory">ExpirationDirectory</a> property 
     *     when the job is run.
     * 
     * If the type is <b>FsrmFileManagementType_Custom</b>, FSRM executes the custom action 
     *     specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_customaction">CustomAction</a> 
     *     property for every file that meets all the file management job's conditions when the file management job is 
     *     run.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_operationtype
     */
    get_OperationType() {
        result := ComCall(18, this, "int*", &operationType := 0, "HRESULT")
        return operationType
    }

    /**
     * The type of file management job. The type determines the operation to perform on a file when all conditions are met.
     * @remarks
     * 
     * If the type is <b>FsrmFileManagementType_Expiration</b>, FSRM moves the files that meet 
     *     all the file management job's conditions to the path specified by the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_expirationdirectory">ExpirationDirectory</a> property 
     *     when the job is run.
     * 
     * If the type is <b>FsrmFileManagementType_Custom</b>, FSRM executes the custom action 
     *     specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_customaction">CustomAction</a> 
     *     property for every file that meets all the file management job's conditions when the file management job is 
     *     run.
     * 
     * 
     * @param {Integer} operationType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_operationtype
     */
    put_OperationType(operationType) {
        result := ComCall(19, this, "int", operationType, "HRESULT")
        return result
    }

    /**
     * The root directory that will contain the expired files.
     * @remarks
     * 
     * FSRM moves the files that meet all of the file management job's conditions to this directory when the job is 
     *     run, therefore the running process must have write permission. The directory must also be located on an NTFS 
     *     volume.
     * 
     * FSRM maintains the file's current directory structure in the expired directory so you can determine its 
     *      previous location. For example, if FSRM expired the file, 
     *      "C:\TestExpired\Test1.txt", the expired root directory would contain:
     * 
     * "<i>FsrmServer(FQDN)</i>&#92;<i>JobName</i>_<i>TimeStamp</i>\C$\TestExpired\Test1.txt"
     * 
     * The expired file's ACLs are maintained with the file.
     * 
     * If the expiration directory does not exist, FSRM creates the directory (with administrator access rights 
     *      only).
     * 
     * Do not specify an expiration directory that is in the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_namespaceroots">NamespaceRoots</a> path.
     * 
     * Specify only if <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_operationtype">OperationType</a> 
     *     is <b>FsrmFileManagementType_Expiration</b>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_expirationdirectory
     */
    get_ExpirationDirectory() {
        expirationDirectory := BSTR()
        result := ComCall(20, this, "ptr", expirationDirectory, "HRESULT")
        return expirationDirectory
    }

    /**
     * The root directory that will contain the expired files.
     * @remarks
     * 
     * FSRM moves the files that meet all of the file management job's conditions to this directory when the job is 
     *     run, therefore the running process must have write permission. The directory must also be located on an NTFS 
     *     volume.
     * 
     * FSRM maintains the file's current directory structure in the expired directory so you can determine its 
     *      previous location. For example, if FSRM expired the file, 
     *      "C:\TestExpired\Test1.txt", the expired root directory would contain:
     * 
     * "<i>FsrmServer(FQDN)</i>&#92;<i>JobName</i>_<i>TimeStamp</i>\C$\TestExpired\Test1.txt"
     * 
     * The expired file's ACLs are maintained with the file.
     * 
     * If the expiration directory does not exist, FSRM creates the directory (with administrator access rights 
     *      only).
     * 
     * Do not specify an expiration directory that is in the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_namespaceroots">NamespaceRoots</a> path.
     * 
     * Specify only if <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_operationtype">OperationType</a> 
     *     is <b>FsrmFileManagementType_Expiration</b>.
     * 
     * 
     * @param {BSTR} expirationDirectory 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_expirationdirectory
     */
    put_ExpirationDirectory(expirationDirectory) {
        expirationDirectory := expirationDirectory is String ? BSTR.Alloc(expirationDirectory).Value : expirationDirectory

        result := ComCall(21, this, "ptr", expirationDirectory, "HRESULT")
        return result
    }

    /**
     * The action to execute when all the conditions are met.
     * @remarks
     * 
     * To create the custom action, call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-createcustomaction">IFsrmFileManagementJob::CreateCustomAction</a> 
     *     method.
     * 
     * For a list of macros supported, perform a "get" operation on the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-get_actionvariables">IFsrmFileManagementJobManager::ActionVariables</a> 
     *     and 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-get_actionvariabledescriptions">IFsrmFileManagementJobManager::ActionVariableDescriptions</a> 
     *     properties.
     * 
     * 
     * @returns {IFsrmActionCommand} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_customaction
     */
    get_CustomAction() {
        result := ComCall(22, this, "ptr*", &action := 0, "HRESULT")
        return IFsrmActionCommand(action)
    }

    /**
     * The list of notification periods defined for the job.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_notifications
     */
    get_Notifications() {
        result := ComCall(23, this, "ptr*", &notifications := 0, "HRESULT")
        return notifications
    }

    /**
     * The types of logging to perform.
     * @remarks
     * 
     * The log files are stored in the reports directory. The name of the 
     *     <b>FsrmFileManagementLoggingFlags_ClassificationsInLogFile</b> log file is 
     *     "FileManagement-<i>FsrmServerName(FQDN)</i>-<i>FileManagementJobName</i>-<i>NotificationPeriod</i>-<i>TimeStamp</i>.xml". 
     *     The log file contains one entry for each file processed. Each log entry specifies the following items:
     * 
     * <ul>
     * <li>File name (full path)</li>
     * <li>Owner</li>
     * <li>Command type</li>
     * <li>Command parameters</li>
     * <li>Error value</li>
     * </ul>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_logging
     */
    get_Logging() {
        result := ComCall(24, this, "int*", &loggingFlags := 0, "HRESULT")
        return loggingFlags
    }

    /**
     * The types of logging to perform.
     * @remarks
     * 
     * The log files are stored in the reports directory. The name of the 
     *     <b>FsrmFileManagementLoggingFlags_ClassificationsInLogFile</b> log file is 
     *     "FileManagement-<i>FsrmServerName(FQDN)</i>-<i>FileManagementJobName</i>-<i>NotificationPeriod</i>-<i>TimeStamp</i>.xml". 
     *     The log file contains one entry for each file processed. Each log entry specifies the following items:
     * 
     * <ul>
     * <li>File name (full path)</li>
     * <li>Owner</li>
     * <li>Command type</li>
     * <li>Command parameters</li>
     * <li>Error value</li>
     * </ul>
     * 
     * 
     * @param {Integer} loggingFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_logging
     */
    put_Logging(loggingFlags) {
        result := ComCall(25, this, "int", loggingFlags, "HRESULT")
        return result
    }

    /**
     * Indicates whether the job will generate a report when it runs.
     * @remarks
     * 
     * The job generates a default report that it places in the folder associated with context specified when you run 
     *     the job.
     * 
     * Controls reporting regardless of whether the file management job was scheduled (using the Task Scheduler) or 
     *     run on demand (using 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-run">IFsrmFileManagementJob::Run</a>).
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_reportenabled
     */
    get_ReportEnabled() {
        result := ComCall(26, this, "short*", &reportEnabled := 0, "HRESULT")
        return reportEnabled
    }

    /**
     * Indicates whether the job will generate a report when it runs.
     * @remarks
     * 
     * The job generates a default report that it places in the folder associated with context specified when you run 
     *     the job.
     * 
     * Controls reporting regardless of whether the file management job was scheduled (using the Task Scheduler) or 
     *     run on demand (using 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-run">IFsrmFileManagementJob::Run</a>).
     * 
     * 
     * @param {VARIANT_BOOL} reportEnabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_reportenabled
     */
    put_ReportEnabled(reportEnabled) {
        result := ComCall(27, this, "short", reportEnabled, "HRESULT")
        return result
    }

    /**
     * The formats of the report to generate when the job is run.
     * @remarks
     * 
     * The job generates the reports if <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_reportenabled">ReportEnabled</a> is <b>VARIANT_TRUE</b>.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_formats
     */
    get_Formats() {
        result := ComCall(28, this, "ptr*", &formats := 0, "HRESULT")
        return formats
    }

    /**
     * The formats of the report to generate when the job is run.
     * @remarks
     * 
     * The job generates the reports if <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_reportenabled">ReportEnabled</a> is <b>VARIANT_TRUE</b>.
     * 
     * 
     * @param {Pointer<SAFEARRAY>} formats 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_formats
     */
    put_Formats(formats) {
        result := ComCall(29, this, "ptr", formats, "HRESULT")
        return result
    }

    /**
     * The email addresses to which to send the reports, if any.
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
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_mailto
     */
    get_MailTo() {
        mailTo := BSTR()
        result := ComCall(30, this, "ptr", mailTo, "HRESULT")
        return mailTo
    }

    /**
     * The email addresses to which to send the reports, if any.
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
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_mailto
     */
    put_MailTo(mailTo) {
        mailTo := mailTo is String ? BSTR.Alloc(mailTo).Value : mailTo

        result := ComCall(31, this, "ptr", mailTo, "HRESULT")
        return result
    }

    /**
     * The number of days that have elapsed since the file was created.
     * @remarks
     * 
     * The value is FsrmDaysNotSpecified if not set.
     * 
     * The job considers this condition met for a file if the file's creation date minus the job's current run date 
     *     is less than the value of <i>daysSinceCreation</i>.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_dayssincefilecreated
     */
    get_DaysSinceFileCreated() {
        result := ComCall(32, this, "int*", &daysSinceCreation := 0, "HRESULT")
        return daysSinceCreation
    }

    /**
     * The number of days that have elapsed since the file was created.
     * @remarks
     * 
     * The value is FsrmDaysNotSpecified if not set.
     * 
     * The job considers this condition met for a file if the file's creation date minus the job's current run date 
     *     is less than the value of <i>daysSinceCreation</i>.
     * 
     * 
     * @param {Integer} daysSinceCreation 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_dayssincefilecreated
     */
    put_DaysSinceFileCreated(daysSinceCreation) {
        result := ComCall(33, this, "int", daysSinceCreation, "HRESULT")
        return result
    }

    /**
     * The number of days that have elapsed since the file was last accessed.
     * @remarks
     * 
     * The value is FsrmDaysNotSpecified if not set.
     * 
     * The job considers this condition met for a file if the file's last accessed date minus the job's current run 
     *     date is less than the value of <i>daysSinceAccess</i>.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_dayssincefilelastaccessed
     */
    get_DaysSinceFileLastAccessed() {
        result := ComCall(34, this, "int*", &daysSinceAccess := 0, "HRESULT")
        return daysSinceAccess
    }

    /**
     * The number of days that have elapsed since the file was last accessed.
     * @remarks
     * 
     * The value is FsrmDaysNotSpecified if not set.
     * 
     * The job considers this condition met for a file if the file's last accessed date minus the job's current run 
     *     date is less than the value of <i>daysSinceAccess</i>.
     * 
     * 
     * @param {Integer} daysSinceAccess 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_dayssincefilelastaccessed
     */
    put_DaysSinceFileLastAccessed(daysSinceAccess) {
        result := ComCall(35, this, "int", daysSinceAccess, "HRESULT")
        return result
    }

    /**
     * The number of days that have elapsed since a file was last modified.
     * @remarks
     * 
     * The value is FsrmDaysNotSpecified if not set.
     * 
     * The job considers this condition met for a file if the file's last modified date minus the job's current run 
     *     date is less than the value of <i>daysSinceModify</i>.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_dayssincefilelastmodified
     */
    get_DaysSinceFileLastModified() {
        result := ComCall(36, this, "int*", &daysSinceModify := 0, "HRESULT")
        return daysSinceModify
    }

    /**
     * The number of days that have elapsed since a file was last modified.
     * @remarks
     * 
     * The value is FsrmDaysNotSpecified if not set.
     * 
     * The job considers this condition met for a file if the file's last modified date minus the job's current run 
     *     date is less than the value of <i>daysSinceModify</i>.
     * 
     * 
     * @param {Integer} daysSinceModify 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_dayssincefilelastmodified
     */
    put_DaysSinceFileLastModified(daysSinceModify) {
        result := ComCall(37, this, "int", daysSinceModify, "HRESULT")
        return result
    }

    /**
     * A list of property conditions specified for the job.
     * @remarks
     * 
     * To specify a property condition for the job, call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-createpropertycondition">IFsrmFileManagementJob::CreatePropertyCondition</a> 
     *     method.
     * 
     * 
     * @returns {IFsrmCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_propertyconditions
     */
    get_PropertyConditions() {
        result := ComCall(38, this, "ptr*", &propertyConditions := 0, "HRESULT")
        return IFsrmCollection(propertyConditions)
    }

    /**
     * The date from which you want the file management job to begin expiring files (moving files to the expired files directory). This property also applies to custom commands for the file management job.
     * @remarks
     * 
     * The value is FsrmDateNotSpecified if not set.
     * 
     * The job expires the files if the <i>fromDate</i> value is earlier than the job's current 
     *     run date.
     * 
     * Typically, you set this date to be greater than the shortest notification period that you specify. This 
     *     ensures that notification is sent at least once before files are expired. If you do not specify this date, files 
     *     can be expired before notification is sent. For example, if you create job and run it the same day, it is possible 
     *     that one or more files will meet the expiration conditions set by the job and be expired without any notification. 
     *     You can create zero-day notification but the notification will be after the fact.
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_fromdate
     */
    get_FromDate() {
        result := ComCall(39, this, "double*", &fromDate := 0, "HRESULT")
        return fromDate
    }

    /**
     * The date from which you want the file management job to begin expiring files (moving files to the expired files directory). This property also applies to custom commands for the file management job.
     * @remarks
     * 
     * The value is FsrmDateNotSpecified if not set.
     * 
     * The job expires the files if the <i>fromDate</i> value is earlier than the job's current 
     *     run date.
     * 
     * Typically, you set this date to be greater than the shortest notification period that you specify. This 
     *     ensures that notification is sent at least once before files are expired. If you do not specify this date, files 
     *     can be expired before notification is sent. For example, if you create job and run it the same day, it is possible 
     *     that one or more files will meet the expiration conditions set by the job and be expired without any notification. 
     *     You can create zero-day notification but the notification will be after the fact.
     * 
     * 
     * @param {Float} fromDate 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_fromdate
     */
    put_FromDate(fromDate) {
        result := ComCall(40, this, "double", fromDate, "HRESULT")
        return result
    }

    /**
     * The name of the scheduled task to associate with the job.
     * @remarks
     * 
     * Typically, the name is the same name that you specify when you call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportscheduler-createscheduletask">IFsrmReportScheduler::CreateScheduleTask</a> 
     *     method to create a scheduled task that runs the job.
     * 
     * The command that you specify for the scheduled job is C:\Windows\System32\Storrept.exe. The 
     *     arguments that you specify for Storrept.exe are 
     *     "FileMgmt Run /Scheduled /Task:<i>taskname</i>", where 
     *     <i>taskname</i> is the value of this property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_task
     */
    get_Task() {
        taskName := BSTR()
        result := ComCall(41, this, "ptr", taskName, "HRESULT")
        return taskName
    }

    /**
     * The name of the scheduled task to associate with the job.
     * @remarks
     * 
     * Typically, the name is the same name that you specify when you call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportscheduler-createscheduletask">IFsrmReportScheduler::CreateScheduleTask</a> 
     *     method to create a scheduled task that runs the job.
     * 
     * The command that you specify for the scheduled job is C:\Windows\System32\Storrept.exe. The 
     *     arguments that you specify for Storrept.exe are 
     *     "FileMgmt Run /Scheduled /Task:<i>taskname</i>", where 
     *     <i>taskname</i> is the value of this property.
     * 
     * 
     * @param {BSTR} taskName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_task
     */
    put_Task(taskName) {
        taskName := taskName is String ? BSTR.Alloc(taskName).Value : taskName

        result := ComCall(42, this, "ptr", taskName, "HRESULT")
        return result
    }

    /**
     * The parameters for the file management job.
     * @remarks
     * 
     * There is no limit to the length of the parameter name or value, nor is there a limit to the number of 
     *     parameters that you can specify. Specifying a parameter without a value is valid (for example, 
     *     "parameter=").
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_parameters
     */
    get_Parameters() {
        result := ComCall(43, this, "ptr*", &parameters := 0, "HRESULT")
        return parameters
    }

    /**
     * The parameters for the file management job.
     * @remarks
     * 
     * There is no limit to the length of the parameter name or value, nor is there a limit to the number of 
     *     parameters that you can specify. Specifying a parameter without a value is valid (for example, 
     *     "parameter=").
     * 
     * 
     * @param {Pointer<SAFEARRAY>} parameters 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_parameters
     */
    put_Parameters(parameters) {
        result := ComCall(44, this, "ptr", parameters, "HRESULT")
        return result
    }

    /**
     * The running status of the job.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_runningstatus
     */
    get_RunningStatus() {
        result := ComCall(45, this, "int*", &runningStatus := 0, "HRESULT")
        return runningStatus
    }

    /**
     * The error message from the last time the job was run.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_lasterror
     */
    get_LastError() {
        lastError := BSTR()
        result := ComCall(46, this, "ptr", lastError, "HRESULT")
        return lastError
    }

    /**
     * The local directory path where the reports were stored the last time the job ran.
     * @remarks
     * 
     * If the job failed, this is the path where the reports would have been stored. The directory may contain 
     *     reports that completed successfully before the failure occurred.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_lastreportpathwithoutextension
     */
    get_LastReportPathWithoutExtension() {
        path := BSTR()
        result := ComCall(47, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * The last time the file management job was run.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_lastrun
     */
    get_LastRun() {
        result := ComCall(48, this, "double*", &lastRun := 0, "HRESULT")
        return lastRun
    }

    /**
     * A condition property:\_wildcard filter for names.
     * @remarks
     * 
     * A file name pattern is a string expression that defines a set of file names. The expression may contain the 
     *     following wildcard characters: "*" and "?". The "*" wildcard 
     *     matches zero or more characters and the "?" wildcard  matches exactly 1 character. For example, 
     *     the file name "example.cpp" matches the pattern "e*.cpp", but not "e?.cpp". The file name "ex.cpp" would match 
     *     both patterns. Note that when the file name pattern is used to compare against a specific file name, the pattern 
     *     match is case-insensitive.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_filenamepattern
     */
    get_FileNamePattern() {
        fileNamePattern := BSTR()
        result := ComCall(49, this, "ptr", fileNamePattern, "HRESULT")
        return fileNamePattern
    }

    /**
     * A condition property:\_wildcard filter for names.
     * @remarks
     * 
     * A file name pattern is a string expression that defines a set of file names. The expression may contain the 
     *     following wildcard characters: "*" and "?". The "*" wildcard 
     *     matches zero or more characters and the "?" wildcard  matches exactly 1 character. For example, 
     *     the file name "example.cpp" matches the pattern "e*.cpp", but not "e?.cpp". The file name "ex.cpp" would match 
     *     both patterns. Note that when the file name pattern is used to compare against a specific file name, the pattern 
     *     match is case-insensitive.
     * 
     * 
     * @param {BSTR} fileNamePattern 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_filenamepattern
     */
    put_FileNamePattern(fileNamePattern) {
        fileNamePattern := fileNamePattern is String ? BSTR.Alloc(fileNamePattern).Value : fileNamePattern

        result := ComCall(50, this, "ptr", fileNamePattern, "HRESULT")
        return result
    }

    /**
     * Runs the job.
     * @param {Integer} context Specifies to which subdirectory the reports or logging are written, if enabled. For possible values, see 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportgenerationcontext">FsrmReportGenerationContext</a> 
     *       enumeration.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-run
     */
    Run(context) {
        result := ComCall(51, this, "int", context, "HRESULT")
        return result
    }

    /**
     * Waits for the specified period of time or until the job has finished running.
     * @param {Integer} waitSeconds The number of seconds to wait for the job to complete. The method returns when the period expires or the 
     *       job complete. To wait indefinitely, set the value to –1.
     * @returns {VARIANT_BOOL} Is <b>VARIANT_TRUE</b> if the job completed; otherwise, 
     *       <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-waitforcompletion
     */
    WaitForCompletion(waitSeconds) {
        result := ComCall(52, this, "int", waitSeconds, "short*", &completed := 0, "HRESULT")
        return completed
    }

    /**
     * Cancels the job if it is running.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-cancel
     */
    Cancel() {
        result := ComCall(53, this, "HRESULT")
        return result
    }

    /**
     * Adds a new notification value (period) to the file management job's list of notifications.
     * @param {Integer} days A unique notification value to add. The value cannot be less than zero.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-addnotification
     */
    AddNotification(days) {
        result := ComCall(54, this, "int", days, "HRESULT")
        return result
    }

    /**
     * Deletes a notification value from the file management job's list of notifications.
     * @param {Integer} days The notification value to delete.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-deletenotification
     */
    DeleteNotification(days) {
        result := ComCall(55, this, "int", days, "HRESULT")
        return result
    }

    /**
     * Change a notification value in the file management job's list of notifications.
     * @param {Integer} days The notification value to change.
     * @param {Integer} newDays The new notification value. The value must be unique and cannot be less than zero.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-modifynotification
     */
    ModifyNotification(days, newDays) {
        result := ComCall(56, this, "int", days, "int", newDays, "HRESULT")
        return result
    }

    /**
     * Creates a notification action and associates it with the notification value.
     * @param {Integer} days The notification value to associate with the action.
     * @param {Integer} actionType The action to perform when the notification period is reached, enumerated by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmactiontype">FsrmActionType</a> enumeration.
     * 
     * <div class="alert"><b>Note</b>  The <b>FsrmActionType_Report</b> type is not valid for this method.</div>
     * <div> </div>
     * @returns {IFsrmAction} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmaction">IFsrmAction</a> interface of the newly created action. 
     *       Query the interface for the action interface that you specified in the <i>actionType</i> 
     *       parameter. For example, if the action type is <b>FsrmActionType_Command</b>, query the 
     *       interface for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmactioncommand">IFsrmActionCommand</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-createnotificationaction
     */
    CreateNotificationAction(days, actionType) {
        result := ComCall(57, this, "int", days, "int", actionType, "ptr*", &action := 0, "HRESULT")
        return IFsrmAction(action)
    }

    /**
     * Enumerates the actions associated with a notification value.
     * @param {Integer} days The notification value that contains the actions that you want to enumerate.
     * @returns {IFsrmCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcollection">IFsrmCollection</a> interface that contains a  collection of actions. The variant type of each item in the collection is <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant to get an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmaction">IFsrmAction</a> interface. You can use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmaction-get_actiontype">IFsrmAction::ActionType</a> property to determine the actual action interface to query.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-enumnotificationactions
     */
    EnumNotificationActions(days) {
        result := ComCall(58, this, "int", days, "ptr*", &actions := 0, "HRESULT")
        return IFsrmCollection(actions)
    }

    /**
     * Creates a new property condition and adds it to the collection of property conditions.
     * @param {BSTR} name The name of the property definition that the condition applies to. To enumerate the defined property 
     *       definitions, call the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-enumpropertydefinitions">IFsrmClassificationManager::EnumPropertyDefinitions</a> 
     *       method.
     * @returns {IFsrmPropertyCondition} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nn-fsrmreports-ifsrmpropertycondition">IFsrmPropertyCondition</a> interface that you 
     *       use to define the newly created property condition.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-createpropertycondition
     */
    CreatePropertyCondition(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(59, this, "ptr", name, "ptr*", &propertyCondition := 0, "HRESULT")
        return IFsrmPropertyCondition(propertyCondition)
    }

    /**
     * Creates a custom action object.
     * @returns {IFsrmActionCommand} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmactioncommand">IFsrmActionCommand</a> interface that you can use 
     *       to specify a custom action to perform if the job's property conditions are met.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-createcustomaction
     */
    CreateCustomAction() {
        result := ComCall(60, this, "ptr*", &customAction := 0, "HRESULT")
        return IFsrmActionCommand(customAction)
    }
}
