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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(12, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_namespaceroots
     */
    get_NamespaceRoots() {
        result := ComCall(14, this, "ptr*", &namespaceRoots := 0, "HRESULT")
        return namespaceRoots
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} namespaceRoots 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_namespaceroots
     */
    put_NamespaceRoots(namespaceRoots) {
        result := ComCall(15, this, "ptr", namespaceRoots, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_enabled
     */
    get_Enabled() {
        result := ComCall(16, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(17, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_operationtype
     */
    get_OperationType() {
        result := ComCall(18, this, "int*", &operationType := 0, "HRESULT")
        return operationType
    }

    /**
     * 
     * @param {Integer} operationType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_operationtype
     */
    put_OperationType(operationType) {
        result := ComCall(19, this, "int", operationType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_expirationdirectory
     */
    get_ExpirationDirectory() {
        expirationDirectory := BSTR()
        result := ComCall(20, this, "ptr", expirationDirectory, "HRESULT")
        return expirationDirectory
    }

    /**
     * 
     * @param {BSTR} expirationDirectory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_expirationdirectory
     */
    put_ExpirationDirectory(expirationDirectory) {
        expirationDirectory := expirationDirectory is String ? BSTR.Alloc(expirationDirectory).Value : expirationDirectory

        result := ComCall(21, this, "ptr", expirationDirectory, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IFsrmActionCommand} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_customaction
     */
    get_CustomAction() {
        result := ComCall(22, this, "ptr*", &action := 0, "HRESULT")
        return IFsrmActionCommand(action)
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_notifications
     */
    get_Notifications() {
        result := ComCall(23, this, "ptr*", &notifications := 0, "HRESULT")
        return notifications
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_logging
     */
    get_Logging() {
        result := ComCall(24, this, "int*", &loggingFlags := 0, "HRESULT")
        return loggingFlags
    }

    /**
     * 
     * @param {Integer} loggingFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_logging
     */
    put_Logging(loggingFlags) {
        result := ComCall(25, this, "int", loggingFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_reportenabled
     */
    get_ReportEnabled() {
        result := ComCall(26, this, "short*", &reportEnabled := 0, "HRESULT")
        return reportEnabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} reportEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_reportenabled
     */
    put_ReportEnabled(reportEnabled) {
        result := ComCall(27, this, "short", reportEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_formats
     */
    get_Formats() {
        result := ComCall(28, this, "ptr*", &formats := 0, "HRESULT")
        return formats
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} formats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_formats
     */
    put_Formats(formats) {
        result := ComCall(29, this, "ptr", formats, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_mailto
     */
    get_MailTo() {
        mailTo := BSTR()
        result := ComCall(30, this, "ptr", mailTo, "HRESULT")
        return mailTo
    }

    /**
     * 
     * @param {BSTR} mailTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_mailto
     */
    put_MailTo(mailTo) {
        mailTo := mailTo is String ? BSTR.Alloc(mailTo).Value : mailTo

        result := ComCall(31, this, "ptr", mailTo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_dayssincefilecreated
     */
    get_DaysSinceFileCreated() {
        result := ComCall(32, this, "int*", &daysSinceCreation := 0, "HRESULT")
        return daysSinceCreation
    }

    /**
     * 
     * @param {Integer} daysSinceCreation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_dayssincefilecreated
     */
    put_DaysSinceFileCreated(daysSinceCreation) {
        result := ComCall(33, this, "int", daysSinceCreation, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_dayssincefilelastaccessed
     */
    get_DaysSinceFileLastAccessed() {
        result := ComCall(34, this, "int*", &daysSinceAccess := 0, "HRESULT")
        return daysSinceAccess
    }

    /**
     * 
     * @param {Integer} daysSinceAccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_dayssincefilelastaccessed
     */
    put_DaysSinceFileLastAccessed(daysSinceAccess) {
        result := ComCall(35, this, "int", daysSinceAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_dayssincefilelastmodified
     */
    get_DaysSinceFileLastModified() {
        result := ComCall(36, this, "int*", &daysSinceModify := 0, "HRESULT")
        return daysSinceModify
    }

    /**
     * 
     * @param {Integer} daysSinceModify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_dayssincefilelastmodified
     */
    put_DaysSinceFileLastModified(daysSinceModify) {
        result := ComCall(37, this, "int", daysSinceModify, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IFsrmCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_propertyconditions
     */
    get_PropertyConditions() {
        result := ComCall(38, this, "ptr*", &propertyConditions := 0, "HRESULT")
        return IFsrmCollection(propertyConditions)
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_fromdate
     */
    get_FromDate() {
        result := ComCall(39, this, "double*", &fromDate := 0, "HRESULT")
        return fromDate
    }

    /**
     * 
     * @param {Float} fromDate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_fromdate
     */
    put_FromDate(fromDate) {
        result := ComCall(40, this, "double", fromDate, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_task
     */
    get_Task() {
        taskName := BSTR()
        result := ComCall(41, this, "ptr", taskName, "HRESULT")
        return taskName
    }

    /**
     * 
     * @param {BSTR} taskName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_task
     */
    put_Task(taskName) {
        taskName := taskName is String ? BSTR.Alloc(taskName).Value : taskName

        result := ComCall(42, this, "ptr", taskName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_parameters
     */
    get_Parameters() {
        result := ComCall(43, this, "ptr*", &parameters := 0, "HRESULT")
        return parameters
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} parameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_parameters
     */
    put_Parameters(parameters) {
        result := ComCall(44, this, "ptr", parameters, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_runningstatus
     */
    get_RunningStatus() {
        result := ComCall(45, this, "int*", &runningStatus := 0, "HRESULT")
        return runningStatus
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_lasterror
     */
    get_LastError() {
        lastError := BSTR()
        result := ComCall(46, this, "ptr", lastError, "HRESULT")
        return lastError
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_lastreportpathwithoutextension
     */
    get_LastReportPathWithoutExtension() {
        path := BSTR()
        result := ComCall(47, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_lastrun
     */
    get_LastRun() {
        result := ComCall(48, this, "double*", &lastRun := 0, "HRESULT")
        return lastRun
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_filenamepattern
     */
    get_FileNamePattern() {
        fileNamePattern := BSTR()
        result := ComCall(49, this, "ptr", fileNamePattern, "HRESULT")
        return fileNamePattern
    }

    /**
     * 
     * @param {BSTR} fileNamePattern 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-put_filenamepattern
     */
    put_FileNamePattern(fileNamePattern) {
        fileNamePattern := fileNamePattern is String ? BSTR.Alloc(fileNamePattern).Value : fileNamePattern

        result := ComCall(50, this, "ptr", fileNamePattern, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-run
     */
    Run(context) {
        result := ComCall(51, this, "int", context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} waitSeconds 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-waitforcompletion
     */
    WaitForCompletion(waitSeconds) {
        result := ComCall(52, this, "int", waitSeconds, "short*", &completed := 0, "HRESULT")
        return completed
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-cancel
     */
    Cancel() {
        result := ComCall(53, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} days 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-addnotification
     */
    AddNotification(days) {
        result := ComCall(54, this, "int", days, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} days 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-deletenotification
     */
    DeleteNotification(days) {
        result := ComCall(55, this, "int", days, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} days 
     * @param {Integer} newDays 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-modifynotification
     */
    ModifyNotification(days, newDays) {
        result := ComCall(56, this, "int", days, "int", newDays, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} days 
     * @param {Integer} actionType 
     * @returns {IFsrmAction} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-createnotificationaction
     */
    CreateNotificationAction(days, actionType) {
        result := ComCall(57, this, "int", days, "int", actionType, "ptr*", &action := 0, "HRESULT")
        return IFsrmAction(action)
    }

    /**
     * 
     * @param {Integer} days 
     * @returns {IFsrmCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-enumnotificationactions
     */
    EnumNotificationActions(days) {
        result := ComCall(58, this, "int", days, "ptr*", &actions := 0, "HRESULT")
        return IFsrmCollection(actions)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IFsrmPropertyCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-createpropertycondition
     */
    CreatePropertyCondition(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(59, this, "ptr", name, "ptr*", &propertyCondition := 0, "HRESULT")
        return IFsrmPropertyCondition(propertyCondition)
    }

    /**
     * 
     * @returns {IFsrmActionCommand} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-createcustomaction
     */
    CreateCustomAction() {
        result := ComCall(60, this, "ptr*", &customAction := 0, "HRESULT")
        return IFsrmActionCommand(customAction)
    }
}
