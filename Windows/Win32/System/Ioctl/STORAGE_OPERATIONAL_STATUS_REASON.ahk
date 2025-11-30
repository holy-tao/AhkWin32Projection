#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_OPERATIONAL_STATUS_REASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonScsiSenseCode => 1

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonMedia => 2

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonIo => 3

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonThresholdExceeded => 4

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonLostData => 5

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonEnergySource => 6

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonConfiguration => 7

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonDeviceController => 8

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonMediaController => 9

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonComponent => 10

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonNVDIMM_N => 11

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonBackgroundOperation => 12

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonInvalidFirmware => 13

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonHealthCheck => 14

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonLostDataPersistence => 15

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonDisabledByPlatform => 16

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonLostWritePersistence => 17

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonDataPersistenceLossImminent => 18

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonWritePersistenceLossImminent => 19

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpReasonMax => 20
}
