#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_PD_OPERATIONAL_STATUS{

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpStatus_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpStatus_Ok => 1

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpStatus_PredictingFailure => 2

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpStatus_InService => 3

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpStatus_HardwareError => 4

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpStatus_NotUsable => 5

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpStatus_TransientError => 6

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpStatus_Missing => 7

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpStatus_Max => 8
}
