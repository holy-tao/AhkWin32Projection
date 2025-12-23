#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_STATUS_PATH_ERROR_CODES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_INTERNAL_PATH_ERROR => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ASYMMETRIC_ACCESS_PERSISTENT_LOSS => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ASYMMETRIC_ACCESS_INACCESSIBLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ASYMMETRIC_ACCESS_TRANSITION => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_CONTROLLER_PATHING_ERROR => 96

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_HOST_PATHING_ERROR => 112

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_ABORTED_BY_HOST => 113
}
