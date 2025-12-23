#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_RESERVATION_TYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_TYPE_RESERVED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_TYPE_WRITE_EXCLUSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_TYPE_EXCLUSIVE_ACCESS => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_TYPE_WRITE_EXCLUSIVE_REGISTRANTS_ONLY => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_TYPE_EXCLUSIVE_ACCESS_REGISTRANTS_ONLY => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_TYPE_WRITE_EXCLUSIVE_ALL_REGISTRANTS => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_TYPE_EXCLUSIVE_ACCESS_ALL_REGISTRANTS => 6
}
