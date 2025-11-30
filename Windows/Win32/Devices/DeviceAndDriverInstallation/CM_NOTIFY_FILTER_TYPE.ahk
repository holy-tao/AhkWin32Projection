#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CM_NOTIFY_FILTER_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_FILTER_TYPE_DEVICEINTERFACE => 0

    /**
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_FILTER_TYPE_DEVICEHANDLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_FILTER_TYPE_DEVICEINSTANCE => 2

    /**
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_FILTER_TYPE_MAX => 3
}
