#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_QUERY_TYPE extends Win32Enum {

    /**
     * Native name: ScmPhysicalDeviceQuery_Descriptor
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceQuery_Descriptor => 0

    /**
     * Native name: ScmPhysicalDeviceQuery_IsSupported
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceQuery_IsSupported => 1

    /**
     * Native name: ScmPhysicalDeviceQuery_Max
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceQuery_Max => 2
}
