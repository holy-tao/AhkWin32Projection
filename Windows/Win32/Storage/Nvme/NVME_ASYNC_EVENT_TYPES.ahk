#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_async_event_types
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ASYNC_EVENT_TYPES{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_EVENT_TYPE_ERROR_STATUS => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_EVENT_TYPE_HEALTH_STATUS => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_EVENT_TYPE_NOTICE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_EVENT_TYPE_IMMEDIATE => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_EVENT_TYPE_IO_COMMAND_SET_STATUS => 6

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_EVENT_TYPE_VENDOR_SPECIFIC => 7
}
