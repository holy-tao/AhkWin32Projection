#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DEVICE_USAGE_NOTIFICATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DeviceUsageTypeUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static DeviceUsageTypePaging => 1

    /**
     * @type {Integer (Int32)}
     */
    static DeviceUsageTypeHibernation => 2

    /**
     * @type {Integer (Int32)}
     */
    static DeviceUsageTypeDumpFile => 3

    /**
     * @type {Integer (Int32)}
     */
    static DeviceUsageTypeBoot => 4

    /**
     * @type {Integer (Int32)}
     */
    static DeviceUsageTypePostDisplay => 5

    /**
     * @type {Integer (Int32)}
     */
    static DeviceUsageTypeGuestAssigned => 6
}
