#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class GPIOBUTTONS_BUTTON_TYPE extends Win32Enum{

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
