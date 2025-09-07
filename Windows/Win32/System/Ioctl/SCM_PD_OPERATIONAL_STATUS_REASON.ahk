#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_PD_OPERATIONAL_STATUS_REASON{

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_Media => 1

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_ThresholdExceeded => 2

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_LostData => 3

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_EnergySource => 4

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_Configuration => 5

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_DeviceController => 6

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_MediaController => 7

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_Component => 8

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_BackgroundOperation => 9

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_InvalidFirmware => 10

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_HealthCheck => 11

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_LostDataPersistence => 12

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_DisabledByPlatform => 13

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_PermanentError => 14

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_LostWritePersistence => 15

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_FatalError => 16

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_DataPersistenceLossImminent => 17

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_WritePersistenceLossImminent => 18

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_MediaRemainingSpareBlock => 19

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_PerformanceDegradation => 20

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_ExcessiveTemperature => 21

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_InternalFailure => 22

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpReason_Max => 23
}
