#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_DISK_OPERATIONAL_STATUS extends Win32Enum {

    /**
     * Native name: DiskOpStatusNone
     * @type {Integer (Int32)}
     */
    static OpStatusNone => 0

    /**
     * Native name: DiskOpStatusUnknown
     * @type {Integer (Int32)}
     */
    static OpStatusUnknown => 1

    /**
     * Native name: DiskOpStatusOk
     * @type {Integer (Int32)}
     */
    static OpStatusOk => 2

    /**
     * Native name: DiskOpStatusPredictingFailure
     * @type {Integer (Int32)}
     */
    static OpStatusPredictingFailure => 3

    /**
     * Native name: DiskOpStatusInService
     * @type {Integer (Int32)}
     */
    static OpStatusInService => 4

    /**
     * Native name: DiskOpStatusHardwareError
     * @type {Integer (Int32)}
     */
    static OpStatusHardwareError => 5

    /**
     * Native name: DiskOpStatusNotUsable
     * @type {Integer (Int32)}
     */
    static OpStatusNotUsable => 6

    /**
     * Native name: DiskOpStatusTransientError
     * @type {Integer (Int32)}
     */
    static OpStatusTransientError => 7

    /**
     * Native name: DiskOpStatusMissing
     * @type {Integer (Int32)}
     */
    static OpStatusMissing => 8
}
