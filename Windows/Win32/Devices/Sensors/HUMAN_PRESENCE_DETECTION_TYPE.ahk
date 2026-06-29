#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct HUMAN_PRESENCE_DETECTION_TYPE {
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
