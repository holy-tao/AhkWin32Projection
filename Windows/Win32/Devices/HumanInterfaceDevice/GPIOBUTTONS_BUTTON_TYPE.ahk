#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct GPIOBUTTONS_BUTTON_TYPE {
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
    static GPIO_BUTTON_POWER => 0

    /**
     * @type {Integer (Int32)}
     */
    static GPIO_BUTTON_WINDOWS => 1

    /**
     * @type {Integer (Int32)}
     */
    static GPIO_BUTTON_VOLUME_UP => 2

    /**
     * @type {Integer (Int32)}
     */
    static GPIO_BUTTON_VOLUME_DOWN => 3

    /**
     * @type {Integer (Int32)}
     */
    static GPIO_BUTTON_ROTATION_LOCK => 4

    /**
     * @type {Integer (Int32)}
     */
    static GPIO_BUTTON_BACK => 5

    /**
     * @type {Integer (Int32)}
     */
    static GPIO_BUTTON_SEARCH => 6

    /**
     * @type {Integer (Int32)}
     */
    static GPIO_BUTTON_CAMERA_FOCUS => 7

    /**
     * @type {Integer (Int32)}
     */
    static GPIO_BUTTON_CAMERA_SHUTTER => 8

    /**
     * @type {Integer (Int32)}
     */
    static GPIO_BUTTON_RINGER_TOGGLE => 9

    /**
     * @type {Integer (Int32)}
     */
    static GPIO_BUTTON_HEADSET => 10

    /**
     * @type {Integer (Int32)}
     */
    static GPIO_BUTTON_HWKB_DEPLOY => 11

    /**
     * @type {Integer (Int32)}
     */
    static GPIO_BUTTON_CAMERA_LENS => 12

    /**
     * @type {Integer (Int32)}
     */
    static GPIO_BUTTON_OEM_CUSTOM => 13

    /**
     * @type {Integer (Int32)}
     */
    static GPIO_BUTTON_OEM_CUSTOM2 => 14

    /**
     * @type {Integer (Int32)}
     */
    static GPIO_BUTTON_OEM_CUSTOM3 => 15

    /**
     * @type {Integer (Int32)}
     */
    static GPIO_BUTTON_COUNT_MIN => 5

    /**
     * @type {Integer (Int32)}
     */
    static GPIO_BUTTON_COUNT => 16
}
