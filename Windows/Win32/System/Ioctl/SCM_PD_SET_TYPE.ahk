#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_SET_TYPE extends Win32Enum {

    /**
     * Native name: ScmPhysicalDeviceSet_Descriptor
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceSet_Descriptor => 0

    /**
     * Native name: ScmPhysicalDeviceSet_IsSupported
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceSet_IsSupported => 1

    /**
     * Native name: ScmPhysicalDeviceSet_Max
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceSet_Max => 2
}
