#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMaintenanceSettings.ahk" { IMaintenanceSettings }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\ITaskSettings.ahk" { ITaskSettings }

/**
 * Provides the extended settings that the Task Scheduler uses to run the task. (ITaskSettings3)
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-itasksettings3
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct ITaskSettings3 extends ITaskSettings {
    /**
     * The interface identifier for ITaskSettings3
     * @type {Guid}
     */
    static IID := Guid("{0ad9d0d7-0c7f-4ebb-9a5f-d1c648dca528}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITaskSettings3 interfaces
    */
    struct Vtbl extends ITaskSettings.Vtbl {
        get_DisallowStartOnRemoteAppSession : IntPtr
        put_DisallowStartOnRemoteAppSession : IntPtr
        get_UseUnifiedSchedulingEngine      : IntPtr
        put_UseUnifiedSchedulingEngine      : IntPtr
        get_MaintenanceSettings             : IntPtr
        put_MaintenanceSettings             : IntPtr
        CreateMaintenanceSettings           : IntPtr
        get_Volatile                        : IntPtr
        put_Volatile                        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITaskSettings3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DisallowStartOnRemoteAppSession {
        get => this.get_DisallowStartOnRemoteAppSession()
        set => this.put_DisallowStartOnRemoteAppSession(value)
    }

    /**
     * @type {VARIANT_BOOL} 
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
     * @type {VARIANT_BOOL} 
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
        result := ComCall(48, this, VARIANT_BOOL, disallowStart, "HRESULT")
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
        result := ComCall(50, this, VARIANT_BOOL, useUnifiedEngine, "HRESULT")
        return result
    }

    /**
     * Gets or sets a pointer to pointer to an IMaintenanceSettingsobject that Task scheduler uses to perform a task during Automatic maintenance. (Get)
     * @remarks
     * When battery saver is on, Windows Task Scheduler tasks are triggered only if the task is:
     * 
     * <ul>
     * <li>Not set to <b>Start the task only if the computer is idle...</b> (task doesn't use <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_idlesettings">IdleSettings</a>)</li>
     * <li>Not set to run during automatic maintenance (task doesn't use <b>MaintenanceSettings</b>)</li>
     * <li>Is set to <b>Run only when user is logged on</b> (task <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_logontype">LogonType</a> is <b>TASK_LOGON_INTERACTIVE_TOKEN</b> or <b>TASK_LOGON_GROUP</b>)</li>
     * </ul>
     * All other triggers are delayed until battery saver is off. For more information about accessing battery saver status in your application, see <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-system_power_status">SYSTEM_POWER_STATUS</a>. For general information about battery saver, see <a href="https://docs.microsoft.com/windows-hardware/design/component-guidelines/battery-saver">battery saver (in the hardware component guidelines)</a>.
     * @returns {IMaintenanceSettings} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings3-get_maintenancesettings
     */
    get_MaintenanceSettings() {
        result := ComCall(51, this, "ptr*", &ppMaintenanceSettings := 0, "HRESULT")
        return IMaintenanceSettings(ppMaintenanceSettings)
    }

    /**
     * Gets or sets a pointer to pointer to an IMaintenanceSettingsobject that Task scheduler uses to perform a task during Automatic maintenance. (Put)
     * @remarks
     * When battery saver is on, Windows Task Scheduler tasks are triggered only if the task is:
     * 
     * <ul>
     * <li>Not set to <b>Start the task only if the computer is idle...</b> (task doesn't use <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_idlesettings">IdleSettings</a>)</li>
     * <li>Not set to run during automatic maintenance (task doesn't use <b>MaintenanceSettings</b>)</li>
     * <li>Is set to <b>Run only when user is logged on</b> (task <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_logontype">LogonType</a> is <b>TASK_LOGON_INTERACTIVE_TOKEN</b> or <b>TASK_LOGON_GROUP</b>)</li>
     * </ul>
     * All other triggers are delayed until battery saver is off. For more information about accessing battery saver status in your application, see <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-system_power_status">SYSTEM_POWER_STATUS</a>. For general information about battery saver, see <a href="https://docs.microsoft.com/windows-hardware/design/component-guidelines/battery-saver">battery saver (in the hardware component guidelines)</a>.
     * @param {IMaintenanceSettings} pMaintenanceSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings3-put_maintenancesettings
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
     * Gets or sets a boolean value that indicates whether the task is automatically disabled every time Windows starts. (Get)
     * @param {Pointer<VARIANT_BOOL>} pVolatile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings3-get_volatile
     */
    get_Volatile(pVolatile) {
        pVolatileMarshal := pVolatile is VarRef ? "short*" : "ptr"

        result := ComCall(54, this, pVolatileMarshal, pVolatile, "HRESULT")
        return result
    }

    /**
     * Gets or sets a boolean value that indicates whether the task is automatically disabled every time Windows starts. (Put)
     * @param {VARIANT_BOOL} Volatile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings3-put_volatile
     */
    put_Volatile(Volatile) {
        result := ComCall(55, this, VARIANT_BOOL, Volatile, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITaskSettings3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DisallowStartOnRemoteAppSession := CallbackCreate(GetMethod(implObj, "get_DisallowStartOnRemoteAppSession"), flags, 2)
        this.vtbl.put_DisallowStartOnRemoteAppSession := CallbackCreate(GetMethod(implObj, "put_DisallowStartOnRemoteAppSession"), flags, 2)
        this.vtbl.get_UseUnifiedSchedulingEngine := CallbackCreate(GetMethod(implObj, "get_UseUnifiedSchedulingEngine"), flags, 2)
        this.vtbl.put_UseUnifiedSchedulingEngine := CallbackCreate(GetMethod(implObj, "put_UseUnifiedSchedulingEngine"), flags, 2)
        this.vtbl.get_MaintenanceSettings := CallbackCreate(GetMethod(implObj, "get_MaintenanceSettings"), flags, 2)
        this.vtbl.put_MaintenanceSettings := CallbackCreate(GetMethod(implObj, "put_MaintenanceSettings"), flags, 2)
        this.vtbl.CreateMaintenanceSettings := CallbackCreate(GetMethod(implObj, "CreateMaintenanceSettings"), flags, 2)
        this.vtbl.get_Volatile := CallbackCreate(GetMethod(implObj, "get_Volatile"), flags, 2)
        this.vtbl.put_Volatile := CallbackCreate(GetMethod(implObj, "put_Volatile"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DisallowStartOnRemoteAppSession)
        CallbackFree(this.vtbl.put_DisallowStartOnRemoteAppSession)
        CallbackFree(this.vtbl.get_UseUnifiedSchedulingEngine)
        CallbackFree(this.vtbl.put_UseUnifiedSchedulingEngine)
        CallbackFree(this.vtbl.get_MaintenanceSettings)
        CallbackFree(this.vtbl.put_MaintenanceSettings)
        CallbackFree(this.vtbl.CreateMaintenanceSettings)
        CallbackFree(this.vtbl.get_Volatile)
        CallbackFree(this.vtbl.put_Volatile)
    }
}
