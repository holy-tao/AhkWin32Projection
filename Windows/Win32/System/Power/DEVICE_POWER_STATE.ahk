#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 */
class DEVICE_POWER_STATE extends Win32Enum {

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
