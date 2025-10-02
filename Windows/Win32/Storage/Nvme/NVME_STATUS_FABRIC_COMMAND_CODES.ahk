#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_STATUS_FABRIC_COMMAND_CODES{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INCOMPATIBLE_FORMAT => 128

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_CONTROLLER_BUSY => 129

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_CONNECT_INVALID_PARAMETERS => 130

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_CONNECT_RESTART_DISCOVERY => 131

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_CONNECT_INVALID_HOST => 132

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INVALID_QUEUE_TYPE => 133

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_DISCOVER_RESTART => 144

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_AUTHENTICATION_REQUIRED => 145
}
