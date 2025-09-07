#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_PD_HEALTH_STATUS{

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceHealth_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceHealth_Unhealthy => 1

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceHealth_Warning => 2

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceHealth_Healthy => 3

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceHealth_Max => 4
}
