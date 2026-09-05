#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_STATUS_PATH_ERROR_CODES extends Win32Enum {

    /**
     * Native name: NVME_STATUS_INTERNAL_PATH_ERROR
     * @type {Integer (Int32)}
     */
    static INTERNAL_PATH_ERROR => 0

    /**
     * Native name: NVME_STATUS_ASYMMETRIC_ACCESS_PERSISTENT_LOSS
     * @type {Integer (Int32)}
     */
    static ASYMMETRIC_ACCESS_PERSISTENT_LOSS => 1

    /**
     * Native name: NVME_STATUS_ASYMMETRIC_ACCESS_INACCESSIBLE
     * @type {Integer (Int32)}
     */
    static ASYMMETRIC_ACCESS_INACCESSIBLE => 2

    /**
     * Native name: NVME_STATUS_ASYMMETRIC_ACCESS_TRANSITION
     * @type {Integer (Int32)}
     */
    static ASYMMETRIC_ACCESS_TRANSITION => 3

    /**
     * Native name: NVME_STATUS_CONTROLLER_PATHING_ERROR
     * @type {Integer (Int32)}
     */
    static CONTROLLER_PATHING_ERROR => 96

    /**
     * Native name: NVME_STATUS_HOST_PATHING_ERROR
     * @type {Integer (Int32)}
     */
    static HOST_PATHING_ERROR => 112

    /**
     * Native name: NVME_STATUS_COMMAND_ABORTED_BY_HOST
     * @type {Integer (Int32)}
     */
    static COMMAND_ABORTED_BY_HOST => 113
}
