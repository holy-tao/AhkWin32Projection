#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DEVICE_USAGE_NOTIFICATION_TYPE extends Win32Enum {

    /**
     * Native name: DeviceUsageTypeUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Native name: DeviceUsageTypePaging
     * @type {Integer (Int32)}
     */
    static Paging => 1

    /**
     * Native name: DeviceUsageTypeHibernation
     * @type {Integer (Int32)}
     */
    static Hibernation => 2

    /**
     * Native name: DeviceUsageTypeDumpFile
     * @type {Integer (Int32)}
     */
    static DumpFile => 3

    /**
     * Native name: DeviceUsageTypeBoot
     * @type {Integer (Int32)}
     */
    static Boot => 4

    /**
     * Native name: DeviceUsageTypePostDisplay
     * @type {Integer (Int32)}
     */
    static PostDisplay => 5

    /**
     * Native name: DeviceUsageTypeGuestAssigned
     * @type {Integer (Int32)}
     */
    static GuestAssigned => 6
}
