#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the settings that the Task Scheduler uses to perform task during Automatic maintenance.
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-imaintenancesettings
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IMaintenanceSettings extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMaintenanceSettings
     * @type {Guid}
     */
    static IID => Guid("{a6024fa8-9652-4adb-a6bf-5cfcd877a7ba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Period", "get_Period", "put_Deadline", "get_Deadline", "put_Exclusive", "get_Exclusive"]

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imaintenancesettings-put_period
     */
    put_Period(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(7, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} target 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imaintenancesettings-get_period
     */
    get_Period(target) {
        result := ComCall(8, this, "ptr", target, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imaintenancesettings-put_deadline
     */
    put_Deadline(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(9, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} target 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imaintenancesettings-get_deadline
     */
    get_Deadline(target) {
        result := ComCall(10, this, "ptr", target, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imaintenancesettings-put_exclusive
     */
    put_Exclusive(value) {
        result := ComCall(11, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} target 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imaintenancesettings-get_exclusive
     */
    get_Exclusive(target) {
        targetMarshal := target is VarRef ? "short*" : "ptr"

        result := ComCall(12, this, targetMarshal, target, "HRESULT")
        return result
    }
}
