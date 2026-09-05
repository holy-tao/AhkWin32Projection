#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class DEVICE_INTERNAL_STATUS_DATA_REQUEST_TYPE extends Win32Enum {

    /**
     * Native name: DeviceInternalStatusDataRequestTypeUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Native name: DeviceCurrentInternalStatusDataHeader
     * @type {Integer (Int32)}
     */
    static CurrentInternalStatusDataHeader => 1

    /**
     * Native name: DeviceCurrentInternalStatusData
     * @type {Integer (Int32)}
     */
    static CurrentInternalStatusData => 2

    /**
     * Native name: DeviceSavedInternalStatusDataHeader
     * @type {Integer (Int32)}
     */
    static SavedInternalStatusDataHeader => 3

    /**
     * Native name: DeviceSavedInternalStatusData
     * @type {Integer (Int32)}
     */
    static SavedInternalStatusData => 4
}
