#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_OPERATIONAL_STATUS_REASON extends Win32Enum {

    /**
     * Native name: ScmPhysicalDeviceOpReason_Unknown
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_Unknown => 0

    /**
     * Native name: ScmPhysicalDeviceOpReason_Media
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_Media => 1

    /**
     * Native name: ScmPhysicalDeviceOpReason_ThresholdExceeded
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_ThresholdExceeded => 2

    /**
     * Native name: ScmPhysicalDeviceOpReason_LostData
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_LostData => 3

    /**
     * Native name: ScmPhysicalDeviceOpReason_EnergySource
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_EnergySource => 4

    /**
     * Native name: ScmPhysicalDeviceOpReason_Configuration
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_Configuration => 5

    /**
     * Native name: ScmPhysicalDeviceOpReason_DeviceController
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_DeviceController => 6

    /**
     * Native name: ScmPhysicalDeviceOpReason_MediaController
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_MediaController => 7

    /**
     * Native name: ScmPhysicalDeviceOpReason_Component
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_Component => 8

    /**
     * Native name: ScmPhysicalDeviceOpReason_BackgroundOperation
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_BackgroundOperation => 9

    /**
     * Native name: ScmPhysicalDeviceOpReason_InvalidFirmware
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_InvalidFirmware => 10

    /**
     * Native name: ScmPhysicalDeviceOpReason_HealthCheck
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_HealthCheck => 11

    /**
     * Native name: ScmPhysicalDeviceOpReason_LostDataPersistence
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_LostDataPersistence => 12

    /**
     * Native name: ScmPhysicalDeviceOpReason_DisabledByPlatform
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_DisabledByPlatform => 13

    /**
     * Native name: ScmPhysicalDeviceOpReason_PermanentError
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_PermanentError => 14

    /**
     * Native name: ScmPhysicalDeviceOpReason_LostWritePersistence
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_LostWritePersistence => 15

    /**
     * Native name: ScmPhysicalDeviceOpReason_FatalError
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_FatalError => 16

    /**
     * Native name: ScmPhysicalDeviceOpReason_DataPersistenceLossImminent
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_DataPersistenceLossImminent => 17

    /**
     * Native name: ScmPhysicalDeviceOpReason_WritePersistenceLossImminent
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_WritePersistenceLossImminent => 18

    /**
     * Native name: ScmPhysicalDeviceOpReason_MediaRemainingSpareBlock
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_MediaRemainingSpareBlock => 19

    /**
     * Native name: ScmPhysicalDeviceOpReason_PerformanceDegradation
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_PerformanceDegradation => 20

    /**
     * Native name: ScmPhysicalDeviceOpReason_ExcessiveTemperature
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_ExcessiveTemperature => 21

    /**
     * Native name: ScmPhysicalDeviceOpReason_InternalFailure
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_InternalFailure => 22

    /**
     * Native name: ScmPhysicalDeviceOpReason_Max
     * @type {Integer (Int32)}
     */
    static PhysicalDeviceOpReason_Max => 23
}
