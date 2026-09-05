#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_RESERVATION_TYPES extends Win32Enum {

    /**
     * Native name: NVME_RESERVATION_TYPE_RESERVED
     * @type {Integer (Int32)}
     */
    static TYPE_RESERVED => 0

    /**
     * Native name: NVME_RESERVATION_TYPE_WRITE_EXCLUSIVE
     * @type {Integer (Int32)}
     */
    static TYPE_WRITE_EXCLUSIVE => 1

    /**
     * Native name: NVME_RESERVATION_TYPE_EXCLUSIVE_ACCESS
     * @type {Integer (Int32)}
     */
    static TYPE_EXCLUSIVE_ACCESS => 2

    /**
     * Native name: NVME_RESERVATION_TYPE_WRITE_EXCLUSIVE_REGISTRANTS_ONLY
     * @type {Integer (Int32)}
     */
    static TYPE_WRITE_EXCLUSIVE_REGISTRANTS_ONLY => 3

    /**
     * Native name: NVME_RESERVATION_TYPE_EXCLUSIVE_ACCESS_REGISTRANTS_ONLY
     * @type {Integer (Int32)}
     */
    static TYPE_EXCLUSIVE_ACCESS_REGISTRANTS_ONLY => 4

    /**
     * Native name: NVME_RESERVATION_TYPE_WRITE_EXCLUSIVE_ALL_REGISTRANTS
     * @type {Integer (Int32)}
     */
    static TYPE_WRITE_EXCLUSIVE_ALL_REGISTRANTS => 5

    /**
     * Native name: NVME_RESERVATION_TYPE_EXCLUSIVE_ACCESS_ALL_REGISTRANTS
     * @type {Integer (Int32)}
     */
    static TYPE_EXCLUSIVE_ACCESS_ALL_REGISTRANTS => 6
}
