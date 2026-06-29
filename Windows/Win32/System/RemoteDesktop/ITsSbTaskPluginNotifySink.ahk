#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\ITsSbBaseNotifySink.ahk" { ITsSbBaseNotifySink }
#Import ".\RDV_TASK_STATUS.ahk" { RDV_TASK_STATUS }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Exposes methods that report status and error messages about tasks to Remote Desktop Connection Broker (RD Connection Broker).
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbtaskpluginnotifysink
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbTaskPluginNotifySink extends ITsSbBaseNotifySink {
    /**
     * The interface identifier for ITsSbTaskPluginNotifySink
     * @type {Guid}
     */
    static IID := Guid("{6aaf899e-c2ec-45ee-aa37-45e60895261a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbTaskPluginNotifySink interfaces
    */
    struct Vtbl extends ITsSbBaseNotifySink.Vtbl {
        OnSetTaskTime      : IntPtr
        OnDeleteTaskTime   : IntPtr
        OnUpdateTaskStatus : IntPtr
        OnReportTasks      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbTaskPluginNotifySink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that a task has been scheduled.
     * @param {BSTR} szTargetName The name of the target.
     * @param {FILETIME} TaskStartTime A <b>FILETIME</b> structure specifying the start time (UTC).
     * @param {FILETIME} TaskEndTime A <b>FILETIME</b> structure specifying the end time (UTC).
     * @param {FILETIME} TaskDeadline A <b>FILETIME</b> structure specifying the deadline (UTC).
     * @param {BSTR} szTaskLabel A label describing the purpose of the task.
     * @param {BSTR} szTaskIdentifier Identifies the target.
     * @param {BSTR} szTaskPlugin The display name of the task agent.
     * @param {Integer} dwTaskStatus An <a href="https://docs.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-rdv_task_status">RDV_TASK_STATUS</a> enumeration value  that represents the state of the task.
     * @param {Pointer<SAFEARRAY>} saContext The context bytes associated with the task.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskpluginnotifysink-onsettasktime
     */
    OnSetTaskTime(szTargetName, TaskStartTime, TaskEndTime, TaskDeadline, szTaskLabel, szTaskIdentifier, szTaskPlugin, dwTaskStatus, saContext) {
        szTargetName := szTargetName is String ? BSTR.Alloc(szTargetName).Value : szTargetName
        szTaskLabel := szTaskLabel is String ? BSTR.Alloc(szTaskLabel).Value : szTaskLabel
        szTaskIdentifier := szTaskIdentifier is String ? BSTR.Alloc(szTaskIdentifier).Value : szTaskIdentifier
        szTaskPlugin := szTaskPlugin is String ? BSTR.Alloc(szTaskPlugin).Value : szTaskPlugin

        result := ComCall(5, this, BSTR, szTargetName, FILETIME, TaskStartTime, FILETIME, TaskEndTime, FILETIME, TaskDeadline, BSTR, szTaskLabel, BSTR, szTaskIdentifier, BSTR, szTaskPlugin, "uint", dwTaskStatus, SAFEARRAY.Ptr, saContext, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that a task has been removed from the queue.
     * @param {BSTR} szTargetName The name of the target.
     * @param {BSTR} szTaskIdentifier The GUID that identifies the task.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskpluginnotifysink-ondeletetasktime
     */
    OnDeleteTaskTime(szTargetName, szTaskIdentifier) {
        szTargetName := szTargetName is String ? BSTR.Alloc(szTargetName).Value : szTargetName
        szTaskIdentifier := szTaskIdentifier is String ? BSTR.Alloc(szTaskIdentifier).Value : szTaskIdentifier

        result := ComCall(6, this, BSTR, szTargetName, BSTR, szTaskIdentifier, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that the status of a task has changed.
     * @param {BSTR} szTargetName The name of the target.
     * @param {BSTR} TaskIdentifier The GUID that identifies the task.
     * @param {RDV_TASK_STATUS} TaskStatus An <a href="https://docs.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-rdv_task_status">RDV_TASK_STATUS</a> enumeration value representing the new state of the task.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskpluginnotifysink-onupdatetaskstatus
     */
    OnUpdateTaskStatus(szTargetName, TaskIdentifier, TaskStatus) {
        szTargetName := szTargetName is String ? BSTR.Alloc(szTargetName).Value : szTargetName
        TaskIdentifier := TaskIdentifier is String ? BSTR.Alloc(TaskIdentifier).Value : TaskIdentifier

        result := ComCall(7, this, BSTR, szTargetName, BSTR, TaskIdentifier, RDV_TASK_STATUS, TaskStatus, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) of a new task report.
     * @param {BSTR} szHostName The name of the host where the report is located.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskpluginnotifysink-onreporttasks
     */
    OnReportTasks(szHostName) {
        szHostName := szHostName is String ? BSTR.Alloc(szHostName).Value : szHostName

        result := ComCall(8, this, BSTR, szHostName, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbTaskPluginNotifySink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnSetTaskTime := CallbackCreate(GetMethod(implObj, "OnSetTaskTime"), flags, 10)
        this.vtbl.OnDeleteTaskTime := CallbackCreate(GetMethod(implObj, "OnDeleteTaskTime"), flags, 3)
        this.vtbl.OnUpdateTaskStatus := CallbackCreate(GetMethod(implObj, "OnUpdateTaskStatus"), flags, 4)
        this.vtbl.OnReportTasks := CallbackCreate(GetMethod(implObj, "OnReportTasks"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnSetTaskTime)
        CallbackFree(this.vtbl.OnDeleteTaskTime)
        CallbackFree(this.vtbl.OnUpdateTaskStatus)
        CallbackFree(this.vtbl.OnReportTasks)
    }
}
