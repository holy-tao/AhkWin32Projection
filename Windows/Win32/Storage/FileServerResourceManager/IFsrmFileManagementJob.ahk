#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_name
     */
    get_Name(name) {
        result := ComCall(12, this, "ptr", name, "HRESULT")
        return result
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
     * @param {Pointer<Pointer<SAFEARRAY>>} namespaceRoots 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_namespaceroots
     */
    get_NamespaceRoots(namespaceRoots) {
        namespaceRootsMarshal := namespaceRoots is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, namespaceRootsMarshal, namespaceRoots, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_enabled
     */
    get_Enabled(enabled) {
        result := ComCall(16, this, "ptr", enabled, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} operationType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_operationtype
     */
    get_OperationType(operationType) {
        operationTypeMarshal := operationType is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, operationTypeMarshal, operationType, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} expirationDirectory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_expirationdirectory
     */
    get_ExpirationDirectory(expirationDirectory) {
        result := ComCall(20, this, "ptr", expirationDirectory, "HRESULT")
        return result
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
     * @param {Pointer<IFsrmActionCommand>} action 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_customaction
     */
    get_CustomAction(action) {
        result := ComCall(22, this, "ptr*", action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} notifications 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_notifications
     */
    get_Notifications(notifications) {
        notificationsMarshal := notifications is VarRef ? "ptr*" : "ptr"

        result := ComCall(23, this, notificationsMarshal, notifications, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} loggingFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_logging
     */
    get_Logging(loggingFlags) {
        loggingFlagsMarshal := loggingFlags is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, loggingFlagsMarshal, loggingFlags, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} reportEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_reportenabled
     */
    get_ReportEnabled(reportEnabled) {
        result := ComCall(26, this, "ptr", reportEnabled, "HRESULT")
        return result
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
     * @param {Pointer<Pointer<SAFEARRAY>>} formats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_formats
     */
    get_Formats(formats) {
        formatsMarshal := formats is VarRef ? "ptr*" : "ptr"

        result := ComCall(28, this, formatsMarshal, formats, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} mailTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_mailto
     */
    get_MailTo(mailTo) {
        result := ComCall(30, this, "ptr", mailTo, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} daysSinceCreation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_dayssincefilecreated
     */
    get_DaysSinceFileCreated(daysSinceCreation) {
        daysSinceCreationMarshal := daysSinceCreation is VarRef ? "int*" : "ptr"

        result := ComCall(32, this, daysSinceCreationMarshal, daysSinceCreation, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} daysSinceAccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_dayssincefilelastaccessed
     */
    get_DaysSinceFileLastAccessed(daysSinceAccess) {
        daysSinceAccessMarshal := daysSinceAccess is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, daysSinceAccessMarshal, daysSinceAccess, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} daysSinceModify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_dayssincefilelastmodified
     */
    get_DaysSinceFileLastModified(daysSinceModify) {
        daysSinceModifyMarshal := daysSinceModify is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, daysSinceModifyMarshal, daysSinceModify, "HRESULT")
        return result
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
     * @param {Pointer<IFsrmCollection>} propertyConditions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_propertyconditions
     */
    get_PropertyConditions(propertyConditions) {
        result := ComCall(38, this, "ptr*", propertyConditions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} fromDate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_fromdate
     */
    get_FromDate(fromDate) {
        fromDateMarshal := fromDate is VarRef ? "double*" : "ptr"

        result := ComCall(39, this, fromDateMarshal, fromDate, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} taskName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_task
     */
    get_Task(taskName) {
        result := ComCall(41, this, "ptr", taskName, "HRESULT")
        return result
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
     * @param {Pointer<Pointer<SAFEARRAY>>} parameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_parameters
     */
    get_Parameters(parameters) {
        parametersMarshal := parameters is VarRef ? "ptr*" : "ptr"

        result := ComCall(43, this, parametersMarshal, parameters, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} runningStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_runningstatus
     */
    get_RunningStatus(runningStatus) {
        runningStatusMarshal := runningStatus is VarRef ? "int*" : "ptr"

        result := ComCall(45, this, runningStatusMarshal, runningStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} lastError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_lasterror
     */
    get_LastError(lastError) {
        result := ComCall(46, this, "ptr", lastError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_lastreportpathwithoutextension
     */
    get_LastReportPathWithoutExtension(path) {
        result := ComCall(47, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} lastRun 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_lastrun
     */
    get_LastRun(lastRun) {
        lastRunMarshal := lastRun is VarRef ? "double*" : "ptr"

        result := ComCall(48, this, lastRunMarshal, lastRun, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} fileNamePattern 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_filenamepattern
     */
    get_FileNamePattern(fileNamePattern) {
        result := ComCall(49, this, "ptr", fileNamePattern, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} completed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-waitforcompletion
     */
    WaitForCompletion(waitSeconds, completed) {
        result := ComCall(52, this, "int", waitSeconds, "ptr", completed, "HRESULT")
        return result
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
     * @param {Pointer<IFsrmAction>} action 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-createnotificationaction
     */
    CreateNotificationAction(days, actionType, action) {
        result := ComCall(57, this, "int", days, "int", actionType, "ptr*", action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} days 
     * @param {Pointer<IFsrmCollection>} actions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-enumnotificationactions
     */
    EnumNotificationActions(days, actions) {
        result := ComCall(58, this, "int", days, "ptr*", actions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IFsrmPropertyCondition>} propertyCondition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-createpropertycondition
     */
    CreatePropertyCondition(name, propertyCondition) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(59, this, "ptr", name, "ptr*", propertyCondition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmActionCommand>} customAction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-createcustomaction
     */
    CreateCustomAction(customAction) {
        result := ComCall(60, this, "ptr*", customAction, "HRESULT")
        return result
    }
}
