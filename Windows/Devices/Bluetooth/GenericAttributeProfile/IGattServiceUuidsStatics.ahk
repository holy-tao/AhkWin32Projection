#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattServiceUuidsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattServiceUuidsStatics
     * @type {Guid}
     */
    static IID => Guid("{6dc57058-9aba-4417-b8f2-dce016d34ee2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Battery", "get_BloodPressure", "get_CyclingSpeedAndCadence", "get_GenericAccess", "get_GenericAttribute", "get_Glucose", "get_HealthThermometer", "get_HeartRate", "get_RunningSpeedAndCadence"]

    /**
     * @type {Guid} 
     */
    Battery {
        get => this.get_Battery()
    }

    /**
     * @type {Guid} 
     */
    BloodPressure {
        get => this.get_BloodPressure()
    }

    /**
     * @type {Guid} 
     */
    CyclingSpeedAndCadence {
        get => this.get_CyclingSpeedAndCadence()
    }

    /**
     * @type {Guid} 
     */
    GenericAccess {
        get => this.get_GenericAccess()
    }

    /**
     * @type {Guid} 
     */
    GenericAttribute {
        get => this.get_GenericAttribute()
    }

    /**
     * @type {Guid} 
     */
    Glucose {
        get => this.get_Glucose()
    }

    /**
     * @type {Guid} 
     */
    HealthThermometer {
        get => this.get_HealthThermometer()
    }

    /**
     * @type {Guid} 
     */
    HeartRate {
        get => this.get_HeartRate()
    }

    /**
     * @type {Guid} 
     */
    RunningSpeedAndCadence {
        get => this.get_RunningSpeedAndCadence()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Battery() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_BloodPressure() {
        value := Guid()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CyclingSpeedAndCadence() {
        value := Guid()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_GenericAccess() {
        value := Guid()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_GenericAttribute() {
        value := Guid()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Glucose() {
        value := Guid()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_HealthThermometer() {
        value := Guid()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_HeartRate() {
        value := Guid()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_RunningSpeedAndCadence() {
        value := Guid()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
