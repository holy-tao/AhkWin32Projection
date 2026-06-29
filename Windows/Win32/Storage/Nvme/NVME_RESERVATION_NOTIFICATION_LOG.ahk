#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains fields that specify the information in a Reservation Notification Log page.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_reservation_notification_log
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_RESERVATION_NOTIFICATION_LOG {
    #StructPack 8

    /**
     * A 64-bit incrementing Reservation Notification log page count, indicating a unique identifier for this notification.
     * 
     * The count starts at `0h` following a controller reset, is incremented with each unique log entry, and rolls over to zero when the maximum count is reached and a log page is created. A value of `0h` indicates an empty log entry.
     */
    LogPageCount : Int64

    /**
     * A [NVME_RESERVATION_NOTIFICATION_TYPES](ne-nvme-nvme_reservation_notification_types.md) value that indicates the Reservation Notification type described by this log page.
     */
    LogPageType : Int8

    /**
     * Indicates the number of additional available Reservation Notification log pages (for example, the number of unread log pages not counting this one).
     * 
     * If there are more than 255 additional available log pages, a value of `255` is returned. A value of zero indicates that there are no additional available log pages.
     */
    AvailableLogPageCount : Int8

    /**
     * A reserved field.
     */
    Reserved0 : Int8[2]

    /**
     * Indicates the namespace ID of the namespace associated with the Reservation Notification described by this log page.
     */
    NameSpaceId : UInt32

    /**
     * A reserved field.
     */
    Reserved1 : Int8[48]

}
