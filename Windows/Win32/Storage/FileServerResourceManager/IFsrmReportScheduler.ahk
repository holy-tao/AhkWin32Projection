#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to manage scheduled tasks for report jobs and file management jobs.
 * @remarks
 * 
 * To enumerate the schedules for reports, call the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-enumreportjobs">IFsrmReportManager::EnumReportJobs</a> 
 *     method. Use the task name in the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_task">IFsrmReportJob::Task</a> property to retrieve the 
 *     schedule from the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-scheduler-start-page">Task Scheduler</a>. To 
 *     retrieve the schedule, call the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itaskscheduler-activate">ITaskScheduler::Activate</a> method. (FSRM 
 *     supports only Task Scheduler version 1.0, not version 2.0.) Note that some report jobs may not have an associated 
 *     schedule.
 * 
 * To enumerate the schedules for file management jobs, call the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-enumfilemanagementjobs">IFsrmFileManagementJobManager::EnumFileManagementJobs</a> 
 *     method. Use the task name in the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjob-get_task">IFsrmFileManagementJob::Task</a> property to 
 *     retrieve the schedule from the 
 *     <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-scheduler-start-page">Task Scheduler</a>. To retrieve the 
 *     schedule, call the <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itaskscheduler-activate">ITaskScheduler::Activate</a> 
 *     method.
 * 
 * To create this object from a script, use the "Fsrm.FsrmReportScheduler" program 
 *     identifier.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nn-fsrmreports-ifsrmreportscheduler
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmReportScheduler extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmReportScheduler
     * @type {Guid}
     */
    static IID => Guid("{6879caf9-6617-4484-8719-71c3d8645f94}")

    /**
     * The class identifier for FsrmReportScheduler
     * @type {Guid}
     */
    static CLSID => Guid("{ea25f1b8-1b8d-4290-8ee8-e17c12c2fe20}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["VerifyNamespaces", "CreateScheduleTask", "ModifyScheduleTask", "DeleteScheduleTask"]

    /**
     * Verifies that the specified local directory paths that are used as the source for the reports are valid.
     * @param {Pointer<VARIANT>} namespacesSafeArray A <b>VARIANT</b> that contains a <b>SAFEARRAY</b> of local 
     *       directory paths. Each element of the array is a variant of type <b>VT_BSTR</b>. Use the 
     *       <b>bstrVal</b> member of the variant to set the path.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportscheduler-verifynamespaces
     */
    VerifyNamespaces(namespacesSafeArray) {
        result := ComCall(7, this, "ptr", namespacesSafeArray, "HRESULT")
        return result
    }

    /**
     * Creates a scheduled task that is used to trigger a report job.
     * @param {BSTR} taskName The name of a <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-scheduler-start-page">Task Scheduler</a> 
     *       task to create. The string is limited to 230 characters.
     * @param {Pointer<VARIANT>} namespacesSafeArray A <b>VARIANT</b> that contains a <b>SAFEARRAY</b> of local 
     *       directory paths to verify (see Remarks). Each element of the array is a variant of type 
     *       <b>VT_BSTR</b>. Use the <b>bstrVal</b> member of the variant to set the 
     *       path.
     * @param {BSTR} serializedTask An XML string that defines the Task Scheduler job. For details, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-scheduler-schema">Task Scheduler Schema</a>.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportscheduler-createscheduletask
     */
    CreateScheduleTask(taskName, namespacesSafeArray, serializedTask) {
        taskName := taskName is String ? BSTR.Alloc(taskName).Value : taskName
        serializedTask := serializedTask is String ? BSTR.Alloc(serializedTask).Value : serializedTask

        result := ComCall(8, this, "ptr", taskName, "ptr", namespacesSafeArray, "ptr", serializedTask, "HRESULT")
        return result
    }

    /**
     * Modifies a task that is used to trigger a report job.
     * @param {BSTR} taskName The name of a <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-scheduler-start-page">Task Scheduler</a> 
     *       task to modify. The string is limited to 230 characters.
     * @param {Pointer<VARIANT>} namespacesSafeArray A <b>VARIANT</b> that contains a <b>SAFEARRAY</b> of local 
     *       directory paths to verify (see Remarks). Each element of the array is a variant of type 
     *       <b>VT_BSTR</b>. Use the <b>bstrVal</b> member of the variant to set the 
     *       path.
     * @param {BSTR} serializedTask An XML string that defines the Task Scheduler job. For details, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-scheduler-schema">Task Scheduler Schema</a>.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportscheduler-modifyscheduletask
     */
    ModifyScheduleTask(taskName, namespacesSafeArray, serializedTask) {
        taskName := taskName is String ? BSTR.Alloc(taskName).Value : taskName
        serializedTask := serializedTask is String ? BSTR.Alloc(serializedTask).Value : serializedTask

        result := ComCall(9, this, "ptr", taskName, "ptr", namespacesSafeArray, "ptr", serializedTask, "HRESULT")
        return result
    }

    /**
     * Deletes a task that is used to trigger a report job.
     * @param {BSTR} taskName The name of a <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-scheduler-start-page">Task Scheduler</a> 
     *       task to delete. The string is limited to 230 characters.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmreportscheduler-deletescheduletask
     */
    DeleteScheduleTask(taskName) {
        taskName := taskName is String ? BSTR.Alloc(taskName).Value : taskName

        result := ComCall(10, this, "ptr", taskName, "HRESULT")
        return result
    }
}
