#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IO_NOTIFICATION_EVENT_CATEGORY extends Win32Enum {

    /**
     * Native name: EventCategoryReserved
     * @type {Integer (Int32)}
     */
    static Reserved => 0

    /**
     * Native name: EventCategoryHardwareProfileChange
     * @type {Integer (Int32)}
     */
    static HardwareProfileChange => 1

    /**
     * Native name: EventCategoryDeviceInterfaceChange
     * @type {Integer (Int32)}
     */
    static DeviceInterfaceChange => 2

    /**
     * Native name: EventCategoryTargetDeviceChange
     * @type {Integer (Int32)}
     */
    static TargetDeviceChange => 3

    /**
     * Native name: EventCategoryKernelSoftRestart
     * @type {Integer (Int32)}
     */
    static KernelSoftRestart => 4
}
