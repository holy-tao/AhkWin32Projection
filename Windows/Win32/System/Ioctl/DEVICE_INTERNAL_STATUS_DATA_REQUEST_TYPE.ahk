#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_INTERNAL_STATUS_DATA_REQUEST_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DeviceInternalStatusDataRequestTypeUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static DeviceCurrentInternalStatusDataHeader => 1

    /**
     * @type {Integer (Int32)}
     */
    static DeviceCurrentInternalStatusData => 2

    /**
     * @type {Integer (Int32)}
     */
    static DeviceSavedInternalStatusDataHeader => 3

    /**
     * @type {Integer (Int32)}
     */
    static DeviceSavedInternalStatusData => 4
}
