#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_MEDIA_REINITIALIZATION_STATUS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceReinit_Success => 0

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceReinit_RebootNeeded => 1

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceReinit_ColdBootNeeded => 2

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceReinit_Max => 3
}
