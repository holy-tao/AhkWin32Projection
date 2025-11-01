#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the settings that the Task Scheduler service uses to perform the task.
 * @remarks
 * 
  * By default, a task will be stopped 72 hours after it starts to run.  You can change this by changing the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_executiontimelimit">ExecutionTimeLimit</a> setting.
  * 
  * When reading or writing XML for a task, the task settings are defined in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-settings-tasktype-element">Settings</a> element of the Task Scheduler schema.
  * 
  * When battery saver is on, Windows Task Scheduler tasks are triggered only if the task is:
  * 
  * <ul>
  * <li>Not set to <b>Start the task only if the computer is idle...</b> (task doesn't use <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_idlesettings">IdleSettings</a>)</li>
  * <li>Not set to run during automatic maintenance (task doesn't use <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings3-get_maintenancesettings">MaintenanceSettings</a>)</li>
  * <li>Is set to <b>Run only when user is logged on</b> (task <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_logontype">LogonType</a> is <b>TASK_LOGON_INTERACTIVE_TOKEN</b> or <b>TASK_LOGON_GROUP</b>)</li>
  * </ul>
  * All other triggers are delayed until battery saver is off. For more information about accessing battery saver status in your application, see <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-system_power_status">SYSTEM_POWER_STATUS</a>. For general information about battery saver, see <a href="https://docs.microsoft.com/windows-hardware/design/component-guidelines/battery-saver">battery saver (in the hardware component guidelines)</a>. 
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-itasksettings
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITaskSettings extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITaskSettings
     * @type {Guid}
     */
    static IID => Guid("{8fd4711d-2d02-4c8c-87e3-eff699de127e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowDemandStart", "put_AllowDemandStart", "get_RestartInterval", "put_RestartInterval", "get_RestartCount", "put_RestartCount", "get_MultipleInstances", "put_MultipleInstances", "get_StopIfGoingOnBatteries", "put_StopIfGoingOnBatteries", "get_DisallowStartIfOnBatteries", "put_DisallowStartIfOnBatteries", "get_AllowHardTerminate", "put_AllowHardTerminate", "get_StartWhenAvailable", "put_StartWhenAvailable", "get_XmlText", "put_XmlText", "get_RunOnlyIfNetworkAvailable", "put_RunOnlyIfNetworkAvailable", "get_ExecutionTimeLimit", "put_ExecutionTimeLimit", "get_Enabled", "put_Enabled", "get_DeleteExpiredTaskAfter", "put_DeleteExpiredTaskAfter", "get_Priority", "put_Priority", "get_Compatibility", "put_Compatibility", "get_Hidden", "put_Hidden", "get_IdleSettings", "put_IdleSettings", "get_RunOnlyIfIdle", "put_RunOnlyIfIdle", "get_WakeToRun", "put_WakeToRun", "get_NetworkSettings", "put_NetworkSettings"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pAllowDemandStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_allowdemandstart
     */
    get_AllowDemandStart(pAllowDemandStart) {
        result := ComCall(7, this, "ptr", pAllowDemandStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allowDemandStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_allowdemandstart
     */
    put_AllowDemandStart(allowDemandStart) {
        result := ComCall(8, this, "short", allowDemandStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pRestartInterval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_restartinterval
     */
    get_RestartInterval(pRestartInterval) {
        result := ComCall(9, this, "ptr", pRestartInterval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} restartInterval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_restartinterval
     */
    put_RestartInterval(restartInterval) {
        restartInterval := restartInterval is String ? BSTR.Alloc(restartInterval).Value : restartInterval

        result := ComCall(10, this, "ptr", restartInterval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRestartCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_restartcount
     */
    get_RestartCount(pRestartCount) {
        pRestartCountMarshal := pRestartCount is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pRestartCountMarshal, pRestartCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} restartCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_restartcount
     */
    put_RestartCount(restartCount) {
        result := ComCall(12, this, "int", restartCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPolicy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_multipleinstances
     */
    get_MultipleInstances(pPolicy) {
        pPolicyMarshal := pPolicy is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pPolicyMarshal, pPolicy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} policy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_multipleinstances
     */
    put_MultipleInstances(policy) {
        result := ComCall(14, this, "int", policy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pStopIfOnBatteries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_stopifgoingonbatteries
     */
    get_StopIfGoingOnBatteries(pStopIfOnBatteries) {
        result := ComCall(15, this, "ptr", pStopIfOnBatteries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} stopIfOnBatteries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_stopifgoingonbatteries
     */
    put_StopIfGoingOnBatteries(stopIfOnBatteries) {
        result := ComCall(16, this, "short", stopIfOnBatteries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pDisallowStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_disallowstartifonbatteries
     */
    get_DisallowStartIfOnBatteries(pDisallowStart) {
        result := ComCall(17, this, "ptr", pDisallowStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} disallowStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_disallowstartifonbatteries
     */
    put_DisallowStartIfOnBatteries(disallowStart) {
        result := ComCall(18, this, "short", disallowStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pAllowHardTerminate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_allowhardterminate
     */
    get_AllowHardTerminate(pAllowHardTerminate) {
        result := ComCall(19, this, "ptr", pAllowHardTerminate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allowHardTerminate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_allowhardterminate
     */
    put_AllowHardTerminate(allowHardTerminate) {
        result := ComCall(20, this, "short", allowHardTerminate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pStartWhenAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_startwhenavailable
     */
    get_StartWhenAvailable(pStartWhenAvailable) {
        result := ComCall(21, this, "ptr", pStartWhenAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} startWhenAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_startwhenavailable
     */
    put_StartWhenAvailable(startWhenAvailable) {
        result := ComCall(22, this, "short", startWhenAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_xmltext
     */
    get_XmlText(pText) {
        result := ComCall(23, this, "ptr", pText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_xmltext
     */
    put_XmlText(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(24, this, "ptr", text, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pRunOnlyIfNetworkAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_runonlyifnetworkavailable
     */
    get_RunOnlyIfNetworkAvailable(pRunOnlyIfNetworkAvailable) {
        result := ComCall(25, this, "ptr", pRunOnlyIfNetworkAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} runOnlyIfNetworkAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_runonlyifnetworkavailable
     */
    put_RunOnlyIfNetworkAvailable(runOnlyIfNetworkAvailable) {
        result := ComCall(26, this, "short", runOnlyIfNetworkAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pExecutionTimeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_executiontimelimit
     */
    get_ExecutionTimeLimit(pExecutionTimeLimit) {
        result := ComCall(27, this, "ptr", pExecutionTimeLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} executionTimeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_executiontimelimit
     */
    put_ExecutionTimeLimit(executionTimeLimit) {
        executionTimeLimit := executionTimeLimit is String ? BSTR.Alloc(executionTimeLimit).Value : executionTimeLimit

        result := ComCall(28, this, "ptr", executionTimeLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_enabled
     */
    get_Enabled(pEnabled) {
        result := ComCall(29, this, "ptr", pEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     */
    put_Enabled(enabled) {
        result := ComCall(30, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pExpirationDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_deleteexpiredtaskafter
     */
    get_DeleteExpiredTaskAfter(pExpirationDelay) {
        result := ComCall(31, this, "ptr", pExpirationDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} expirationDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_deleteexpiredtaskafter
     */
    put_DeleteExpiredTaskAfter(expirationDelay) {
        expirationDelay := expirationDelay is String ? BSTR.Alloc(expirationDelay).Value : expirationDelay

        result := ComCall(32, this, "ptr", expirationDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_priority
     */
    get_Priority(pPriority) {
        pPriorityMarshal := pPriority is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, pPriorityMarshal, pPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} priority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_priority
     */
    put_Priority(priority) {
        result := ComCall(34, this, "int", priority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCompatLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_compatibility
     */
    get_Compatibility(pCompatLevel) {
        pCompatLevelMarshal := pCompatLevel is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, pCompatLevelMarshal, pCompatLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} compatLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_compatibility
     */
    put_Compatibility(compatLevel) {
        result := ComCall(36, this, "int", compatLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pHidden 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_hidden
     */
    get_Hidden(pHidden) {
        result := ComCall(37, this, "ptr", pHidden, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} hidden 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_hidden
     */
    put_Hidden(hidden) {
        result := ComCall(38, this, "short", hidden, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IIdleSettings>} ppIdleSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_idlesettings
     */
    get_IdleSettings(ppIdleSettings) {
        result := ComCall(39, this, "ptr*", ppIdleSettings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IIdleSettings} pIdleSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_idlesettings
     */
    put_IdleSettings(pIdleSettings) {
        result := ComCall(40, this, "ptr", pIdleSettings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pRunOnlyIfIdle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_runonlyifidle
     */
    get_RunOnlyIfIdle(pRunOnlyIfIdle) {
        result := ComCall(41, this, "ptr", pRunOnlyIfIdle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} runOnlyIfIdle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_runonlyifidle
     */
    put_RunOnlyIfIdle(runOnlyIfIdle) {
        result := ComCall(42, this, "short", runOnlyIfIdle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pWake 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_waketorun
     */
    get_WakeToRun(pWake) {
        result := ComCall(43, this, "ptr", pWake, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} wake 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_waketorun
     */
    put_WakeToRun(wake) {
        result := ComCall(44, this, "short", wake, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<INetworkSettings>} ppNetworkSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_networksettings
     */
    get_NetworkSettings(ppNetworkSettings) {
        result := ComCall(45, this, "ptr*", ppNetworkSettings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetworkSettings} pNetworkSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_networksettings
     */
    put_NetworkSettings(pNetworkSettings) {
        result := ComCall(46, this, "ptr", pNetworkSettings, "HRESULT")
        return result
    }
}
