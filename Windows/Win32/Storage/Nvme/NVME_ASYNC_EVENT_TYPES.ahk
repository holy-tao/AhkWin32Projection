#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that indicate an asynchronous event type.
 * @remarks
 * Use the Event type information values from this enumeration in [Dword 0](ns-nvme-nvme_command_dword0.md) of the Completion Queue entry for an Asynchronous Event Request command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_async_event_types
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ASYNC_EVENT_TYPES{

    /**
     * A general error that is not associated with a specific command. The status of this event is one of the values specified in the **NVME_ASYNC_EVENT_ERROR_STATUS_CODES** enumeration.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_EVENT_TYPE_ERROR_STATUS => 0

    /**
     * A SMART or Health status event. The status of this event is one of the values specified in the **NVME_ASYNC_EVENT_HEALTH_STATUS_CODES** enumeration.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_EVENT_TYPE_HEALTH_STATUS => 1

    /**
     * A Notice event. The status of this event is one of the values specified in the **NVME_ASYNC_EVENT_NOTICE_CODES** enumeration.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_EVENT_TYPE_NOTICE => 2

    /**
     * An I/O Command Set event. The status of this event is one of the values specified in the **NVME_ASYNC_EVENT_IO_COMMAND_SET_STATUS_CODES** enumeration.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_EVENT_TYPE_IO_COMMAND_SET_STATUS => 6

    /**
     * A vendor specific event. The status of this event is one of the values specified in the **NVME_ASYNC_EVENT_TYPE_VENDOR_SPECIFIC_CODES** enumeration.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_EVENT_TYPE_VENDOR_SPECIFIC => 7
}
