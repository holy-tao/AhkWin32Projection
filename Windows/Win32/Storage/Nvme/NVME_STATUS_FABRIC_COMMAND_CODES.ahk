#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_STATUS_FABRIC_COMMAND_CODES extends Win32Enum {

    /**
     * Native name: NVME_STATUS_INCOMPATIBLE_FORMAT
     * @type {Integer (Int32)}
     */
    static INCOMPATIBLE_FORMAT => 128

    /**
     * Native name: NVME_STATUS_CONTROLLER_BUSY
     * @type {Integer (Int32)}
     */
    static CONTROLLER_BUSY => 129

    /**
     * Native name: NVME_STATUS_CONNECT_INVALID_PARAMETERS
     * @type {Integer (Int32)}
     */
    static CONNECT_INVALID_PARAMETERS => 130

    /**
     * Native name: NVME_STATUS_CONNECT_RESTART_DISCOVERY
     * @type {Integer (Int32)}
     */
    static CONNECT_RESTART_DISCOVERY => 131

    /**
     * Native name: NVME_STATUS_CONNECT_INVALID_HOST
     * @type {Integer (Int32)}
     */
    static CONNECT_INVALID_HOST => 132

    /**
     * Native name: NVME_STATUS_INVALID_QUEUE_TYPE
     * @type {Integer (Int32)}
     */
    static INVALID_QUEUE_TYPE => 133

    /**
     * Native name: NVME_STATUS_DISCOVER_RESTART
     * @type {Integer (Int32)}
     */
    static DISCOVER_RESTART => 144

    /**
     * Native name: NVME_STATUS_AUTHENTICATION_REQUIRED
     * @type {Integer (Int32)}
     */
    static AUTHENTICATION_REQUIRED => 145
}
