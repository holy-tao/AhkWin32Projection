#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_HEALTH_STATUS extends Win32Enum {

    /**
     * Native name: ScmPhysicalDeviceHealth_Unknown
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceHealth_Unknown => 0

    /**
     * Native name: ScmPhysicalDeviceHealth_Unhealthy
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceHealth_Unhealthy => 1

    /**
     * Native name: ScmPhysicalDeviceHealth_Warning
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceHealth_Warning => 2

    /**
     * Native name: ScmPhysicalDeviceHealth_Healthy
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceHealth_Healthy => 3

    /**
     * Native name: ScmPhysicalDeviceHealth_Max
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceHealth_Max => 4
}
