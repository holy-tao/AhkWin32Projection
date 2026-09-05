#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_ZONE_SEND_ACTION extends Win32Enum {

    /**
     * Native name: NVME_ZONE_SEND_CLOSE
     * @type {Integer (Int32)}
     */
    static CLOSE => 1

    /**
     * Native name: NVME_ZONE_SEND_FINISH
     * @type {Integer (Int32)}
     */
    static FINISH => 2

    /**
     * Native name: NVME_ZONE_SEND_OPEN
     * @type {Integer (Int32)}
     */
    static OPEN => 3

    /**
     * Native name: NVME_ZONE_SEND_RESET
     * @type {Integer (Int32)}
     */
    static RESET => 4

    /**
     * Native name: NVME_ZONE_SEND_OFFLINE
     * @type {Integer (Int32)}
     */
    static OFFLINE => 5

    /**
     * Native name: NVME_ZONE_SEND_SET_ZONE_DESCRIPTOR
     * @type {Integer (Int32)}
     */
    static SET_ZONE_DESCRIPTOR => 16
}
