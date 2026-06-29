#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct SENSOR_CONNECTION_TYPES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static SensorConnectionType_Integrated => 0

    /**
     * @type {Integer (Int32)}
     */
    static SensorConnectionType_Attached => 1

    /**
     * @type {Integer (Int32)}
     */
    static SensorConnectionType_External => 2
}
