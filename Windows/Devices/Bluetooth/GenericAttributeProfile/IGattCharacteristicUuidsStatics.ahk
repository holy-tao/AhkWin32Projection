#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattCharacteristicUuidsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattCharacteristicUuidsStatics
     * @type {Guid}
     */
    static IID => Guid("{58fa4586-b1de-470c-b7de-0d11ff44f4b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BatteryLevel", "get_BloodPressureFeature", "get_BloodPressureMeasurement", "get_BodySensorLocation", "get_CscFeature", "get_CscMeasurement", "get_GlucoseFeature", "get_GlucoseMeasurement", "get_GlucoseMeasurementContext", "get_HeartRateControlPoint", "get_HeartRateMeasurement", "get_IntermediateCuffPressure", "get_IntermediateTemperature", "get_MeasurementInterval", "get_RecordAccessControlPoint", "get_RscFeature", "get_RscMeasurement", "get_SCControlPoint", "get_SensorLocation", "get_TemperatureMeasurement", "get_TemperatureType"]

    /**
     * @type {Guid} 
     */
    BatteryLevel {
        get => this.get_BatteryLevel()
    }

    /**
     * @type {Guid} 
     */
    BloodPressureFeature {
        get => this.get_BloodPressureFeature()
    }

    /**
     * @type {Guid} 
     */
    BloodPressureMeasurement {
        get => this.get_BloodPressureMeasurement()
    }

    /**
     * @type {Guid} 
     */
    BodySensorLocation {
        get => this.get_BodySensorLocation()
    }

    /**
     * @type {Guid} 
     */
    CscFeature {
        get => this.get_CscFeature()
    }

    /**
     * @type {Guid} 
     */
    CscMeasurement {
        get => this.get_CscMeasurement()
    }

    /**
     * @type {Guid} 
     */
    GlucoseFeature {
        get => this.get_GlucoseFeature()
    }

    /**
     * @type {Guid} 
     */
    GlucoseMeasurement {
        get => this.get_GlucoseMeasurement()
    }

    /**
     * @type {Guid} 
     */
    GlucoseMeasurementContext {
        get => this.get_GlucoseMeasurementContext()
    }

    /**
     * @type {Guid} 
     */
    HeartRateControlPoint {
        get => this.get_HeartRateControlPoint()
    }

    /**
     * @type {Guid} 
     */
    HeartRateMeasurement {
        get => this.get_HeartRateMeasurement()
    }

    /**
     * @type {Guid} 
     */
    IntermediateCuffPressure {
        get => this.get_IntermediateCuffPressure()
    }

    /**
     * @type {Guid} 
     */
    IntermediateTemperature {
        get => this.get_IntermediateTemperature()
    }

    /**
     * @type {Guid} 
     */
    MeasurementInterval {
        get => this.get_MeasurementInterval()
    }

    /**
     * @type {Guid} 
     */
    RecordAccessControlPoint {
        get => this.get_RecordAccessControlPoint()
    }

    /**
     * @type {Guid} 
     */
    RscFeature {
        get => this.get_RscFeature()
    }

    /**
     * @type {Guid} 
     */
    RscMeasurement {
        get => this.get_RscMeasurement()
    }

    /**
     * @type {Guid} 
     */
    SCControlPoint {
        get => this.get_SCControlPoint()
    }

    /**
     * @type {Guid} 
     */
    SensorLocation {
        get => this.get_SensorLocation()
    }

    /**
     * @type {Guid} 
     */
    TemperatureMeasurement {
        get => this.get_TemperatureMeasurement()
    }

    /**
     * @type {Guid} 
     */
    TemperatureType {
        get => this.get_TemperatureType()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_BatteryLevel() {
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
    get_BloodPressureFeature() {
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
    get_BloodPressureMeasurement() {
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
    get_BodySensorLocation() {
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
    get_CscFeature() {
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
    get_CscMeasurement() {
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
    get_GlucoseFeature() {
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
    get_GlucoseMeasurement() {
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
    get_GlucoseMeasurementContext() {
        value := Guid()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_HeartRateControlPoint() {
        value := Guid()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_HeartRateMeasurement() {
        value := Guid()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_IntermediateCuffPressure() {
        value := Guid()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_IntermediateTemperature() {
        value := Guid()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_MeasurementInterval() {
        value := Guid()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_RecordAccessControlPoint() {
        value := Guid()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_RscFeature() {
        value := Guid()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_RscMeasurement() {
        value := Guid()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_SCControlPoint() {
        value := Guid()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_SensorLocation() {
        value := Guid()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TemperatureMeasurement() {
        value := Guid()
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TemperatureType() {
        value := Guid()
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
