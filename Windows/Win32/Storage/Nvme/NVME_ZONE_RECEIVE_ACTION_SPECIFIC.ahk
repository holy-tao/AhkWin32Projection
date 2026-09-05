#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_ZONE_RECEIVE_ACTION_SPECIFIC extends Win32Enum {

    /**
     * Native name: NVME_ZRA_ALL_ZONES
     * @type {Integer (Int32)}
     */
    static ZRA_ALL_ZONES => 0

    /**
     * Native name: NVME_ZRA_EMPTY_STATE_ZONES
     * @type {Integer (Int32)}
     */
    static ZRA_EMPTY_STATE_ZONES => 1

    /**
     * Native name: NVME_ZRA_IO_STATE_ZONES
     * @type {Integer (Int32)}
     */
    static ZRA_IO_STATE_ZONES => 2

    /**
     * Native name: NVME_ZRA_EO_STATE_ZONES
     * @type {Integer (Int32)}
     */
    static ZRA_EO_STATE_ZONES => 3

    /**
     * Native name: NVME_ZRA_CLOSED_STATE_ZONES
     * @type {Integer (Int32)}
     */
    static ZRA_CLOSED_STATE_ZONES => 4

    /**
     * Native name: NVME_ZRA_FULL_STATE_ZONES
     * @type {Integer (Int32)}
     */
    static ZRA_FULL_STATE_ZONES => 5

    /**
     * Native name: NVME_ZRA_RO_STATE_ZONES
     * @type {Integer (Int32)}
     */
    static ZRA_RO_STATE_ZONES => 6

    /**
     * Native name: NVME_ZRA_OFFLINE_STATE_ZONES
     * @type {Integer (Int32)}
     */
    static ZRA_OFFLINE_STATE_ZONES => 7
}
