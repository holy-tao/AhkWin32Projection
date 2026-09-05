#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class CM_NOTIFY_FILTER_TYPE extends Win32Enum {

    /**
     * Native name: CM_NOTIFY_FILTER_TYPE_DEVICEINTERFACE
     * @type {Integer (Int32)}
     */
    static DEVICEINTERFACE => 0

    /**
     * Native name: CM_NOTIFY_FILTER_TYPE_DEVICEHANDLE
     * @type {Integer (Int32)}
     */
    static DEVICEHANDLE => 1

    /**
     * Native name: CM_NOTIFY_FILTER_TYPE_DEVICEINSTANCE
     * @type {Integer (Int32)}
     */
    static DEVICEINSTANCE => 2

    /**
     * Native name: CM_NOTIFY_FILTER_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
