#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_PD_MEDIA_REINITIALIZATION_STATUS{

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
