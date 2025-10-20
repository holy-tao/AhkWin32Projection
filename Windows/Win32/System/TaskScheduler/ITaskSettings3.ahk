#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<VARIANT_BOOL>} pDisallowStart 
     * @returns {HRESULT} 
     */
    get_DisallowStartOnRemoteAppSession(pDisallowStart) {
        result := ComCall(47, this, "ptr", pDisallowStart, "HRESULT")
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
        result := ComCall(49, this, "ptr", pUseUnifiedEngine, "HRESULT")
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
     * 
     * @param {Pointer<IMaintenanceSettings>} ppMaintenanceSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings3-get_maintenancesettings
     */
    get_MaintenanceSettings(ppMaintenanceSettings) {
        result := ComCall(51, this, "ptr*", ppMaintenanceSettings, "HRESULT")
        return result
    }

    /**
     * 
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
     * @param {Pointer<IMaintenanceSettings>} ppMaintenanceSettings 
     * @returns {HRESULT} 
     */
    CreateMaintenanceSettings(ppMaintenanceSettings) {
        result := ComCall(53, this, "ptr*", ppMaintenanceSettings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVolatile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings3-get_volatile
     */
    get_Volatile(pVolatile) {
        result := ComCall(54, this, "ptr", pVolatile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Volatile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings3-put_volatile
     */
    put_Volatile(Volatile) {
        result := ComCall(55, this, "short", Volatile, "HRESULT")
        return result
    }
}
