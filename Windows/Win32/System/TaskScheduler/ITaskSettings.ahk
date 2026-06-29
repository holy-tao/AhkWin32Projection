#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\INetworkSettings.ahk" { INetworkSettings }
#Import ".\IIdleSettings.ahk" { IIdleSettings }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\TASK_INSTANCES_POLICY.ahk" { TASK_INSTANCES_POLICY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TASK_COMPATIBILITY.ahk" { TASK_COMPATIBILITY }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Provides the settings that the Task Scheduler service uses to perform the task.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-itasksettings
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct ITaskSettings extends IDispatch {
    /**
     * The interface identifier for ITaskSettings
     * @type {Guid}
     */
    static IID := Guid("{8fd4711d-2d02-4c8c-87e3-eff699de127e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITaskSettings interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_AllowDemandStart           : IntPtr
        put_AllowDemandStart           : IntPtr
        get_RestartInterval            : IntPtr
        put_RestartInterval            : IntPtr
        get_RestartCount               : IntPtr
        put_RestartCount               : IntPtr
        get_MultipleInstances          : IntPtr
        put_MultipleInstances          : IntPtr
        get_StopIfGoingOnBatteries     : IntPtr
        put_StopIfGoingOnBatteries     : IntPtr
        get_DisallowStartIfOnBatteries : IntPtr
        put_DisallowStartIfOnBatteries : IntPtr
        get_AllowHardTerminate         : IntPtr
        put_AllowHardTerminate         : IntPtr
        get_StartWhenAvailable         : IntPtr
        put_StartWhenAvailable         : IntPtr
        get_XmlText                    : IntPtr
        put_XmlText                    : IntPtr
        get_RunOnlyIfNetworkAvailable  : IntPtr
        put_RunOnlyIfNetworkAvailable  : IntPtr
        get_ExecutionTimeLimit         : IntPtr
        put_ExecutionTimeLimit         : IntPtr
        get_Enabled                    : IntPtr
        put_Enabled                    : IntPtr
        get_DeleteExpiredTaskAfter     : IntPtr
        put_DeleteExpiredTaskAfter     : IntPtr
        get_Priority                   : IntPtr
        put_Priority                   : IntPtr
        get_Compatibility              : IntPtr
        put_Compatibility              : IntPtr
        get_Hidden                     : IntPtr
        put_Hidden                     : IntPtr
        get_IdleSettings               : IntPtr
        put_IdleSettings               : IntPtr
        get_RunOnlyIfIdle              : IntPtr
        put_RunOnlyIfIdle              : IntPtr
        get_WakeToRun                  : IntPtr
        put_WakeToRun                  : IntPtr
        get_NetworkSettings            : IntPtr
        put_NetworkSettings            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITaskSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AllowDemandStart {
        get => this.get_AllowDemandStart()
        set => this.put_AllowDemandStart(value)
    }

    /**
     * @type {BSTR} 
     */
    RestartInterval {
        get => this.get_RestartInterval()
        set => this.put_RestartInterval(value)
    }

    /**
     * @type {Integer} 
     */
    RestartCount {
        get => this.get_RestartCount()
        set => this.put_RestartCount(value)
    }

    /**
     * @type {TASK_INSTANCES_POLICY} 
     */
    MultipleInstances {
        get => this.get_MultipleInstances()
        set => this.put_MultipleInstances(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    StopIfGoingOnBatteries {
        get => this.get_StopIfGoingOnBatteries()
        set => this.put_StopIfGoingOnBatteries(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DisallowStartIfOnBatteries {
        get => this.get_DisallowStartIfOnBatteries()
        set => this.put_DisallowStartIfOnBatteries(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AllowHardTerminate {
        get => this.get_AllowHardTerminate()
        set => this.put_AllowHardTerminate(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    StartWhenAvailable {
        get => this.get_StartWhenAvailable()
        set => this.put_StartWhenAvailable(value)
    }

    /**
     * @type {BSTR} 
     */
    XmlText {
        get => this.get_XmlText()
        set => this.put_XmlText(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    RunOnlyIfNetworkAvailable {
        get => this.get_RunOnlyIfNetworkAvailable()
        set => this.put_RunOnlyIfNetworkAvailable(value)
    }

    /**
     * @type {BSTR} 
     */
    ExecutionTimeLimit {
        get => this.get_ExecutionTimeLimit()
        set => this.put_ExecutionTimeLimit(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {BSTR} 
     */
    DeleteExpiredTaskAfter {
        get => this.get_DeleteExpiredTaskAfter()
        set => this.put_DeleteExpiredTaskAfter(value)
    }

    /**
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * @type {TASK_COMPATIBILITY} 
     */
    Compatibility {
        get => this.get_Compatibility()
        set => this.put_Compatibility(value)
    }

    /**
     * @type {VARIANT_BOOL} 
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
     * @type {VARIANT_BOOL} 
     */
    RunOnlyIfIdle {
        get => this.get_RunOnlyIfIdle()
        set => this.put_RunOnlyIfIdle(value)
    }

    /**
     * @type {VARIANT_BOOL} 
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
     * Gets or sets a Boolean value that indicates that the task can be started by using either the Run command or the Context menu. (Get)
     * @remarks
     * When this property is set to True, the task can be started independent of when any triggers start the task.
     * 
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-allowstartondemand-settingstype-element">AllowStartOnDemand</a> element of the Task Scheduler schema.
     * @param {Pointer<VARIANT_BOOL>} pAllowDemandStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_allowdemandstart
     */
    get_AllowDemandStart(pAllowDemandStart) {
        pAllowDemandStartMarshal := pAllowDemandStart is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, pAllowDemandStartMarshal, pAllowDemandStart, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task can be started by using either the Run command or the Context menu. (Put)
     * @remarks
     * When this property is set to True, the task can be started independent of when any triggers start the task.
     * 
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-allowstartondemand-settingstype-element">AllowStartOnDemand</a> element of the Task Scheduler schema.
     * @param {VARIANT_BOOL} allowDemandStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_allowdemandstart
     */
    put_AllowDemandStart(allowDemandStart) {
        result := ComCall(8, this, VARIANT_BOOL, allowDemandStart, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies how long the Task Scheduler will attempt to restart the task. (Get)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-interval-restarttype-element">Interval</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pRestartInterval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_restartinterval
     */
    get_RestartInterval(pRestartInterval) {
        result := ComCall(9, this, BSTR.Ptr, pRestartInterval, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies how long the Task Scheduler will attempt to restart the task. (Put)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-interval-restarttype-element">Interval</a> element of the Task Scheduler schema.
     * @param {BSTR} restartInterval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_restartinterval
     */
    put_RestartInterval(restartInterval) {
        restartInterval := restartInterval is String ? BSTR.Alloc(restartInterval).Value : restartInterval

        result := ComCall(10, this, BSTR, restartInterval, "HRESULT")
        return result
    }

    /**
     * Gets or sets the number of times that the Task Scheduler will attempt to restart the task. (Get)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-count-restarttype-element">Count</a> element of the Task Scheduler schema.
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
     * Gets or sets the number of times that the Task Scheduler will attempt to restart the task. (Put)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-count-restarttype-element">Count</a> element of the Task Scheduler schema.
     * @param {Integer} restartCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_restartcount
     */
    put_RestartCount(restartCount) {
        result := ComCall(12, this, "int", restartCount, "HRESULT")
        return result
    }

    /**
     * Gets or sets the policy that defines how the Task Scheduler deals with multiple instances of the task. (Get)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-multipleinstancespolicy-settingstype-element">MultipleInstancesPolicy</a> element of the Task Scheduler schema.
     * @param {Pointer<TASK_INSTANCES_POLICY>} pPolicy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_multipleinstances
     */
    get_MultipleInstances(pPolicy) {
        pPolicyMarshal := pPolicy is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pPolicyMarshal, pPolicy, "HRESULT")
        return result
    }

    /**
     * Gets or sets the policy that defines how the Task Scheduler deals with multiple instances of the task. (Put)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-multipleinstancespolicy-settingstype-element">MultipleInstancesPolicy</a> element of the Task Scheduler schema.
     * @param {TASK_INSTANCES_POLICY} policy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_multipleinstances
     */
    put_MultipleInstances(policy) {
        result := ComCall(14, this, TASK_INSTANCES_POLICY, policy, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task will be stopped if the computer is going onto batteries. (Get)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-stopifgoingonbatteries-settingstype-element">StopIfGoingOnBatteries</a> element of the Task Scheduler schema.
     * @param {Pointer<VARIANT_BOOL>} pStopIfOnBatteries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_stopifgoingonbatteries
     */
    get_StopIfGoingOnBatteries(pStopIfOnBatteries) {
        pStopIfOnBatteriesMarshal := pStopIfOnBatteries is VarRef ? "short*" : "ptr"

        result := ComCall(15, this, pStopIfOnBatteriesMarshal, pStopIfOnBatteries, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task will be stopped if the computer is going onto batteries. (Put)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-stopifgoingonbatteries-settingstype-element">StopIfGoingOnBatteries</a> element of the Task Scheduler schema.
     * @param {VARIANT_BOOL} stopIfOnBatteries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_stopifgoingonbatteries
     */
    put_StopIfGoingOnBatteries(stopIfOnBatteries) {
        result := ComCall(16, this, VARIANT_BOOL, stopIfOnBatteries, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task will not be started if the computer is running on batteries. (Get)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-disallowstartifonbatteries-settingstype-element">DisallowStartIfOnBatteries</a> element of the Task Scheduler schema.
     * @param {Pointer<VARIANT_BOOL>} pDisallowStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_disallowstartifonbatteries
     */
    get_DisallowStartIfOnBatteries(pDisallowStart) {
        pDisallowStartMarshal := pDisallowStart is VarRef ? "short*" : "ptr"

        result := ComCall(17, this, pDisallowStartMarshal, pDisallowStart, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task will not be started if the computer is running on batteries. (Put)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-disallowstartifonbatteries-settingstype-element">DisallowStartIfOnBatteries</a> element of the Task Scheduler schema.
     * @param {VARIANT_BOOL} disallowStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_disallowstartifonbatteries
     */
    put_DisallowStartIfOnBatteries(disallowStart) {
        result := ComCall(18, this, VARIANT_BOOL, disallowStart, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task may be terminated by the Task Scheduler service using TerminateProcess. (Get)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-allowhardterminate-settingstype-element">AllowHardTerminate</a> element of the Task Scheduler schema.
     * @param {Pointer<VARIANT_BOOL>} pAllowHardTerminate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_allowhardterminate
     */
    get_AllowHardTerminate(pAllowHardTerminate) {
        pAllowHardTerminateMarshal := pAllowHardTerminate is VarRef ? "short*" : "ptr"

        result := ComCall(19, this, pAllowHardTerminateMarshal, pAllowHardTerminate, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task may be terminated by the Task Scheduler service using TerminateProcess. (Put)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-allowhardterminate-settingstype-element">AllowHardTerminate</a> element of the Task Scheduler schema.
     * @param {VARIANT_BOOL} allowHardTerminate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_allowhardterminate
     */
    put_AllowHardTerminate(allowHardTerminate) {
        result := ComCall(20, this, VARIANT_BOOL, allowHardTerminate, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler can start the task at any time after its scheduled time has passed. (Get)
     * @remarks
     * This property applies only to time-based tasks with an end boundary or time-based tasks that are set to repeat infinitely.
     * 
     * Tasks that are started after the scheduled time has passed (because of the <b>StartWhenAvailable</b> property being set to True) are queued in the Task Scheduler service's queue of tasks and they are started after a delay.  The default delay is 10 minutes.
     * 
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-startwhenavailable-settingstype-element">StartWhenAvailable</a> element of the Task Scheduler schema.
     * @param {Pointer<VARIANT_BOOL>} pStartWhenAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_startwhenavailable
     */
    get_StartWhenAvailable(pStartWhenAvailable) {
        pStartWhenAvailableMarshal := pStartWhenAvailable is VarRef ? "short*" : "ptr"

        result := ComCall(21, this, pStartWhenAvailableMarshal, pStartWhenAvailable, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler can start the task at any time after its scheduled time has passed. (Put)
     * @remarks
     * This property applies only to time-based tasks with an end boundary or time-based tasks that are set to repeat infinitely.
     * 
     * Tasks that are started after the scheduled time has passed (because of the <b>StartWhenAvailable</b> property being set to True) are queued in the Task Scheduler service's queue of tasks and they are started after a delay.  The default delay is 10 minutes.
     * 
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-startwhenavailable-settingstype-element">StartWhenAvailable</a> element of the Task Scheduler schema.
     * @param {VARIANT_BOOL} startWhenAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_startwhenavailable
     */
    put_StartWhenAvailable(startWhenAvailable) {
        result := ComCall(22, this, VARIANT_BOOL, startWhenAvailable, "HRESULT")
        return result
    }

    /**
     * Gets or sets an XML-formatted definition of the task settings. (Get)
     * @param {Pointer<BSTR>} pText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_xmltext
     */
    get_XmlText(pText) {
        result := ComCall(23, this, BSTR.Ptr, pText, "HRESULT")
        return result
    }

    /**
     * Gets or sets an XML-formatted definition of the task settings. (Put)
     * @param {BSTR} text 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_xmltext
     */
    put_XmlText(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(24, this, BSTR, text, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler will run the task only when a network is available. (Get)
     * @remarks
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-runonlyifnetworkavailable-settingstype-element">RunOnlyIfNetworkAvailable</a> element of the Task Scheduler schema.
     * @param {Pointer<VARIANT_BOOL>} pRunOnlyIfNetworkAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_runonlyifnetworkavailable
     */
    get_RunOnlyIfNetworkAvailable(pRunOnlyIfNetworkAvailable) {
        pRunOnlyIfNetworkAvailableMarshal := pRunOnlyIfNetworkAvailable is VarRef ? "short*" : "ptr"

        result := ComCall(25, this, pRunOnlyIfNetworkAvailableMarshal, pRunOnlyIfNetworkAvailable, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler will run the task only when a network is available. (Put)
     * @remarks
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-runonlyifnetworkavailable-settingstype-element">RunOnlyIfNetworkAvailable</a> element of the Task Scheduler schema.
     * @param {VARIANT_BOOL} runOnlyIfNetworkAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_runonlyifnetworkavailable
     */
    put_RunOnlyIfNetworkAvailable(runOnlyIfNetworkAvailable) {
        result := ComCall(26, this, VARIANT_BOOL, runOnlyIfNetworkAvailable, "HRESULT")
        return result
    }

    /**
     * Gets or sets the amount of time that is allowed to complete the task. (Get)
     * @remarks
     * The format for this string is PnYnMnDTnHnMnS, where nY is the number of years, nM is the number of months, nD is the number of days, 'T' is the date/time separator, nH is the number of hours, nM is the number of minutes, and nS is the number of seconds (for example, PT5M specifies 5 minutes and P1M4DT2H5M specifies one month, four days, two hours, and five minutes). A value of PT0S will enable the task to run indefinitely.
     * 
     * <div class="alert"><b>Note</b>  If a task is started on demand, the ExecutionTimeLimit setting is bypassed.  Therefore, a task that is started on demand will not be terminated if it exceeds the ExecutionTimeLimit.</div>
     * <div> </div>
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-executiontimelimit-settingstype-element">ExecutionTimeLimit</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pExecutionTimeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_executiontimelimit
     */
    get_ExecutionTimeLimit(pExecutionTimeLimit) {
        result := ComCall(27, this, BSTR.Ptr, pExecutionTimeLimit, "HRESULT")
        return result
    }

    /**
     * Gets or sets the amount of time that is allowed to complete the task. (Put)
     * @remarks
     * The format for this string is PnYnMnDTnHnMnS, where nY is the number of years, nM is the number of months, nD is the number of days, 'T' is the date/time separator, nH is the number of hours, nM is the number of minutes, and nS is the number of seconds (for example, PT5M specifies 5 minutes and P1M4DT2H5M specifies one month, four days, two hours, and five minutes). A value of PT0S will enable the task to run indefinitely.
     * 
     * <div class="alert"><b>Note</b>  If a task is started on demand, the ExecutionTimeLimit setting is bypassed.  Therefore, a task that is started on demand will not be terminated if it exceeds the ExecutionTimeLimit.</div>
     * <div> </div>
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-executiontimelimit-settingstype-element">ExecutionTimeLimit</a> element of the Task Scheduler schema.
     * @param {BSTR} executionTimeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_executiontimelimit
     */
    put_ExecutionTimeLimit(executionTimeLimit) {
        executionTimeLimit := executionTimeLimit is String ? BSTR.Alloc(executionTimeLimit).Value : executionTimeLimit

        result := ComCall(28, this, BSTR, executionTimeLimit, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task is enabled. The task can be performed only when this setting is True.
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-enabled-settingstype-element">Enabled (settingsType)</a> element of the Task Scheduler schema.
     * @param {Pointer<VARIANT_BOOL>} pEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_enabled
     */
    get_Enabled(pEnabled) {
        pEnabledMarshal := pEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(29, this, pEnabledMarshal, pEnabled, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies whether the InkCollector object collects pen input (in-air packets, cursor in range events, and so on). (Put)
     * @remarks
     * If an enabled object's window input rectangle (set in the constructor or with the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setwindowinputrectangle">SetWindowInputRectangle</a> method) of an enabled object overlaps the window input rectangle of another enabled object, the E_INK_OVERLAPPING_INPUT_RECT error is returned. Overlap can occur without an error as long as only one of the input rectangles is enabled at any known time.
     * 
     * While an object is not enabled, you receive no events.
     * 
     * When a container control has its <b>Enabled</b> property set to <b>FALSE</b>, all of its contained controls are disabled as well.
     * 
     * You cannot set the <b>Enabled</b> property to <b>FALSE</b> while the object is collecting ink (<a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_collectingink">CollectingInk</a> property is <b>TRUE</b>).
     * 
     * We recommend that you set <b>Enabled</b> set to <b>FALSE</b> when the application shuts down.
     * 
     * <div class="alert"><b>Note</b>  Setting this property within certain message handlers can result in the underlying function being re-entered, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: <b>WM_ACTIVATE</b>, <b>WM_ACTIVATEAPP</b>, <b>WM_NCACTIVATE</b>, <b>WM_PAINT</b>; <b>WM_SYSCOMMAND</b> if <i>wParam</i> is set to SC_HOTKEY or SC_TASKLIST; and <b>WM_SYSKEYDOWN</b> (when processing Alt-Tab or Alt-Esc key combinations). This is an issue with single-threaded apartment model applications.</div>
     * <div> </div>
     * This property must be set to <b>FALSE</b> before setting or calling specific properties and methods of the object. If you try to change the specified properties or methods, an error occurs. The following properties and methods cannot be set or called unless the <b>Enabled</b> property is first set to <b>FALSE</b>:
     * 
     * Properties
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_attachmode">AttachMode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_hwnd">hWnd</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_ink">Ink</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_marginx">MarginX</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_marginy">MarginY</a>
     * </li>
     * </ul>
     * Methods
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setalltabletsmode">SetAllTabletsMode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setsingletabletintegratedmode">SetSingleTabletIntegratedMode</a>
     * </li>
     * </ul>
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(30, this, VARIANT_BOOL, enabled, "HRESULT")
        return result
    }

    /**
     * Gets or sets the amount of time that the Task Scheduler will wait before deleting the task after it expires. (Get)
     * @remarks
     * A task expires after the end boundary has been exceeded for all triggers associated with the task. The end boundary for a trigger is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_endboundary">EndBoundary</a> property inherited by all trigger interfaces.
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-deleteexpiredtaskafter-settingstype-element">DeleteExpiredTaskAfter (settingsType)</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pExpirationDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_deleteexpiredtaskafter
     */
    get_DeleteExpiredTaskAfter(pExpirationDelay) {
        result := ComCall(31, this, BSTR.Ptr, pExpirationDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets the amount of time that the Task Scheduler will wait before deleting the task after it expires. (Put)
     * @remarks
     * A task expires after the end boundary has been exceeded for all triggers associated with the task. The end boundary for a trigger is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_endboundary">EndBoundary</a> property inherited by all trigger interfaces.
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-deleteexpiredtaskafter-settingstype-element">DeleteExpiredTaskAfter (settingsType)</a> element of the Task Scheduler schema.
     * @param {BSTR} expirationDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_deleteexpiredtaskafter
     */
    put_DeleteExpiredTaskAfter(expirationDelay) {
        expirationDelay := expirationDelay is String ? BSTR.Alloc(expirationDelay).Value : expirationDelay

        result := ComCall(32, this, BSTR, expirationDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets the priority level of the task. (Get)
     * @remarks
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
     * Gets or sets the priority level of the task. (Put)
     * @remarks
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
     * @param {Integer} _priority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_priority
     */
    put_Priority(_priority) {
        result := ComCall(34, this, "int", _priority, "HRESULT")
        return result
    }

    /**
     * Gets or sets an integer value that indicates which version of Task Scheduler a task is compatible with. (Get)
     * @remarks
     * Task compatibility, which is set through the <b>Compatibility</b> property, should only be set to TASK_COMPATIBILITY_V1 if a task needs to be accessed or modified from a  Windows XP, Windows Server 2003, or Windows 2000 computer. Otherwise, it is recommended that Task Scheduler 2.0 compatibility be used because the task will have more features.
     * 
     * Tasks compatible with the AT command can only have one time trigger.
     * 
     * Tasks compatible with Task Scheduler 1.0 can only have a time trigger, a logon trigger, or a boot trigger, and the task can only have an executable action.
     * 
     * For more information about task compatibility, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/what-s-new-in-task-scheduler">What's New in Task Scheduler</a> and <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/tasks">Tasks</a>.
     * @param {Pointer<TASK_COMPATIBILITY>} pCompatLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_compatibility
     */
    get_Compatibility(pCompatLevel) {
        pCompatLevelMarshal := pCompatLevel is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, pCompatLevelMarshal, pCompatLevel, "HRESULT")
        return result
    }

    /**
     * Gets or sets an integer value that indicates which version of Task Scheduler a task is compatible with. (Put)
     * @remarks
     * Task compatibility, which is set through the <b>Compatibility</b> property, should only be set to TASK_COMPATIBILITY_V1 if a task needs to be accessed or modified from a  Windows XP, Windows Server 2003, or Windows 2000 computer. Otherwise, it is recommended that Task Scheduler 2.0 compatibility be used because the task will have more features.
     * 
     * Tasks compatible with the AT command can only have one time trigger.
     * 
     * Tasks compatible with Task Scheduler 1.0 can only have a time trigger, a logon trigger, or a boot trigger, and the task can only have an executable action.
     * 
     * For more information about task compatibility, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/what-s-new-in-task-scheduler">What's New in Task Scheduler</a> and <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/tasks">Tasks</a>.
     * @param {TASK_COMPATIBILITY} compatLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_compatibility
     */
    put_Compatibility(compatLevel) {
        result := ComCall(36, this, TASK_COMPATIBILITY, compatLevel, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task will not be visible in the UI. (Get)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-hidden-settingstype-element">Hidden (settingsType)</a> element of the Task Scheduler schema.
     * @param {Pointer<VARIANT_BOOL>} pHidden 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_hidden
     */
    get_Hidden(pHidden) {
        pHiddenMarshal := pHidden is VarRef ? "short*" : "ptr"

        result := ComCall(37, this, pHiddenMarshal, pHidden, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task will not be visible in the UI. (Put)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-hidden-settingstype-element">Hidden (settingsType)</a> element of the Task Scheduler schema.
     * @param {VARIANT_BOOL} hidden 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_hidden
     */
    put_Hidden(hidden) {
        result := ComCall(38, this, VARIANT_BOOL, hidden, "HRESULT")
        return result
    }

    /**
     * Gets or sets the information that specifies how the Task Scheduler performs tasks when the computer is in an idle condition. (Get)
     * @remarks
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
     * @returns {IIdleSettings} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_idlesettings
     */
    get_IdleSettings() {
        result := ComCall(39, this, "ptr*", &ppIdleSettings := 0, "HRESULT")
        return IIdleSettings(ppIdleSettings)
    }

    /**
     * Gets or sets the information that specifies how the Task Scheduler performs tasks when the computer is in an idle condition. (Put)
     * @remarks
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
     * @param {IIdleSettings} pIdleSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_idlesettings
     */
    put_IdleSettings(pIdleSettings) {
        result := ComCall(40, this, "ptr", pIdleSettings, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler will run the task only if the computer is in an idle condition. (Get)
     * @remarks
     * When reading or writing  XML for a task, this setting is specified in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-runonlyifidle-settingstype-element">RunOnlyIfIdle</a> element of the Task Scheduler schema.
     * @param {Pointer<VARIANT_BOOL>} pRunOnlyIfIdle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_runonlyifidle
     */
    get_RunOnlyIfIdle(pRunOnlyIfIdle) {
        pRunOnlyIfIdleMarshal := pRunOnlyIfIdle is VarRef ? "short*" : "ptr"

        result := ComCall(41, this, pRunOnlyIfIdleMarshal, pRunOnlyIfIdle, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler will run the task only if the computer is in an idle condition. (Put)
     * @remarks
     * When reading or writing  XML for a task, this setting is specified in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-runonlyifidle-settingstype-element">RunOnlyIfIdle</a> element of the Task Scheduler schema.
     * @param {VARIANT_BOOL} runOnlyIfIdle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_runonlyifidle
     */
    put_RunOnlyIfIdle(runOnlyIfIdle) {
        result := ComCall(42, this, VARIANT_BOOL, runOnlyIfIdle, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler will wake the computer when it is time to run the task, and keep the computer awake until the task is completed. (Get)
     * @remarks
     * If a task has this property set to true, and is triggered when the computer is already awake, Task Scheduler will request the computer to stay awake until the task has completed running.
     * 
     * When the Task Scheduler service wakes the computer to run a task, the screen may remain off even though the computer is no longer in the sleep or hibernate mode. The screen will turn on when Windows Vista detects that a user has returned to use the computer.
     * 
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-waketorun-settingstype-element">WakeToRun</a> element of the Task Scheduler schema.
     * @param {Pointer<VARIANT_BOOL>} pWake 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_waketorun
     */
    get_WakeToRun(pWake) {
        pWakeMarshal := pWake is VarRef ? "short*" : "ptr"

        result := ComCall(43, this, pWakeMarshal, pWake, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler will wake the computer when it is time to run the task, and keep the computer awake until the task is completed. (Put)
     * @remarks
     * If a task has this property set to true, and is triggered when the computer is already awake, Task Scheduler will request the computer to stay awake until the task has completed running.
     * 
     * When the Task Scheduler service wakes the computer to run a task, the screen may remain off even though the computer is no longer in the sleep or hibernate mode. The screen will turn on when Windows Vista detects that a user has returned to use the computer.
     * 
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-waketorun-settingstype-element">WakeToRun</a> element of the Task Scheduler schema.
     * @param {VARIANT_BOOL} wake 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_waketorun
     */
    put_WakeToRun(wake) {
        result := ComCall(44, this, VARIANT_BOOL, wake, "HRESULT")
        return result
    }

    /**
     * Gets or sets the network settings object that contains a network profile identifier and name. (Get)
     * @returns {INetworkSettings} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-get_networksettings
     */
    get_NetworkSettings() {
        result := ComCall(45, this, "ptr*", &ppNetworkSettings := 0, "HRESULT")
        return INetworkSettings(ppNetworkSettings)
    }

    /**
     * Gets or sets the network settings object that contains a network profile identifier and name. (Put)
     * @param {INetworkSettings} pNetworkSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings-put_networksettings
     */
    put_NetworkSettings(pNetworkSettings) {
        result := ComCall(46, this, "ptr", pNetworkSettings, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITaskSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AllowDemandStart := CallbackCreate(GetMethod(implObj, "get_AllowDemandStart"), flags, 2)
        this.vtbl.put_AllowDemandStart := CallbackCreate(GetMethod(implObj, "put_AllowDemandStart"), flags, 2)
        this.vtbl.get_RestartInterval := CallbackCreate(GetMethod(implObj, "get_RestartInterval"), flags, 2)
        this.vtbl.put_RestartInterval := CallbackCreate(GetMethod(implObj, "put_RestartInterval"), flags, 2)
        this.vtbl.get_RestartCount := CallbackCreate(GetMethod(implObj, "get_RestartCount"), flags, 2)
        this.vtbl.put_RestartCount := CallbackCreate(GetMethod(implObj, "put_RestartCount"), flags, 2)
        this.vtbl.get_MultipleInstances := CallbackCreate(GetMethod(implObj, "get_MultipleInstances"), flags, 2)
        this.vtbl.put_MultipleInstances := CallbackCreate(GetMethod(implObj, "put_MultipleInstances"), flags, 2)
        this.vtbl.get_StopIfGoingOnBatteries := CallbackCreate(GetMethod(implObj, "get_StopIfGoingOnBatteries"), flags, 2)
        this.vtbl.put_StopIfGoingOnBatteries := CallbackCreate(GetMethod(implObj, "put_StopIfGoingOnBatteries"), flags, 2)
        this.vtbl.get_DisallowStartIfOnBatteries := CallbackCreate(GetMethod(implObj, "get_DisallowStartIfOnBatteries"), flags, 2)
        this.vtbl.put_DisallowStartIfOnBatteries := CallbackCreate(GetMethod(implObj, "put_DisallowStartIfOnBatteries"), flags, 2)
        this.vtbl.get_AllowHardTerminate := CallbackCreate(GetMethod(implObj, "get_AllowHardTerminate"), flags, 2)
        this.vtbl.put_AllowHardTerminate := CallbackCreate(GetMethod(implObj, "put_AllowHardTerminate"), flags, 2)
        this.vtbl.get_StartWhenAvailable := CallbackCreate(GetMethod(implObj, "get_StartWhenAvailable"), flags, 2)
        this.vtbl.put_StartWhenAvailable := CallbackCreate(GetMethod(implObj, "put_StartWhenAvailable"), flags, 2)
        this.vtbl.get_XmlText := CallbackCreate(GetMethod(implObj, "get_XmlText"), flags, 2)
        this.vtbl.put_XmlText := CallbackCreate(GetMethod(implObj, "put_XmlText"), flags, 2)
        this.vtbl.get_RunOnlyIfNetworkAvailable := CallbackCreate(GetMethod(implObj, "get_RunOnlyIfNetworkAvailable"), flags, 2)
        this.vtbl.put_RunOnlyIfNetworkAvailable := CallbackCreate(GetMethod(implObj, "put_RunOnlyIfNetworkAvailable"), flags, 2)
        this.vtbl.get_ExecutionTimeLimit := CallbackCreate(GetMethod(implObj, "get_ExecutionTimeLimit"), flags, 2)
        this.vtbl.put_ExecutionTimeLimit := CallbackCreate(GetMethod(implObj, "put_ExecutionTimeLimit"), flags, 2)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
        this.vtbl.put_Enabled := CallbackCreate(GetMethod(implObj, "put_Enabled"), flags, 2)
        this.vtbl.get_DeleteExpiredTaskAfter := CallbackCreate(GetMethod(implObj, "get_DeleteExpiredTaskAfter"), flags, 2)
        this.vtbl.put_DeleteExpiredTaskAfter := CallbackCreate(GetMethod(implObj, "put_DeleteExpiredTaskAfter"), flags, 2)
        this.vtbl.get_Priority := CallbackCreate(GetMethod(implObj, "get_Priority"), flags, 2)
        this.vtbl.put_Priority := CallbackCreate(GetMethod(implObj, "put_Priority"), flags, 2)
        this.vtbl.get_Compatibility := CallbackCreate(GetMethod(implObj, "get_Compatibility"), flags, 2)
        this.vtbl.put_Compatibility := CallbackCreate(GetMethod(implObj, "put_Compatibility"), flags, 2)
        this.vtbl.get_Hidden := CallbackCreate(GetMethod(implObj, "get_Hidden"), flags, 2)
        this.vtbl.put_Hidden := CallbackCreate(GetMethod(implObj, "put_Hidden"), flags, 2)
        this.vtbl.get_IdleSettings := CallbackCreate(GetMethod(implObj, "get_IdleSettings"), flags, 2)
        this.vtbl.put_IdleSettings := CallbackCreate(GetMethod(implObj, "put_IdleSettings"), flags, 2)
        this.vtbl.get_RunOnlyIfIdle := CallbackCreate(GetMethod(implObj, "get_RunOnlyIfIdle"), flags, 2)
        this.vtbl.put_RunOnlyIfIdle := CallbackCreate(GetMethod(implObj, "put_RunOnlyIfIdle"), flags, 2)
        this.vtbl.get_WakeToRun := CallbackCreate(GetMethod(implObj, "get_WakeToRun"), flags, 2)
        this.vtbl.put_WakeToRun := CallbackCreate(GetMethod(implObj, "put_WakeToRun"), flags, 2)
        this.vtbl.get_NetworkSettings := CallbackCreate(GetMethod(implObj, "get_NetworkSettings"), flags, 2)
        this.vtbl.put_NetworkSettings := CallbackCreate(GetMethod(implObj, "put_NetworkSettings"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AllowDemandStart)
        CallbackFree(this.vtbl.put_AllowDemandStart)
        CallbackFree(this.vtbl.get_RestartInterval)
        CallbackFree(this.vtbl.put_RestartInterval)
        CallbackFree(this.vtbl.get_RestartCount)
        CallbackFree(this.vtbl.put_RestartCount)
        CallbackFree(this.vtbl.get_MultipleInstances)
        CallbackFree(this.vtbl.put_MultipleInstances)
        CallbackFree(this.vtbl.get_StopIfGoingOnBatteries)
        CallbackFree(this.vtbl.put_StopIfGoingOnBatteries)
        CallbackFree(this.vtbl.get_DisallowStartIfOnBatteries)
        CallbackFree(this.vtbl.put_DisallowStartIfOnBatteries)
        CallbackFree(this.vtbl.get_AllowHardTerminate)
        CallbackFree(this.vtbl.put_AllowHardTerminate)
        CallbackFree(this.vtbl.get_StartWhenAvailable)
        CallbackFree(this.vtbl.put_StartWhenAvailable)
        CallbackFree(this.vtbl.get_XmlText)
        CallbackFree(this.vtbl.put_XmlText)
        CallbackFree(this.vtbl.get_RunOnlyIfNetworkAvailable)
        CallbackFree(this.vtbl.put_RunOnlyIfNetworkAvailable)
        CallbackFree(this.vtbl.get_ExecutionTimeLimit)
        CallbackFree(this.vtbl.put_ExecutionTimeLimit)
        CallbackFree(this.vtbl.get_Enabled)
        CallbackFree(this.vtbl.put_Enabled)
        CallbackFree(this.vtbl.get_DeleteExpiredTaskAfter)
        CallbackFree(this.vtbl.put_DeleteExpiredTaskAfter)
        CallbackFree(this.vtbl.get_Priority)
        CallbackFree(this.vtbl.put_Priority)
        CallbackFree(this.vtbl.get_Compatibility)
        CallbackFree(this.vtbl.put_Compatibility)
        CallbackFree(this.vtbl.get_Hidden)
        CallbackFree(this.vtbl.put_Hidden)
        CallbackFree(this.vtbl.get_IdleSettings)
        CallbackFree(this.vtbl.put_IdleSettings)
        CallbackFree(this.vtbl.get_RunOnlyIfIdle)
        CallbackFree(this.vtbl.put_RunOnlyIfIdle)
        CallbackFree(this.vtbl.get_WakeToRun)
        CallbackFree(this.vtbl.put_WakeToRun)
        CallbackFree(this.vtbl.get_NetworkSettings)
        CallbackFree(this.vtbl.put_NetworkSettings)
    }
}
