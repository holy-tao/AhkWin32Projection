#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ASYNC_EVENT_IO_COMMAND_SET_STATUS_CODES{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_IO_CMD_SET_RESERVATION_LOG_PAGE_AVAILABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_IO_CMD_SANITIZE_OPERATION_COMPLETED => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_IO_CMD_SANITIZE_OPERATION_COMPLETED_WITH_UNEXPECTED_DEALLOCATION => 2
}
