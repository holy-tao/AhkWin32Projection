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
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_Name(name) {
        result := ComCall(12, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} namespaceRoots 
     * @returns {HRESULT} 
     */
    get_NamespaceRoots(namespaceRoots) {
        result := ComCall(14, this, "ptr", namespaceRoots, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} namespaceRoots 
     * @returns {HRESULT} 
     */
    put_NamespaceRoots(namespaceRoots) {
        result := ComCall(15, this, "ptr", namespaceRoots, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     */
    get_Enabled(enabled) {
        result := ComCall(16, this, "ptr", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     */
    put_Enabled(enabled) {
        result := ComCall(17, this, "short", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} operationType 
     * @returns {HRESULT} 
     */
    get_OperationType(operationType) {
        result := ComCall(18, this, "int*", operationType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} operationType 
     * @returns {HRESULT} 
     */
    put_OperationType(operationType) {
        result := ComCall(19, this, "int", operationType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} expirationDirectory 
     * @returns {HRESULT} 
     */
    get_ExpirationDirectory(expirationDirectory) {
        result := ComCall(20, this, "ptr", expirationDirectory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} expirationDirectory 
     * @returns {HRESULT} 
     */
    put_ExpirationDirectory(expirationDirectory) {
        expirationDirectory := expirationDirectory is String ? BSTR.Alloc(expirationDirectory).Value : expirationDirectory

        result := ComCall(21, this, "ptr", expirationDirectory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmActionCommand>} action 
     * @returns {HRESULT} 
     */
    get_CustomAction(action) {
        result := ComCall(22, this, "ptr", action, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} notifications 
     * @returns {HRESULT} 
     */
    get_Notifications(notifications) {
        result := ComCall(23, this, "ptr", notifications, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} loggingFlags 
     * @returns {HRESULT} 
     */
    get_Logging(loggingFlags) {
        result := ComCall(24, this, "int*", loggingFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} loggingFlags 
     * @returns {HRESULT} 
     */
    put_Logging(loggingFlags) {
        result := ComCall(25, this, "int", loggingFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} reportEnabled 
     * @returns {HRESULT} 
     */
    get_ReportEnabled(reportEnabled) {
        result := ComCall(26, this, "ptr", reportEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} reportEnabled 
     * @returns {HRESULT} 
     */
    put_ReportEnabled(reportEnabled) {
        result := ComCall(27, this, "short", reportEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} formats 
     * @returns {HRESULT} 
     */
    get_Formats(formats) {
        result := ComCall(28, this, "ptr", formats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} formats 
     * @returns {HRESULT} 
     */
    put_Formats(formats) {
        result := ComCall(29, this, "ptr", formats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} mailTo 
     * @returns {HRESULT} 
     */
    get_MailTo(mailTo) {
        result := ComCall(30, this, "ptr", mailTo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} mailTo 
     * @returns {HRESULT} 
     */
    put_MailTo(mailTo) {
        mailTo := mailTo is String ? BSTR.Alloc(mailTo).Value : mailTo

        result := ComCall(31, this, "ptr", mailTo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} daysSinceCreation 
     * @returns {HRESULT} 
     */
    get_DaysSinceFileCreated(daysSinceCreation) {
        result := ComCall(32, this, "int*", daysSinceCreation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} daysSinceCreation 
     * @returns {HRESULT} 
     */
    put_DaysSinceFileCreated(daysSinceCreation) {
        result := ComCall(33, this, "int", daysSinceCreation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} daysSinceAccess 
     * @returns {HRESULT} 
     */
    get_DaysSinceFileLastAccessed(daysSinceAccess) {
        result := ComCall(34, this, "int*", daysSinceAccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} daysSinceAccess 
     * @returns {HRESULT} 
     */
    put_DaysSinceFileLastAccessed(daysSinceAccess) {
        result := ComCall(35, this, "int", daysSinceAccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} daysSinceModify 
     * @returns {HRESULT} 
     */
    get_DaysSinceFileLastModified(daysSinceModify) {
        result := ComCall(36, this, "int*", daysSinceModify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} daysSinceModify 
     * @returns {HRESULT} 
     */
    put_DaysSinceFileLastModified(daysSinceModify) {
        result := ComCall(37, this, "int", daysSinceModify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmCollection>} propertyConditions 
     * @returns {HRESULT} 
     */
    get_PropertyConditions(propertyConditions) {
        result := ComCall(38, this, "ptr", propertyConditions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} fromDate 
     * @returns {HRESULT} 
     */
    get_FromDate(fromDate) {
        result := ComCall(39, this, "double*", fromDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} fromDate 
     * @returns {HRESULT} 
     */
    put_FromDate(fromDate) {
        result := ComCall(40, this, "double", fromDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} taskName 
     * @returns {HRESULT} 
     */
    get_Task(taskName) {
        result := ComCall(41, this, "ptr", taskName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} taskName 
     * @returns {HRESULT} 
     */
    put_Task(taskName) {
        taskName := taskName is String ? BSTR.Alloc(taskName).Value : taskName

        result := ComCall(42, this, "ptr", taskName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} parameters 
     * @returns {HRESULT} 
     */
    get_Parameters(parameters) {
        result := ComCall(43, this, "ptr", parameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} parameters 
     * @returns {HRESULT} 
     */
    put_Parameters(parameters) {
        result := ComCall(44, this, "ptr", parameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} runningStatus 
     * @returns {HRESULT} 
     */
    get_RunningStatus(runningStatus) {
        result := ComCall(45, this, "int*", runningStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} lastError 
     * @returns {HRESULT} 
     */
    get_LastError(lastError) {
        result := ComCall(46, this, "ptr", lastError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     */
    get_LastReportPathWithoutExtension(path) {
        result := ComCall(47, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} lastRun 
     * @returns {HRESULT} 
     */
    get_LastRun(lastRun) {
        result := ComCall(48, this, "double*", lastRun, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} fileNamePattern 
     * @returns {HRESULT} 
     */
    get_FileNamePattern(fileNamePattern) {
        result := ComCall(49, this, "ptr", fileNamePattern, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} fileNamePattern 
     * @returns {HRESULT} 
     */
    put_FileNamePattern(fileNamePattern) {
        fileNamePattern := fileNamePattern is String ? BSTR.Alloc(fileNamePattern).Value : fileNamePattern

        result := ComCall(50, this, "ptr", fileNamePattern, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} context 
     * @returns {HRESULT} 
     */
    Run(context) {
        result := ComCall(51, this, "int", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} waitSeconds 
     * @param {Pointer<VARIANT_BOOL>} completed 
     * @returns {HRESULT} 
     */
    WaitForCompletion(waitSeconds, completed) {
        result := ComCall(52, this, "int", waitSeconds, "ptr", completed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(53, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} days 
     * @returns {HRESULT} 
     */
    AddNotification(days) {
        result := ComCall(54, this, "int", days, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} days 
     * @returns {HRESULT} 
     */
    DeleteNotification(days) {
        result := ComCall(55, this, "int", days, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} days 
     * @param {Integer} newDays 
     * @returns {HRESULT} 
     */
    ModifyNotification(days, newDays) {
        result := ComCall(56, this, "int", days, "int", newDays, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} days 
     * @param {Integer} actionType 
     * @param {Pointer<IFsrmAction>} action 
     * @returns {HRESULT} 
     */
    CreateNotificationAction(days, actionType, action) {
        result := ComCall(57, this, "int", days, "int", actionType, "ptr", action, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} days 
     * @param {Pointer<IFsrmCollection>} actions 
     * @returns {HRESULT} 
     */
    EnumNotificationActions(days, actions) {
        result := ComCall(58, this, "int", days, "ptr", actions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IFsrmPropertyCondition>} propertyCondition 
     * @returns {HRESULT} 
     */
    CreatePropertyCondition(name, propertyCondition) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(59, this, "ptr", name, "ptr", propertyCondition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmActionCommand>} customAction 
     * @returns {HRESULT} 
     */
    CreateCustomAction(customAction) {
        result := ComCall(60, this, "ptr", customAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
