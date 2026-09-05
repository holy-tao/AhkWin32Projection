#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 */
class DEVICE_POWER_STATE extends Win32Enum {

    /**
     * Native name: PowerDeviceUnspecified
     * @type {Integer (Int32)}
     */
    static DeviceUnspecified => 0

    /**
     * Native name: PowerDeviceD0
     * @type {Integer (Int32)}
     */
    static DeviceD0 => 1

    /**
     * Native name: PowerDeviceD1
     * @type {Integer (Int32)}
     */
    static DeviceD1 => 2

    /**
     * Native name: PowerDeviceD2
     * @type {Integer (Int32)}
     */
    static DeviceD2 => 3

    /**
     * Native name: PowerDeviceD3
     * @type {Integer (Int32)}
     */
    static DeviceD3 => 4

    /**
     * Native name: PowerDeviceMaximum
     * @type {Integer (Int32)}
     */
    static DeviceMaximum => 5
}
