#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_MEDIA_REINITIALIZATION_STATUS extends Win32Enum {

    /**
     * Native name: ScmPhysicalDeviceReinit_Success
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceReinit_Success => 0

    /**
     * Native name: ScmPhysicalDeviceReinit_RebootNeeded
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceReinit_RebootNeeded => 1

    /**
     * Native name: ScmPhysicalDeviceReinit_ColdBootNeeded
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceReinit_ColdBootNeeded => 2

    /**
     * Native name: ScmPhysicalDeviceReinit_Max
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceReinit_Max => 3
}
