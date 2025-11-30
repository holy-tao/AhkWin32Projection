#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_async_event_error_status_codes
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ASYNC_EVENT_ERROR_STATUS_CODES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_ERROR_WRITE_TO_INVALID_DOORBELL_REGISTER => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_ERROR_INVALID_DOORBELL_WRITE_VALUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_ERROR_DIAG_FAILURE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_ERROR_PERSISTENT_INTERNAL_DEVICE_ERROR => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_ERROR_TRANSIENT_INTERNAL_DEVICE_ERROR => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_ERROR_FIRMWARE_IMAGE_LOAD_ERROR => 5
}
