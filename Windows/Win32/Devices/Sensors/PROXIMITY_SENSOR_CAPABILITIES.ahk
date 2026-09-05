#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
class PROXIMITY_SENSOR_CAPABILITIES extends Win32Enum {

    /**
     * Native name: Proximity_Sensor_Human_Presence_Capable
     * @type {Integer (Int32)}
     */
    static Human_Presence_Capable => 1

    /**
     * Native name: Proximity_Sensor_Human_Engagement_Capable
     * @type {Integer (Int32)}
     */
    static Human_Engagement_Capable => 2

    /**
     * Native name: Proximity_Sensor_Human_Head_Azimuth_Capable
     * @type {Integer (Int32)}
     */
    static Human_Head_Azimuth_Capable => 4

    /**
     * Native name: Proximity_Sensor_Human_Head_Altitude_Capable
     * @type {Integer (Int32)}
     */
    static Human_Head_Altitude_Capable => 8

    /**
     * Native name: Proximity_Sensor_Human_Head_Roll_Capable
     * @type {Integer (Int32)}
     */
    static Human_Head_Roll_Capable => 16

    /**
     * Native name: Proximity_Sensor_Human_Head_Pitch_Capable
     * @type {Integer (Int32)}
     */
    static Human_Head_Pitch_Capable => 32

    /**
     * Native name: Proximity_Sensor_Human_Head_Yaw_Capable
     * @type {Integer (Int32)}
     */
    static Human_Head_Yaw_Capable => 64

    /**
     * Native name: Proximity_Sensor_Human_Identification_Capable
     * @type {Integer (Int32)}
     */
    static Human_Identification_Capable => 128

    /**
     * Native name: Proximity_Sensor_Multi_Person_Detection_Capable
     * @type {Integer (Int32)}
     */
    static Multi_Person_Detection_Capable => 256

    /**
     * Native name: Proximity_Sensor_Supported_Capabilities
     * @type {Integer (Int32)}
     */
    static Supported_Capabilities => 511
}
