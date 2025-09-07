#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ZONE_SEND_ACTION{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZONE_SEND_CLOSE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZONE_SEND_FINISH => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZONE_SEND_OPEN => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZONE_SEND_RESET => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZONE_SEND_OFFLINE => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZONE_SEND_SET_ZONE_DESCRIPTOR => 16
}
