#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMaintenanceSettings.ahk
#Include .\ITaskSettings.ahk

/**
 * Provides the extended settings that the Task Scheduler uses to run the task.
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-itasksettings3
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITaskSettings3 extends ITaskSettings{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITaskSettings3
     * @type {Guid}
     */
    static IID => Guid("{0ad9d0d7-0c7f-4ebb-9a5f-d1c648dca528}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 47

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisallowStartOnRemoteAppSession", "put_DisallowStartOnRemoteAppSession", "get_UseUnifiedSchedulingEngine", "put_UseUnifiedSchedulingEngine", "get_MaintenanceSettings", "put_MaintenanceSettings", "CreateMaintenanceSettings", "get_Volatile", "put_Volatile"]

    /**
     */
    DisallowStartOnRemoteAppSession {
        get => this.get_DisallowStartOnRemoteAppSession()
        set => this.put_DisallowStartOnRemoteAppSession(value)
    }

    /**
     */
    UseUnifiedSchedulingEngine {
        get => this.get_UseUnifiedSchedulingEngine()
        set => this.put_UseUnifiedSchedulingEngine(value)
    }

    /**
     * @type {IMaintenanceSettings} 
     */
    MaintenanceSettings {
        get => this.get_MaintenanceSettings()
        set => this.put_MaintenanceSettings(value)
    }

    /**
     */
    Volatile {
        get => this.get_Volatile()
        set => this.put_Volatile(value)
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pDisallowStart 
     * @returns {HRESULT} 
     */
    get_DisallowStartOnRemoteAppSession(pDisallowStart) {
        pDisallowStartMarshal := pDisallowStart is VarRef ? "short*" : "ptr"

        result := ComCall(47, this, pDisallowStartMarshal, pDisallowStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} disallowStart 
     * @returns {HRESULT} 
     */
    put_DisallowStartOnRemoteAppSession(disallowStart) {
        result := ComCall(48, this, "short", disallowStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pUseUnifiedEngine 
     * @returns {HRESULT} 
     */
    get_UseUnifiedSchedulingEngine(pUseUnifiedEngine) {
        pUseUnifiedEngineMarshal := pUseUnifiedEngine is VarRef ? "short*" : "ptr"

        result := ComCall(49, this, pUseUnifiedEngineMarshal, pUseUnifiedEngine, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} useUnifiedEngine 
     * @returns {HRESULT} 
     */
    put_UseUnifiedSchedulingEngine(useUnifiedEngine) {
        result := ComCall(50, this, "short", useUnifiedEngine, "HRESULT")
        return result
    }

    /**
     * Gets or sets a pointer to pointer to an IMaintenanceSettingsobject that Task scheduler uses to perform a task during Automatic maintenance.
     * @remarks
     * 
     * When battery saver is on, Windows Task Scheduler tasks are triggered only if the task is:
     * 
     * <ul>
     * <li>Not set to <b>Start the task only if the computer is idle...</b> (task doesn't use <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_idlesettings">IdleSettings</a>)</li>
     * <li>Not set to run during automatic maintenance (task doesn't use <b>MaintenanceSettings</b>)</li>
     * <li>Is set to <b>Run only when user is logged on</b> (task <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_logontype">LogonType</a> is <b>TASK_LOGON_INTERACTIVE_TOKEN</b> or <b>TASK_LOGON_GROUP</b>)</li>
     * </ul>
     * All other triggers are delayed until battery saver is off. For more information about accessing battery saver status in your application, see <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-system_power_status">SYSTEM_POWER_STATUS</a>. For general information about battery saver, see <a href="https://docs.microsoft.com/windows-hardware/design/component-guidelines/battery-saver">battery saver (in the hardware component guidelines)</a>.
     * 
     * 
     * @returns {IMaintenanceSettings} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings3-get_maintenancesettings
     */
    get_MaintenanceSettings() {
        result := ComCall(51, this, "ptr*", &ppMaintenanceSettings := 0, "HRESULT")
        return IMaintenanceSettings(ppMaintenanceSettings)
    }

    /**
     * Gets or sets a pointer to pointer to an IMaintenanceSettingsobject that Task scheduler uses to perform a task during Automatic maintenance.
     * @remarks
     * 
     * When battery saver is on, Windows Task Scheduler tasks are triggered only if the task is:
     * 
     * <ul>
     * <li>Not set to <b>Start the task only if the computer is idle...</b> (task doesn't use <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_idlesettings">IdleSettings</a>)</li>
     * <li>Not set to run during automatic maintenance (task doesn't use <b>MaintenanceSettings</b>)</li>
     * <li>Is set to <b>Run only when user is logged on</b> (task <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_logontype">LogonType</a> is <b>TASK_LOGON_INTERACTIVE_TOKEN</b> or <b>TASK_LOGON_GROUP</b>)</li>
     * </ul>
     * All other triggers are delayed until battery saver is off. For more information about accessing battery saver status in your application, see <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-system_power_status">SYSTEM_POWER_STATUS</a>. For general information about battery saver, see <a href="https://docs.microsoft.com/windows-hardware/design/component-guidelines/battery-saver">battery saver (in the hardware component guidelines)</a>.
     * 
     * 
     * @param {IMaintenanceSettings} pMaintenanceSettings 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings3-put_maintenancesettings
     */
    put_MaintenanceSettings(pMaintenanceSettings) {
        result := ComCall(52, this, "ptr", pMaintenanceSettings, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMaintenanceSettings} 
     */
    CreateMaintenanceSettings() {
        result := ComCall(53, this, "ptr*", &ppMaintenanceSettings := 0, "HRESULT")
        return IMaintenanceSettings(ppMaintenanceSettings)
    }

    /**
     * Gets or sets a boolean value that indicates whether the task is automatically disabled every time Windows starts.
     * @param {Pointer<VARIANT_BOOL>} pVolatile 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings3-get_volatile
     */
    get_Volatile(pVolatile) {
        pVolatileMarshal := pVolatile is VarRef ? "short*" : "ptr"

        result := ComCall(54, this, pVolatileMarshal, pVolatile, "HRESULT")
        return result
    }

    /**
     * Gets or sets a boolean value that indicates whether the task is automatically disabled every time Windows starts.
     * @param {VARIANT_BOOL} Volatile 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itasksettings3-put_volatile
     */
    put_Volatile(Volatile) {
        result := ComCall(55, this, "short", Volatile, "HRESULT")
        return result
    }
}
