#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class IDetectionConfigurationAvailabilityInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDetectionConfigurationAvailabilityInfo
     * @type {Guid}
     */
    static IID => Guid("{b5affeb0-40f0-5398-b838-91979c2c6208}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsEnabled", "get_HasSystemResourceAccess", "get_HasPermission", "get_HasLockScreenPermission"]

    /**
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * @type {Boolean} 
     */
    HasSystemResourceAccess {
        get => this.get_HasSystemResourceAccess()
    }

    /**
     * @type {Boolean} 
     */
    HasPermission {
        get => this.get_HasPermission()
    }

    /**
     * @type {Boolean} 
     */
    HasLockScreenPermission {
        get => this.get_HasLockScreenPermission()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasSystemResourceAccess() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasPermission() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasLockScreenPermission() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
