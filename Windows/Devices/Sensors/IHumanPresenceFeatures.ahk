#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IHumanPresenceFeatures extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHumanPresenceFeatures
     * @type {Guid}
     */
    static IID => Guid("{bdb09fda-3244-557a-bd29-8b004f59f2cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SensorId", "get_SupportedWakeOrLockDistancesInMillimeters", "get_IsWakeOnApproachSupported", "get_IsLockOnLeaveSupported", "get_IsAttentionAwareDimmingSupported"]

    /**
     * @type {HSTRING} 
     */
    SensorId {
        get => this.get_SensorId()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedWakeOrLockDistancesInMillimeters {
        get => this.get_SupportedWakeOrLockDistancesInMillimeters()
    }

    /**
     * @type {Boolean} 
     */
    IsWakeOnApproachSupported {
        get => this.get_IsWakeOnApproachSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsLockOnLeaveSupported {
        get => this.get_IsLockOnLeaveSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsAttentionAwareDimmingSupported {
        get => this.get_IsAttentionAwareDimmingSupported()
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
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedWakeOrLockDistancesInMillimeters() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWakeOnApproachSupported() {
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
    get_IsLockOnLeaveSupported() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAttentionAwareDimmingSupported() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
