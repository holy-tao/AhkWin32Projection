#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IIdleSettings.ahk
#Include .\INetworkSettings.ahk
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
     */
    AllowDemandStart {
        get => this.get_AllowDemandStart()
        set => this.put_AllowDemandStart(value)
    }

    /**
     */
    RestartInterval {
        get => this.get_RestartInterval()
        set => this.put_RestartInterval(value)
    }

    /**
     */
    RestartCount {
        get => this.get_RestartCount()
        set => this.put_RestartCount(value)
    }

    /**
     */
    MultipleInstances {
        get => this.get_MultipleInstances()
        set => this.put_MultipleInstances(value)
    }

    /**
     */
    StopIfGoingOnBatteries {
        get => this.get_StopIfGoingOnBatteries()
        set => this.put_StopIfGoingOnBatteries(value)
    }

    /**
     */
    DisallowStartIfOnBatteries {
        get => this.get_DisallowStartIfOnBatteries()
        set => this.put_DisallowStartIfOnBatteries(value)
    }

    /**
     */
    AllowHardTerminate {
        get => this.get_AllowHardTerminate()
        set => this.put_AllowHardTerminate(value)
    }

    /**
     */
    StartWhenAvailable {
        get => this.get_StartWhenAvailable()
        set => this.put_StartWhenAvailable(value)
    }

    /**
     */
    XmlText {
        get => this.get_XmlText()
        set => this.put_XmlText(value)
    }

    /**
     */
    RunOnlyIfNetworkAvailable {
        get => this.get_RunOnlyIfNetworkAvailable()
        set => this.put_RunOnlyIfNetworkAvailable(value)
    }

    /**
     */
    ExecutionTimeLimit {
        get => this.get_ExecutionTimeLimit()
        set => this.put_ExecutionTimeLimit(value)
    }

    /**
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     */
    DeleteExpiredTaskAfter {
        get => this.get_DeleteExpiredTaskAfter()
        set => this.put_DeleteExpiredTaskAfter(value)
    }

    /**
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     */
    Compatibility {
        get => this.get_Compatibility()
        set => this.put_Compatibility(value)
    }

    /**
     */
    Hidden {
        get => this.get_Hidden()
        set => this.put_Hidden(value)
    }

    /**
     * @type {IIdleSettings} 
     */
    IdleSettings {
        get => this.get_IdleSettings()
        set => this.put_IdleSettings(value)
    }

    /**
     */
    RunOnlyIfIdle {
        get => this.get_RunOnlyIfIdle()
        set => this.put_RunOnlyIfIdle(value)
    }

    /**
     */
    WakeToRun {
        get => this.get_WakeToRun()
        set => this.put_WakeToRun(value)
    }

    /**
     * @type {INetworkSettings} 
     */
    NetworkSettings {
        get => this.get_NetworkSettings()
        set => this.put_NetworkSettings(value)
    }

    /**
     * Gets or sets a Boolean value that indicates that the task can be started by using either the Run command or the Context menu.
     * @remarks
     * 
     * When this property is set to True, the task can be started independent of when any triggers start the task.
     * 
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-allowstartondemand-settingstype-element">AllowStartOnDemand</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<VARIANT_BOOL>} pAllowDemandStart 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_allowdemandstart
     */
    get_AllowDemandStart(pAllowDemandStart) {
        pAllowDemandStartMarshal := pAllowDemandStart is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, pAllowDemandStartMarshal, pAllowDemandStart, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task can be started by using either the Run command or the Context menu.
     * @remarks
     * 
     * When this property is set to True, the task can be started independent of when any triggers start the task.
     * 
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-allowstartondemand-settingstype-element">AllowStartOnDemand</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {VARIANT_BOOL} allowDemandStart 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_allowdemandstart
     */
    put_AllowDemandStart(allowDemandStart) {
        result := ComCall(8, this, "short", allowDemandStart, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies how long the Task Scheduler will attempt to restart the task.
     * @remarks
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-interval-restarttype-element">Interval</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<BSTR>} pRestartInterval 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_restartinterval
     */
    get_RestartInterval(pRestartInterval) {
        result := ComCall(9, this, "ptr", pRestartInterval, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies how long the Task Scheduler will attempt to restart the task.
     * @remarks
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-interval-restarttype-element">Interval</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {BSTR} restartInterval 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_restartinterval
     */
    put_RestartInterval(restartInterval) {
        restartInterval := restartInterval is String ? BSTR.Alloc(restartInterval).Value : restartInterval

        result := ComCall(10, this, "ptr", restartInterval, "HRESULT")
        return result
    }

    /**
     * Gets or sets the number of times that the Task Scheduler will attempt to restart the task.
     * @remarks
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-count-restarttype-element">Count</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<Integer>} pRestartCount 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_restartcount
     */
    get_RestartCount(pRestartCount) {
        pRestartCountMarshal := pRestartCount is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pRestartCountMarshal, pRestartCount, "HRESULT")
        return result
    }

    /**
     * Gets or sets the number of times that the Task Scheduler will attempt to restart the task.
     * @remarks
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-count-restarttype-element">Count</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Integer} restartCount 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_restartcount
     */
    put_RestartCount(restartCount) {
        result := ComCall(12, this, "int", restartCount, "HRESULT")
        return result
    }

    /**
     * Gets or sets the policy that defines how the Task Scheduler deals with multiple instances of the task.
     * @remarks
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-multipleinstancespolicy-settingstype-element">MultipleInstancesPolicy</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<Integer>} pPolicy 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_multipleinstances
     */
    get_MultipleInstances(pPolicy) {
        pPolicyMarshal := pPolicy is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pPolicyMarshal, pPolicy, "HRESULT")
        return result
    }

    /**
     * Gets or sets the policy that defines how the Task Scheduler deals with multiple instances of the task.
     * @remarks
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-multipleinstancespolicy-settingstype-element">MultipleInstancesPolicy</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Integer} policy 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_multipleinstances
     */
    put_MultipleInstances(policy) {
        result := ComCall(14, this, "int", policy, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task will be stopped if the computer is going onto batteries.
     * @remarks
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-stopifgoingonbatteries-settingstype-element">StopIfGoingOnBatteries</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<VARIANT_BOOL>} pStopIfOnBatteries 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_stopifgoingonbatteries
     */
    get_StopIfGoingOnBatteries(pStopIfOnBatteries) {
        pStopIfOnBatteriesMarshal := pStopIfOnBatteries is VarRef ? "short*" : "ptr"

        result := ComCall(15, this, pStopIfOnBatteriesMarshal, pStopIfOnBatteries, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task will be stopped if the computer is going onto batteries.
     * @remarks
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-stopifgoingonbatteries-settingstype-element">StopIfGoingOnBatteries</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {VARIANT_BOOL} stopIfOnBatteries 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_stopifgoingonbatteries
     */
    put_StopIfGoingOnBatteries(stopIfOnBatteries) {
        result := ComCall(16, this, "short", stopIfOnBatteries, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task will not be started if the computer is running on batteries.
     * @remarks
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-disallowstartifonbatteries-settingstype-element">DisallowStartIfOnBatteries</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<VARIANT_BOOL>} pDisallowStart 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_disallowstartifonbatteries
     */
    get_DisallowStartIfOnBatteries(pDisallowStart) {
        pDisallowStartMarshal := pDisallowStart is VarRef ? "short*" : "ptr"

        result := ComCall(17, this, pDisallowStartMarshal, pDisallowStart, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task will not be started if the computer is running on batteries.
     * @remarks
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-disallowstartifonbatteries-settingstype-element">DisallowStartIfOnBatteries</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {VARIANT_BOOL} disallowStart 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_disallowstartifonbatteries
     */
    put_DisallowStartIfOnBatteries(disallowStart) {
        result := ComCall(18, this, "short", disallowStart, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task may be terminated by the Task Scheduler service using TerminateProcess.
     * @remarks
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-allowhardterminate-settingstype-element">AllowHardTerminate</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<VARIANT_BOOL>} pAllowHardTerminate 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_allowhardterminate
     */
    get_AllowHardTerminate(pAllowHardTerminate) {
        pAllowHardTerminateMarshal := pAllowHardTerminate is VarRef ? "short*" : "ptr"

        result := ComCall(19, this, pAllowHardTerminateMarshal, pAllowHardTerminate, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task may be terminated by the Task Scheduler service using TerminateProcess.
     * @remarks
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-allowhardterminate-settingstype-element">AllowHardTerminate</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {VARIANT_BOOL} allowHardTerminate 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_allowhardterminate
     */
    put_AllowHardTerminate(allowHardTerminate) {
        result := ComCall(20, this, "short", allowHardTerminate, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler can start the task at any time after its scheduled time has passed.
     * @remarks
     * 
     * This property applies only to time-based tasks with an end boundary or time-based tasks that are set to repeat infinitely.
     * 
     * Tasks that are started after the scheduled time has passed (because of the <b>StartWhenAvailable</b> property being set to True) are queued in the Task Scheduler service's queue of tasks and they are started after a delay.  The default delay is 10 minutes.
     * 
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-startwhenavailable-settingstype-element">StartWhenAvailable</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<VARIANT_BOOL>} pStartWhenAvailable 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_startwhenavailable
     */
    get_StartWhenAvailable(pStartWhenAvailable) {
        pStartWhenAvailableMarshal := pStartWhenAvailable is VarRef ? "short*" : "ptr"

        result := ComCall(21, this, pStartWhenAvailableMarshal, pStartWhenAvailable, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler can start the task at any time after its scheduled time has passed.
     * @remarks
     * 
     * This property applies only to time-based tasks with an end boundary or time-based tasks that are set to repeat infinitely.
     * 
     * Tasks that are started after the scheduled time has passed (because of the <b>StartWhenAvailable</b> property being set to True) are queued in the Task Scheduler service's queue of tasks and they are started after a delay.  The default delay is 10 minutes.
     * 
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-startwhenavailable-settingstype-element">StartWhenAvailable</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {VARIANT_BOOL} startWhenAvailable 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_startwhenavailable
     */
    put_StartWhenAvailable(startWhenAvailable) {
        result := ComCall(22, this, "short", startWhenAvailable, "HRESULT")
        return result
    }

    /**
     * Gets or sets an XML-formatted definition of the task settings.
     * @param {Pointer<BSTR>} pText 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_xmltext
     */
    get_XmlText(pText) {
        result := ComCall(23, this, "ptr", pText, "HRESULT")
        return result
    }

    /**
     * Gets or sets an XML-formatted definition of the task settings.
     * @param {BSTR} text 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_xmltext
     */
    put_XmlText(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(24, this, "ptr", text, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler will run the task only when a network is available.
     * @remarks
     * 
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-runonlyifnetworkavailable-settingstype-element">RunOnlyIfNetworkAvailable</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<VARIANT_BOOL>} pRunOnlyIfNetworkAvailable 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_runonlyifnetworkavailable
     */
    get_RunOnlyIfNetworkAvailable(pRunOnlyIfNetworkAvailable) {
        pRunOnlyIfNetworkAvailableMarshal := pRunOnlyIfNetworkAvailable is VarRef ? "short*" : "ptr"

        result := ComCall(25, this, pRunOnlyIfNetworkAvailableMarshal, pRunOnlyIfNetworkAvailable, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler will run the task only when a network is available.
     * @remarks
     * 
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-runonlyifnetworkavailable-settingstype-element">RunOnlyIfNetworkAvailable</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {VARIANT_BOOL} runOnlyIfNetworkAvailable 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_runonlyifnetworkavailable
     */
    put_RunOnlyIfNetworkAvailable(runOnlyIfNetworkAvailable) {
        result := ComCall(26, this, "short", runOnlyIfNetworkAvailable, "HRESULT")
        return result
    }

    /**
     * Gets or sets the amount of time that is allowed to complete the task.
     * @remarks
     * 
     * The format for this string is PnYnMnDTnHnMnS, where nY is the number of years, nM is the number of months, nD is the number of days, 'T' is the date/time separator, nH is the number of hours, nM is the number of minutes, and nS is the number of seconds (for example, PT5M specifies 5 minutes and P1M4DT2H5M specifies one month, four days, two hours, and five minutes). A value of PT0S will enable the task to run indefinitely.
     * 
     * <div class="alert"><b>Note</b>  If a task is started on demand, the ExecutionTimeLimit setting is bypassed.  Therefore, a task that is started on demand will not be terminated if it exceeds the ExecutionTimeLimit.</div>
     * <div> </div>
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-executiontimelimit-settingstype-element">ExecutionTimeLimit</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<BSTR>} pExecutionTimeLimit 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_executiontimelimit
     */
    get_ExecutionTimeLimit(pExecutionTimeLimit) {
        result := ComCall(27, this, "ptr", pExecutionTimeLimit, "HRESULT")
        return result
    }

    /**
     * Gets or sets the amount of time that is allowed to complete the task.
     * @remarks
     * 
     * The format for this string is PnYnMnDTnHnMnS, where nY is the number of years, nM is the number of months, nD is the number of days, 'T' is the date/time separator, nH is the number of hours, nM is the number of minutes, and nS is the number of seconds (for example, PT5M specifies 5 minutes and P1M4DT2H5M specifies one month, four days, two hours, and five minutes). A value of PT0S will enable the task to run indefinitely.
     * 
     * <div class="alert"><b>Note</b>  If a task is started on demand, the ExecutionTimeLimit setting is bypassed.  Therefore, a task that is started on demand will not be terminated if it exceeds the ExecutionTimeLimit.</div>
     * <div> </div>
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-executiontimelimit-settingstype-element">ExecutionTimeLimit</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {BSTR} executionTimeLimit 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_executiontimelimit
     */
    put_ExecutionTimeLimit(executionTimeLimit) {
        executionTimeLimit := executionTimeLimit is String ? BSTR.Alloc(executionTimeLimit).Value : executionTimeLimit

        result := ComCall(28, this, "ptr", executionTimeLimit, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task is enabled. The task can be performed only when this setting is True.
     * @remarks
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-enabled-settingstype-element">Enabled (settingsType)</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_enabled
     */
    get_Enabled(pEnabled) {
        pEnabledMarshal := pEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(29, this, pEnabledMarshal, pEnabled, "HRESULT")
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
     * Gets or sets the amount of time that the Task Scheduler will wait before deleting the task after it expires.
     * @remarks
     * 
     * A task expires after the end boundary has been exceeded for all triggers associated with the task. The end boundary for a trigger is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_endboundary">EndBoundary</a> property inherited by all trigger interfaces.
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-deleteexpiredtaskafter-settingstype-element">DeleteExpiredTaskAfter (settingsType)</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<BSTR>} pExpirationDelay 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_deleteexpiredtaskafter
     */
    get_DeleteExpiredTaskAfter(pExpirationDelay) {
        result := ComCall(31, this, "ptr", pExpirationDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets the amount of time that the Task Scheduler will wait before deleting the task after it expires.
     * @remarks
     * 
     * A task expires after the end boundary has been exceeded for all triggers associated with the task. The end boundary for a trigger is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_endboundary">EndBoundary</a> property inherited by all trigger interfaces.
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-deleteexpiredtaskafter-settingstype-element">DeleteExpiredTaskAfter (settingsType)</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {BSTR} expirationDelay 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_deleteexpiredtaskafter
     */
    put_DeleteExpiredTaskAfter(expirationDelay) {
        expirationDelay := expirationDelay is String ? BSTR.Alloc(expirationDelay).Value : expirationDelay

        result := ComCall(32, this, "ptr", expirationDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets the priority level of the task.
     * @remarks
     * 
     * Priority level 0 is the highest priority, and priority level 10 is the lowest priority. The default value is 7. Priority levels 7 and 8 are used for background tasks, and priority levels 4, 5, and 6 are used for interactive tasks.
     * 
     * The task's action is started in a process with a priority that is based on a Priority Class value. A Priority Level value (thread priority) is used for COM handler, message box, and email task actions. For more information about the Priority Class and Priority Level values, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/scheduling-priorities">Scheduling Priorities</a>. The following table lists the possible values for the <i>priority</i> parameter, and the corresponding Priority Class and Priority Level values.
     * 
     * <table>
     * <tr>
     * <th>Task <i>priority</i></th>
     * <th>Priority Class</th>
     * <th>Priority Level</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>REALTIME_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_TIME_CRITICAL</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>HIGH_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_HIGHEST</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>ABOVE_NORMAL_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_ABOVE_NORMAL</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>ABOVE_NORMAL_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_ABOVE_NORMAL</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>NORMAL_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_NORMAL</td>
     * </tr>
     * <tr>
     * <td>5</td>
     * <td>NORMAL_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_NORMAL</td>
     * </tr>
     * <tr>
     * <td>6</td>
     * <td>NORMAL_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_NORMAL</td>
     * </tr>
     * <tr>
     * <td>7</td>
     * <td>BELOW_NORMAL_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_BELOW_NORMAL</td>
     * </tr>
     * <tr>
     * <td>8</td>
     * <td>BELOW_NORMAL_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_BELOW_NORMAL</td>
     * </tr>
     * <tr>
     * <td>9</td>
     * <td>IDLE_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_LOWEST</td>
     * </tr>
     * <tr>
     * <td>10</td>
     * <td>IDLE_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_IDLE</td>
     * </tr>
     * </table>
     *  
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-priority-settingstype-element">Priority (settingsType)</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<Integer>} pPriority 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_priority
     */
    get_Priority(pPriority) {
        pPriorityMarshal := pPriority is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, pPriorityMarshal, pPriority, "HRESULT")
        return result
    }

    /**
     * Gets or sets the priority level of the task.
     * @remarks
     * 
     * Priority level 0 is the highest priority, and priority level 10 is the lowest priority. The default value is 7. Priority levels 7 and 8 are used for background tasks, and priority levels 4, 5, and 6 are used for interactive tasks.
     * 
     * The task's action is started in a process with a priority that is based on a Priority Class value. A Priority Level value (thread priority) is used for COM handler, message box, and email task actions. For more information about the Priority Class and Priority Level values, see <a href="https://docs.microsoft.com/windows/win32/ProcThread/scheduling-priorities">Scheduling Priorities</a>. This value also impacts the memory priority (see [**MEMORY_PRIORITY_INFORMATION**](/windows/win32/api/processthreadsapi/ns-processthreadsapi-memory_priority_information)). The following table lists the possible values for the <i>priority</i> parameter, and the corresponding Priority Class and Priority Level values.
     * 
     * <table>
     * <tr>
     * <th>Task <i>priority</i></th>
     * <th>Priority Class</th>
     * <th>Priority Level</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>REALTIME_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_TIME_CRITICAL</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>HIGH_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_HIGHEST</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>ABOVE_NORMAL_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_ABOVE_NORMAL</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>ABOVE_NORMAL_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_ABOVE_NORMAL</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>NORMAL_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_NORMAL</td>
     * </tr>
     * <tr>
     * <td>5</td>
     * <td>NORMAL_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_NORMAL</td>
     * </tr>
     * <tr>
     * <td>6</td>
     * <td>NORMAL_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_NORMAL</td>
     * </tr>
     * <tr>
     * <td>7</td>
     * <td>BELOW_NORMAL_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_BELOW_NORMAL</td>
     * </tr>
     * <tr>
     * <td>8</td>
     * <td>BELOW_NORMAL_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_BELOW_NORMAL</td>
     * </tr>
     * <tr>
     * <td>9</td>
     * <td>IDLE_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_LOWEST</td>
     * </tr>
     * <tr>
     * <td>10</td>
     * <td>IDLE_PRIORITY_CLASS</td>
     * <td>THREAD_PRIORITY_IDLE</td>
     * </tr>
     * </table>
     *  
     * Task priority 4 corresponds to memory priority `MEMORY_PRIORITY_NORMAL(5)`, 5 to `MEMORY_PRIORITY_BELOW_NORMAL(4)` and 6 to `MEMORY_PRIORITY_MEDIUM(3)`.
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-priority-settingstype-element">Priority (settingsType)</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Integer} priority 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_priority
     */
    put_Priority(priority) {
        result := ComCall(34, this, "int", priority, "HRESULT")
        return result
    }

    /**
     * Gets or sets an integer value that indicates which version of Task Scheduler a task is compatible with.
     * @remarks
     * 
     *  Task compatibility, which is set through the <b>Compatibility</b> property, should only be set to TASK_COMPATIBILITY_V1 if a task needs to be accessed or modified from a  Windows XP, Windows Server 2003, or Windows 2000 computer. Otherwise, it is recommended that Task Scheduler 2.0 compatibility be used because the task will have more features.
     * 
     * Tasks compatible with the AT command can only have one time trigger.
     * 
     * Tasks compatible with Task Scheduler 1.0 can only have a time trigger, a logon trigger, or a boot trigger, and the task can only have an executable action.
     * 
     * For more information about task compatibility, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/what-s-new-in-task-scheduler">What's New in Task Scheduler</a> and <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/tasks">Tasks</a>.
     * 
     * 
     * @param {Pointer<Integer>} pCompatLevel 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_compatibility
     */
    get_Compatibility(pCompatLevel) {
        pCompatLevelMarshal := pCompatLevel is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, pCompatLevelMarshal, pCompatLevel, "HRESULT")
        return result
    }

    /**
     * Gets or sets an integer value that indicates which version of Task Scheduler a task is compatible with.
     * @remarks
     * 
     *  Task compatibility, which is set through the <b>Compatibility</b> property, should only be set to TASK_COMPATIBILITY_V1 if a task needs to be accessed or modified from a  Windows XP, Windows Server 2003, or Windows 2000 computer. Otherwise, it is recommended that Task Scheduler 2.0 compatibility be used because the task will have more features.
     * 
     * Tasks compatible with the AT command can only have one time trigger.
     * 
     * Tasks compatible with Task Scheduler 1.0 can only have a time trigger, a logon trigger, or a boot trigger, and the task can only have an executable action.
     * 
     * For more information about task compatibility, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/what-s-new-in-task-scheduler">What's New in Task Scheduler</a> and <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/tasks">Tasks</a>.
     * 
     * 
     * @param {Integer} compatLevel 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_compatibility
     */
    put_Compatibility(compatLevel) {
        result := ComCall(36, this, "int", compatLevel, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task will not be visible in the UI.
     * @remarks
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-hidden-settingstype-element">Hidden (settingsType)</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<VARIANT_BOOL>} pHidden 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_hidden
     */
    get_Hidden(pHidden) {
        pHiddenMarshal := pHidden is VarRef ? "short*" : "ptr"

        result := ComCall(37, this, pHiddenMarshal, pHidden, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task will not be visible in the UI.
     * @remarks
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-hidden-settingstype-element">Hidden (settingsType)</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {VARIANT_BOOL} hidden 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_hidden
     */
    put_Hidden(hidden) {
        result := ComCall(38, this, "short", hidden, "HRESULT")
        return result
    }

    /**
     * Gets or sets the information that specifies how the Task Scheduler performs tasks when the computer is in an idle condition.
     * @remarks
     * 
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-idlesettings-settingstype-element">IdleSettings</a> element of the Task Scheduler schema.
     * 
     * When battery saver is on, Windows Task Scheduler tasks are triggered only if the task is:
     * 
     * <ul>
     * <li>Not set to <b>Start the task only if the computer is idle...</b> (task doesn't use <b>IdleSettings</b>)</li>
     * <li>Not set to run during automatic maintenance (task doesn't use <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings3-get_maintenancesettings">MaintenanceSettings</a>)</li>
     * <li>Is set to <b>Run only when user is logged on</b> (task <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_logontype">LogonType</a> is <b>TASK_LOGON_INTERACTIVE_TOKEN</b> or <b>TASK_LOGON_GROUP</b>)</li>
     * </ul>
     * All other triggers are delayed until battery saver is off. For more information about accessing battery saver status in your application, see <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-system_power_status">SYSTEM_POWER_STATUS</a>. For general information about battery saver, see <a href="https://docs.microsoft.com/windows-hardware/design/component-guidelines/battery-saver">battery saver (in the hardware component guidelines)</a>.
     * 
     * 
     * @returns {IIdleSettings} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_idlesettings
     */
    get_IdleSettings() {
        result := ComCall(39, this, "ptr*", &ppIdleSettings := 0, "HRESULT")
        return IIdleSettings(ppIdleSettings)
    }

    /**
     * Gets or sets the information that specifies how the Task Scheduler performs tasks when the computer is in an idle condition.
     * @remarks
     * 
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-idlesettings-settingstype-element">IdleSettings</a> element of the Task Scheduler schema.
     * 
     * When battery saver is on, Windows Task Scheduler tasks are triggered only if the task is:
     * 
     * <ul>
     * <li>Not set to <b>Start the task only if the computer is idle...</b> (task doesn't use <b>IdleSettings</b>)</li>
     * <li>Not set to run during automatic maintenance (task doesn't use <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings3-get_maintenancesettings">MaintenanceSettings</a>)</li>
     * <li>Is set to <b>Run only when user is logged on</b> (task <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_logontype">LogonType</a> is <b>TASK_LOGON_INTERACTIVE_TOKEN</b> or <b>TASK_LOGON_GROUP</b>)</li>
     * </ul>
     * All other triggers are delayed until battery saver is off. For more information about accessing battery saver status in your application, see <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-system_power_status">SYSTEM_POWER_STATUS</a>. For general information about battery saver, see <a href="https://docs.microsoft.com/windows-hardware/design/component-guidelines/battery-saver">battery saver (in the hardware component guidelines)</a>.
     * 
     * 
     * @param {IIdleSettings} pIdleSettings 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_idlesettings
     */
    put_IdleSettings(pIdleSettings) {
        result := ComCall(40, this, "ptr", pIdleSettings, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler will run the task only if the computer is in an idle condition.
     * @remarks
     * 
     * When reading or writing  XML for a task, this setting is specified in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-runonlyifidle-settingstype-element">RunOnlyIfIdle</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<VARIANT_BOOL>} pRunOnlyIfIdle 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_runonlyifidle
     */
    get_RunOnlyIfIdle(pRunOnlyIfIdle) {
        pRunOnlyIfIdleMarshal := pRunOnlyIfIdle is VarRef ? "short*" : "ptr"

        result := ComCall(41, this, pRunOnlyIfIdleMarshal, pRunOnlyIfIdle, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler will run the task only if the computer is in an idle condition.
     * @remarks
     * 
     * When reading or writing  XML for a task, this setting is specified in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-runonlyifidle-settingstype-element">RunOnlyIfIdle</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {VARIANT_BOOL} runOnlyIfIdle 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_runonlyifidle
     */
    put_RunOnlyIfIdle(runOnlyIfIdle) {
        result := ComCall(42, this, "short", runOnlyIfIdle, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler will wake the computer when it is time to run the task, and keep the computer awake until the task is completed.
     * @remarks
     * 
     * If a task has this property set to true, and is triggered when the computer is already awake, Task Scheduler will request the computer to stay awake until the task has completed running.
     * 
     * When the Task Scheduler service wakes the computer to run a task, the screen may remain off even though the computer is no longer in the sleep or hibernate mode. The screen will turn on when Windows Vista detects that a user has returned to use the computer.
     * 
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-waketorun-settingstype-element">WakeToRun</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<VARIANT_BOOL>} pWake 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_waketorun
     */
    get_WakeToRun(pWake) {
        pWakeMarshal := pWake is VarRef ? "short*" : "ptr"

        result := ComCall(43, this, pWakeMarshal, pWake, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler will wake the computer when it is time to run the task, and keep the computer awake until the task is completed.
     * @remarks
     * 
     * If a task has this property set to true, and is triggered when the computer is already awake, Task Scheduler will request the computer to stay awake until the task has completed running.
     * 
     * When the Task Scheduler service wakes the computer to run a task, the screen may remain off even though the computer is no longer in the sleep or hibernate mode. The screen will turn on when Windows Vista detects that a user has returned to use the computer.
     * 
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-waketorun-settingstype-element">WakeToRun</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {VARIANT_BOOL} wake 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_waketorun
     */
    put_WakeToRun(wake) {
        result := ComCall(44, this, "short", wake, "HRESULT")
        return result
    }

    /**
     * Gets or sets the network settings object that contains a network profile identifier and name.
     * @returns {INetworkSettings} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-get_networksettings
     */
    get_NetworkSettings() {
        result := ComCall(45, this, "ptr*", &ppNetworkSettings := 0, "HRESULT")
        return INetworkSettings(ppNetworkSettings)
    }

    /**
     * Gets or sets the network settings object that contains a network profile identifier and name.
     * @param {INetworkSettings} pNetworkSettings 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings-put_networksettings
     */
    put_NetworkSettings(pNetworkSettings) {
        result := ComCall(46, this, "ptr", pNetworkSettings, "HRESULT")
        return result
    }
}
