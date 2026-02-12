#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WakeOnApproachOptions.ahk
#Include .\AdaptiveDimmingOptions.ahk
#Include .\LockOnLeaveOptions.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IHumanPresenceSettings2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHumanPresenceSettings2
     * @type {Guid}
     */
    static IID => Guid("{a26f705e-8696-5eb4-b9e1-26a508de1cd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsAdaptiveDimmingEnabled", "put_IsAdaptiveDimmingEnabled", "get_WakeOptions", "get_DimmingOptions", "get_LockOptions"]

    /**
     * @type {Boolean} 
     */
    IsAdaptiveDimmingEnabled {
        get => this.get_IsAdaptiveDimmingEnabled()
        set => this.put_IsAdaptiveDimmingEnabled(value)
    }

    /**
     * @type {WakeOnApproachOptions} 
     */
    WakeOptions {
        get => this.get_WakeOptions()
    }

    /**
     * @type {AdaptiveDimmingOptions} 
     */
    DimmingOptions {
        get => this.get_DimmingOptions()
    }

    /**
     * @type {LockOnLeaveOptions} 
     */
    LockOptions {
        get => this.get_LockOptions()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAdaptiveDimmingEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAdaptiveDimmingEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {WakeOnApproachOptions} 
     */
    get_WakeOptions() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WakeOnApproachOptions(value)
    }

    /**
     * 
     * @returns {AdaptiveDimmingOptions} 
     */
    get_DimmingOptions() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AdaptiveDimmingOptions(value)
    }

    /**
     * 
     * @returns {LockOnLeaveOptions} 
     */
    get_LockOptions() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LockOnLeaveOptions(value)
    }
}
