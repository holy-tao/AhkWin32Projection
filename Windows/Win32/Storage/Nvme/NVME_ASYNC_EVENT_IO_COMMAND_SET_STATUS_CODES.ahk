#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate an I/O Command Set event type.
 * @remarks
 * Values from this enumeration are used in the **NVME_ASYNC_EVENT_TYPE_IO_COMMAND_SET_STATUS** field of the [NVME_ASYNC_EVENT_TYPES](ne-nvme-nvme_async_event_types.md) enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_async_event_io_command_set_status_codes
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ASYNC_EVENT_IO_COMMAND_SET_STATUS_CODES extends Win32Enum{

    /**
     * One or more [Reservation Notification log](ns-nvme-nvme_reservation_notification_log.md) pages are available.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_IO_CMD_SET_RESERVATION_LOG_PAGE_AVAILABLE => 0

    /**
     * A sanitize operation has completed without unexpected deallocation of all LBAs.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_IO_CMD_SANITIZE_OPERATION_COMPLETED => 1

    /**
     * A sanitize operation has completed with unexpected deallocation of all LBAs and status is available in the Sanitize Status log page.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_IO_CMD_SANITIZE_OPERATION_COMPLETED_WITH_UNEXPECTED_DEALLOCATION => 2
}
