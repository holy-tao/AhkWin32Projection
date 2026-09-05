#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
class HUMAN_PRESENCE_DETECTION_TYPE extends Win32Enum {

    /**
     * Native name: HumanPresenceDetectionType_Undefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Native name: HumanPresenceDetectionType_VendorDefinedNonBiometric
     * @type {Integer (Int32)}
     */
    static VendorDefinedNonBiometric => 1

    /**
     * Native name: HumanPresenceDetectionType_VendorDefinedBiometric
     * @type {Integer (Int32)}
     */
    static VendorDefinedBiometric => 2

    /**
     * Native name: HumanPresenceDetectionType_FacialBiometric
     * @type {Integer (Int32)}
     */
    static FacialBiometric => 4

    /**
     * Native name: HumanPresenceDetectionType_AudioBiometric
     * @type {Integer (Int32)}
     */
    static AudioBiometric => 8

    /**
     * Native name: HumanPresenceDetectionType_Force_Dword
     * @type {Integer (Int32)}
     */
    static Force_Dword => -1
}
