#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_reservation_notification_types
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_RESERVATION_NOTIFICATION_TYPES{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_NOTIFICATION_TYPE_EMPTY_LOG_PAGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_NOTIFICATION_TYPE_REGISTRATION_PREEMPTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_NOTIFICATION_TYPE_REGISTRATION_RELEASED => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_NOTIFICATION_TYPE_RESERVATION_PREEPMPTED => 3
}
