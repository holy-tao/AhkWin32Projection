#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct DEVICE_POWER_STATE {
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
    static PowerDeviceUnspecified => 0

    /**
     * @type {Integer (Int32)}
     */
    static PowerDeviceD0 => 1

    /**
     * @type {Integer (Int32)}
     */
    static PowerDeviceD1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static PowerDeviceD2 => 3

    /**
     * @type {Integer (Int32)}
     */
    static PowerDeviceD3 => 4

    /**
     * @type {Integer (Int32)}
     */
    static PowerDeviceMaximum => 5
}
