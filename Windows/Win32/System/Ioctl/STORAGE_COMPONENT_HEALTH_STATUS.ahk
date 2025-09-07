#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the health status of a storage component.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-storage_component_health_status
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_COMPONENT_HEALTH_STATUS{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static HealthStatusUnknown => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static HealthStatusNormal => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static HealthStatusThrottled => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static HealthStatusWarning => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static HealthStatusDisabled => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static HealthStatusFailed => 5
}
