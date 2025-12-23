#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_INTERNAL_STATUS_DATA_SET extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DeviceStatusDataSetUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static DeviceStatusDataSet1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DeviceStatusDataSet2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DeviceStatusDataSet3 => 3

    /**
     * @type {Integer (Int32)}
     */
    static DeviceStatusDataSet4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static DeviceStatusDataSetMax => 5
}
