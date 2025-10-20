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
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     */
    put_Period(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} target 
     * @returns {HRESULT} 
     */
    get_Period(target) {
        result := ComCall(8, this, "ptr", target, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     */
    put_Deadline(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} target 
     * @returns {HRESULT} 
     */
    get_Deadline(target) {
        result := ComCall(10, this, "ptr", target, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     */
    put_Exclusive(value) {
        result := ComCall(11, this, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} target 
     * @returns {HRESULT} 
     */
    get_Exclusive(target) {
        result := ComCall(12, this, "ptr", target, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
