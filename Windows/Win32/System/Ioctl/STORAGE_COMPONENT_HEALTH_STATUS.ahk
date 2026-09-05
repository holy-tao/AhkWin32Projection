#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the health status of a storage component.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-storage_component_health_status
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_COMPONENT_HEALTH_STATUS extends Win32Enum {

    /**
     * Native name: HealthStatusUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: HealthStatusNormal
     * @type {Integer (Int32)}
     */
    static Normal => 1

    /**
     * Native name: HealthStatusThrottled
     * @type {Integer (Int32)}
     */
    static Throttled => 2

    /**
     * Native name: HealthStatusWarning
     * @type {Integer (Int32)}
     */
    static Warning => 3

    /**
     * Native name: HealthStatusDisabled
     * @type {Integer (Int32)}
     */
    static Disabled => 4

    /**
     * Native name: HealthStatusFailed
     * @type {Integer (Int32)}
     */
    static Failed => 5
}
