#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_DISK_OPERATIONAL_STATUS{

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpStatusNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpStatusUnknown => 1

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpStatusOk => 2

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpStatusPredictingFailure => 3

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpStatusInService => 4

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpStatusHardwareError => 5

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpStatusNotUsable => 6

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpStatusTransientError => 7

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpStatusMissing => 8
}
