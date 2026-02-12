#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IHumanPresenceSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHumanPresenceSettings
     * @type {Guid}
     */
    static IID => Guid("{ef4daf5b-07b7-5eb6-86bb-b7ff49ce44fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SensorId", "put_SensorId", "get_IsWakeOnApproachEnabled", "put_IsWakeOnApproachEnabled", "get_WakeOnApproachDistanceInMillimeters", "put_WakeOnApproachDistanceInMillimeters", "get_IsLockOnLeaveEnabled", "put_IsLockOnLeaveEnabled", "get_LockOnLeaveDistanceInMillimeters", "put_LockOnLeaveDistanceInMillimeters", "get_LockOnLeaveTimeout", "put_LockOnLeaveTimeout", "get_IsAttentionAwareDimmingEnabled", "put_IsAttentionAwareDimmingEnabled"]

    /**
     * @type {HSTRING} 
     */
    SensorId {
        get => this.get_SensorId()
        set => this.put_SensorId(value)
    }

    /**
     * @type {Boolean} 
     */
    IsWakeOnApproachEnabled {
        get => this.get_IsWakeOnApproachEnabled()
        set => this.put_IsWakeOnApproachEnabled(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    WakeOnApproachDistanceInMillimeters {
        get => this.get_WakeOnApproachDistanceInMillimeters()
        set => this.put_WakeOnApproachDistanceInMillimeters(value)
    }

    /**
     * @type {Boolean} 
     */
    IsLockOnLeaveEnabled {
        get => this.get_IsLockOnLeaveEnabled()
        set => this.put_IsLockOnLeaveEnabled(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    LockOnLeaveDistanceInMillimeters {
        get => this.get_LockOnLeaveDistanceInMillimeters()
        set => this.put_LockOnLeaveDistanceInMillimeters(value)
    }

    /**
     * @type {TimeSpan} 
     */
    LockOnLeaveTimeout {
        get => this.get_LockOnLeaveTimeout()
        set => this.put_LockOnLeaveTimeout(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAttentionAwareDimmingEnabled {
        get => this.get_IsAttentionAwareDimmingEnabled()
        set => this.put_IsAttentionAwareDimmingEnabled(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SensorId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SensorId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWakeOnApproachEnabled() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_IsWakeOnApproachEnabled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_WakeOnApproachDistanceInMillimeters() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_WakeOnApproachDistanceInMillimeters(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLockOnLeaveEnabled() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_IsLockOnLeaveEnabled(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_LockOnLeaveDistanceInMillimeters() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_LockOnLeaveDistanceInMillimeters(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_LockOnLeaveTimeout() {
        value := TimeSpan()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_LockOnLeaveTimeout(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAttentionAwareDimmingEnabled() {
        result := ComCall(18, this, "int*", &value := 0, "int")
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
    put_IsAttentionAwareDimmingEnabled(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
