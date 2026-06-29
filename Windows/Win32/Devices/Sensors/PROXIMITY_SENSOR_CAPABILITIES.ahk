#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct PROXIMITY_SENSOR_CAPABILITIES {
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
    static Proximity_Sensor_Human_Presence_Capable => 1

    /**
     * @type {Integer (Int32)}
     */
    static Proximity_Sensor_Human_Engagement_Capable => 2

    /**
     * @type {Integer (Int32)}
     */
    static Proximity_Sensor_Human_Head_Azimuth_Capable => 4

    /**
     * @type {Integer (Int32)}
     */
    static Proximity_Sensor_Human_Head_Altitude_Capable => 8

    /**
     * @type {Integer (Int32)}
     */
    static Proximity_Sensor_Human_Head_Roll_Capable => 16

    /**
     * @type {Integer (Int32)}
     */
    static Proximity_Sensor_Human_Head_Pitch_Capable => 32

    /**
     * @type {Integer (Int32)}
     */
    static Proximity_Sensor_Human_Head_Yaw_Capable => 64

    /**
     * @type {Integer (Int32)}
     */
    static Proximity_Sensor_Human_Identification_Capable => 128

    /**
     * @type {Integer (Int32)}
     */
    static Proximity_Sensor_Multi_Person_Detection_Capable => 256

    /**
     * @type {Integer (Int32)}
     */
    static Proximity_Sensor_Supported_Capabilities => 511
}
