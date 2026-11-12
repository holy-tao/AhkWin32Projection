#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64, Arm64
 */
class WHV_NOTIFICATION_PORT_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static WHvNotificationPortTypeEvent => 2

    /**
     * @type {Integer (Int32)}
     */
    static WHvNotificationPortTypeDoorbell => 4
}
