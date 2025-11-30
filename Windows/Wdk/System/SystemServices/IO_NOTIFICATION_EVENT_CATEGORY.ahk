#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IO_NOTIFICATION_EVENT_CATEGORY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EventCategoryReserved => 0

    /**
     * @type {Integer (Int32)}
     */
    static EventCategoryHardwareProfileChange => 1

    /**
     * @type {Integer (Int32)}
     */
    static EventCategoryDeviceInterfaceChange => 2

    /**
     * @type {Integer (Int32)}
     */
    static EventCategoryTargetDeviceChange => 3

    /**
     * @type {Integer (Int32)}
     */
    static EventCategoryKernelSoftRestart => 4
}
