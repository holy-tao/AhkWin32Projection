#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_PD_SET_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceSet_Descriptor => 0

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceSet_IsSupported => 1

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceSet_Max => 2
}
