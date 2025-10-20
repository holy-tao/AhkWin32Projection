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
     * 
     * @param {Pointer<VARIANT_BOOL>} pAllowDemandStart 
     * @returns {HRESULT} 
     */
    get_AllowDemandStart(pAllowDemandStart) {
        result := ComCall(7, this, "ptr", pAllowDemandStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allowDemandStart 
     * @returns {HRESULT} 
     */
    put_AllowDemandStart(allowDemandStart) {
        result := ComCall(8, this, "short", allowDemandStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pRestartInterval 
     * @returns {HRESULT} 
     */
    get_RestartInterval(pRestartInterval) {
        result := ComCall(9, this, "ptr", pRestartInterval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} restartInterval 
     * @returns {HRESULT} 
     */
    put_RestartInterval(restartInterval) {
        restartInterval := restartInterval is String ? BSTR.Alloc(restartInterval).Value : restartInterval

        result := ComCall(10, this, "ptr", restartInterval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRestartCount 
     * @returns {HRESULT} 
     */
    get_RestartCount(pRestartCount) {
        result := ComCall(11, this, "int*", pRestartCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} restartCount 
     * @returns {HRESULT} 
     */
    put_RestartCount(restartCount) {
        result := ComCall(12, this, "int", restartCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPolicy 
     * @returns {HRESULT} 
     */
    get_MultipleInstances(pPolicy) {
        result := ComCall(13, this, "int*", pPolicy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} policy 
     * @returns {HRESULT} 
     */
    put_MultipleInstances(policy) {
        result := ComCall(14, this, "int", policy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pStopIfOnBatteries 
     * @returns {HRESULT} 
     */
    get_StopIfGoingOnBatteries(pStopIfOnBatteries) {
        result := ComCall(15, this, "ptr", pStopIfOnBatteries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} stopIfOnBatteries 
     * @returns {HRESULT} 
     */
    put_StopIfGoingOnBatteries(stopIfOnBatteries) {
        result := ComCall(16, this, "short", stopIfOnBatteries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pDisallowStart 
     * @returns {HRESULT} 
     */
    get_DisallowStartIfOnBatteries(pDisallowStart) {
        result := ComCall(17, this, "ptr", pDisallowStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} disallowStart 
     * @returns {HRESULT} 
     */
    put_DisallowStartIfOnBatteries(disallowStart) {
        result := ComCall(18, this, "short", disallowStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pAllowHardTerminate 
     * @returns {HRESULT} 
     */
    get_AllowHardTerminate(pAllowHardTerminate) {
        result := ComCall(19, this, "ptr", pAllowHardTerminate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allowHardTerminate 
     * @returns {HRESULT} 
     */
    put_AllowHardTerminate(allowHardTerminate) {
        result := ComCall(20, this, "short", allowHardTerminate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pStartWhenAvailable 
     * @returns {HRESULT} 
     */
    get_StartWhenAvailable(pStartWhenAvailable) {
        result := ComCall(21, this, "ptr", pStartWhenAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} startWhenAvailable 
     * @returns {HRESULT} 
     */
    put_StartWhenAvailable(startWhenAvailable) {
        result := ComCall(22, this, "short", startWhenAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pText 
     * @returns {HRESULT} 
     */
    get_XmlText(pText) {
        result := ComCall(23, this, "ptr", pText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @returns {HRESULT} 
     */
    put_XmlText(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(24, this, "ptr", text, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pRunOnlyIfNetworkAvailable 
     * @returns {HRESULT} 
     */
    get_RunOnlyIfNetworkAvailable(pRunOnlyIfNetworkAvailable) {
        result := ComCall(25, this, "ptr", pRunOnlyIfNetworkAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} runOnlyIfNetworkAvailable 
     * @returns {HRESULT} 
     */
    put_RunOnlyIfNetworkAvailable(runOnlyIfNetworkAvailable) {
        result := ComCall(26, this, "short", runOnlyIfNetworkAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pExecutionTimeLimit 
     * @returns {HRESULT} 
     */
    get_ExecutionTimeLimit(pExecutionTimeLimit) {
        result := ComCall(27, this, "ptr", pExecutionTimeLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} executionTimeLimit 
     * @returns {HRESULT} 
     */
    put_ExecutionTimeLimit(executionTimeLimit) {
        executionTimeLimit := executionTimeLimit is String ? BSTR.Alloc(executionTimeLimit).Value : executionTimeLimit

        result := ComCall(28, this, "ptr", executionTimeLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnabled 
     * @returns {HRESULT} 
     */
    get_Enabled(pEnabled) {
        result := ComCall(29, this, "ptr", pEnabled, "int")
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
        result := ComCall(30, this, "short", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pExpirationDelay 
     * @returns {HRESULT} 
     */
    get_DeleteExpiredTaskAfter(pExpirationDelay) {
        result := ComCall(31, this, "ptr", pExpirationDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} expirationDelay 
     * @returns {HRESULT} 
     */
    put_DeleteExpiredTaskAfter(expirationDelay) {
        expirationDelay := expirationDelay is String ? BSTR.Alloc(expirationDelay).Value : expirationDelay

        result := ComCall(32, this, "ptr", expirationDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPriority 
     * @returns {HRESULT} 
     */
    get_Priority(pPriority) {
        result := ComCall(33, this, "int*", pPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} priority 
     * @returns {HRESULT} 
     */
    put_Priority(priority) {
        result := ComCall(34, this, "int", priority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCompatLevel 
     * @returns {HRESULT} 
     */
    get_Compatibility(pCompatLevel) {
        result := ComCall(35, this, "int*", pCompatLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} compatLevel 
     * @returns {HRESULT} 
     */
    put_Compatibility(compatLevel) {
        result := ComCall(36, this, "int", compatLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pHidden 
     * @returns {HRESULT} 
     */
    get_Hidden(pHidden) {
        result := ComCall(37, this, "ptr", pHidden, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} hidden 
     * @returns {HRESULT} 
     */
    put_Hidden(hidden) {
        result := ComCall(38, this, "short", hidden, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IIdleSettings>} ppIdleSettings 
     * @returns {HRESULT} 
     */
    get_IdleSettings(ppIdleSettings) {
        result := ComCall(39, this, "ptr", ppIdleSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IIdleSettings>} pIdleSettings 
     * @returns {HRESULT} 
     */
    put_IdleSettings(pIdleSettings) {
        result := ComCall(40, this, "ptr", pIdleSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pRunOnlyIfIdle 
     * @returns {HRESULT} 
     */
    get_RunOnlyIfIdle(pRunOnlyIfIdle) {
        result := ComCall(41, this, "ptr", pRunOnlyIfIdle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} runOnlyIfIdle 
     * @returns {HRESULT} 
     */
    put_RunOnlyIfIdle(runOnlyIfIdle) {
        result := ComCall(42, this, "short", runOnlyIfIdle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pWake 
     * @returns {HRESULT} 
     */
    get_WakeToRun(pWake) {
        result := ComCall(43, this, "ptr", pWake, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} wake 
     * @returns {HRESULT} 
     */
    put_WakeToRun(wake) {
        result := ComCall(44, this, "short", wake, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetworkSettings>} ppNetworkSettings 
     * @returns {HRESULT} 
     */
    get_NetworkSettings(ppNetworkSettings) {
        result := ComCall(45, this, "ptr", ppNetworkSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetworkSettings>} pNetworkSettings 
     * @returns {HRESULT} 
     */
    put_NetworkSettings(pNetworkSettings) {
        result := ComCall(46, this, "ptr", pNetworkSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
