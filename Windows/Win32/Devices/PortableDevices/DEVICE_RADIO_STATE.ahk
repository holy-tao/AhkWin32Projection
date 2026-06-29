#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct DEVICE_RADIO_STATE {
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
    static DRS_RADIO_ON => 0

    /**
     * @type {Integer (Int32)}
     */
    static DRS_SW_RADIO_OFF => 1

    /**
     * @type {Integer (Int32)}
     */
    static DRS_HW_RADIO_OFF => 2

    /**
     * @type {Integer (Int32)}
     */
    static DRS_SW_HW_RADIO_OFF => 3

    /**
     * @type {Integer (Int32)}
     */
    static DRS_HW_RADIO_ON_UNCONTROLLABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DRS_RADIO_INVALID => 5

    /**
     * @type {Integer (Int32)}
     */
    static DRS_HW_RADIO_OFF_UNCONTROLLABLE => 6

    /**
     * @type {Integer (Int32)}
     */
    static DRS_RADIO_MAX => 6
}
