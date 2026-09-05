#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_OPERATIONAL_STATUS extends Win32Enum {

    /**
     * Native name: ScmPhysicalDeviceOpStatus_Unknown
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpStatus_Unknown => 0

    /**
     * Native name: ScmPhysicalDeviceOpStatus_Ok
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpStatus_Ok => 1

    /**
     * Native name: ScmPhysicalDeviceOpStatus_PredictingFailure
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpStatus_PredictingFailure => 2

    /**
     * Native name: ScmPhysicalDeviceOpStatus_InService
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpStatus_InService => 3

    /**
     * Native name: ScmPhysicalDeviceOpStatus_HardwareError
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpStatus_HardwareError => 4

    /**
     * Native name: ScmPhysicalDeviceOpStatus_NotUsable
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpStatus_NotUsable => 5

    /**
     * Native name: ScmPhysicalDeviceOpStatus_TransientError
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpStatus_TransientError => 6

    /**
     * Native name: ScmPhysicalDeviceOpStatus_Missing
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpStatus_Missing => 7

    /**
     * Native name: ScmPhysicalDeviceOpStatus_Max
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpStatus_Max => 8
}
