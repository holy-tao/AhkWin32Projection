#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that indicate the type of reservation notification in a Reservation Notification log page.
 * @remarks
 * Use this enumeration to specify values in the **NVME_LOG_PAGE_RESERVATION_NOTIFICATION** field of the [NVME_LOG_PAGES](ne-nvme-nvme_log_pages.md) enumeration that is used in the [NVME_ADMIN_COMMAND_GET_LOG_PAGE](ne-nvme-nvme_admin_commands.md) Admin command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_reservation_notification_types
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_RESERVATION_NOTIFICATION_TYPES{

    /**
     * The log page is empty. The Get Log Page command was processed when no unread Reservation Notification log pages were available. All the fields of an empty log page have a value of zero.
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_NOTIFICATION_TYPE_EMPTY_LOG_PAGE => 0

    /**
     * The registration is preempted.
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_NOTIFICATION_TYPE_REGISTRATION_PREEMPTED => 1

    /**
     * The reservation is released.
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_NOTIFICATION_TYPE_REGISTRATION_RELEASED => 2

    /**
     * The reservation is preempted.
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_NOTIFICATION_TYPE_RESERVATION_PREEPMPTED => 3
}
