#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class DEVICE_INTERNAL_STATUS_DATA_SET extends Win32Enum {

    /**
     * Native name: DeviceStatusDataSetUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Native name: DeviceStatusDataSet1
     * @type {Integer (Int32)}
     */
    static Set1 => 1

    /**
     * Native name: DeviceStatusDataSet2
     * @type {Integer (Int32)}
     */
    static Set2 => 2

    /**
     * Native name: DeviceStatusDataSet3
     * @type {Integer (Int32)}
     */
    static Set3 => 3

    /**
     * Native name: DeviceStatusDataSet4
     * @type {Integer (Int32)}
     */
    static Set4 => 4

    /**
     * Native name: DeviceStatusDataSetMax
     * @type {Integer (Int32)}
     */
    static Max => 5
}
