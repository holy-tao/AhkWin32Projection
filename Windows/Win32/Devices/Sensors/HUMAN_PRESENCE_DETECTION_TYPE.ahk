#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class HUMAN_PRESENCE_DETECTION_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static HumanPresenceDetectionType_Undefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static HumanPresenceDetectionType_VendorDefinedNonBiometric => 1

    /**
     * @type {Integer (Int32)}
     */
    static HumanPresenceDetectionType_VendorDefinedBiometric => 2

    /**
     * @type {Integer (Int32)}
     */
    static HumanPresenceDetectionType_FacialBiometric => 4

    /**
     * @type {Integer (Int32)}
     */
    static HumanPresenceDetectionType_AudioBiometric => 8

    /**
     * @type {Integer (Int32)}
     */
    static HumanPresenceDetectionType_Force_Dword => -1
}
