#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITsSbBaseNotifySink.ahk

/**
 * Exposes methods that report status and error messages about tasks to Remote Desktop Connection Broker (RD Connection Broker).
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbtaskpluginnotifysink
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbTaskPluginNotifySink extends ITsSbBaseNotifySink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbTaskPluginNotifySink
     * @type {Guid}
     */
    static IID => Guid("{6aaf899e-c2ec-45ee-aa37-45e60895261a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSetTaskTime", "OnDeleteTaskTime", "OnUpdateTaskStatus", "OnReportTasks"]

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
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtaskpluginnotifysink-onsettasktime
     */
    OnSetTaskTime(szTargetName, TaskStartTime, TaskEndTime, TaskDeadline, szTaskLabel, szTaskIdentifier, szTaskPlugin, dwTaskStatus, saContext) {
        szTargetName := szTargetName is String ? BSTR.Alloc(szTargetName).Value : szTargetName
        szTaskLabel := szTaskLabel is String ? BSTR.Alloc(szTaskLabel).Value : szTaskLabel
        szTaskIdentifier := szTaskIdentifier is String ? BSTR.Alloc(szTaskIdentifier).Value : szTaskIdentifier
        szTaskPlugin := szTaskPlugin is String ? BSTR.Alloc(szTaskPlugin).Value : szTaskPlugin

        result := ComCall(5, this, "ptr", szTargetName, "ptr", TaskStartTime, "ptr", TaskEndTime, "ptr", TaskDeadline, "ptr", szTaskLabel, "ptr", szTaskIdentifier, "ptr", szTaskPlugin, "uint", dwTaskStatus, "ptr", saContext, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that a task has been removed from the queue.
     * @param {BSTR} szTargetName The name of the target.
     * @param {BSTR} szTaskIdentifier The GUID that identifies the task.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtaskpluginnotifysink-ondeletetasktime
     */
    OnDeleteTaskTime(szTargetName, szTaskIdentifier) {
        szTargetName := szTargetName is String ? BSTR.Alloc(szTargetName).Value : szTargetName
        szTaskIdentifier := szTaskIdentifier is String ? BSTR.Alloc(szTaskIdentifier).Value : szTaskIdentifier

        result := ComCall(6, this, "ptr", szTargetName, "ptr", szTaskIdentifier, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that the status of a task has changed.
     * @param {BSTR} szTargetName The name of the target.
     * @param {BSTR} TaskIdentifier The GUID that identifies the task.
     * @param {Integer} TaskStatus An <a href="https://docs.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-rdv_task_status">RDV_TASK_STATUS</a> enumeration value representing the new state of the task.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtaskpluginnotifysink-onupdatetaskstatus
     */
    OnUpdateTaskStatus(szTargetName, TaskIdentifier, TaskStatus) {
        szTargetName := szTargetName is String ? BSTR.Alloc(szTargetName).Value : szTargetName
        TaskIdentifier := TaskIdentifier is String ? BSTR.Alloc(TaskIdentifier).Value : TaskIdentifier

        result := ComCall(7, this, "ptr", szTargetName, "ptr", TaskIdentifier, "int", TaskStatus, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) of a new task report.
     * @param {BSTR} szHostName The name of the host where the report is located.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbtaskpluginnotifysink-onreporttasks
     */
    OnReportTasks(szHostName) {
        szHostName := szHostName is String ? BSTR.Alloc(szHostName).Value : szHostName

        result := ComCall(8, this, "ptr", szHostName, "HRESULT")
        return result
    }
}
