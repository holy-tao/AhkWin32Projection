#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_log_pages
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_LOG_PAGES{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_SUPPORTED_LOG_PAGES => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_ERROR_INFO => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_HEALTH_INFO => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_FIRMWARE_SLOT_INFO => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_CHANGED_NAMESPACE_LIST => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_COMMAND_EFFECTS => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_DEVICE_SELF_TEST => 6

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_TELEMETRY_HOST_INITIATED => 7

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_TELEMETRY_CTLR_INITIATED => 8

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_ENDURANCE_GROUP_INFORMATION => 9

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_PREDICTABLE_LATENCY_NVM_SET => 10

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_PREDICTABLE_LATENCY_EVENT_AGGREGATE => 11

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_ASYMMETRIC_NAMESPACE_ACCESS => 12

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_PERSISTENT_EVENT_LOG => 13

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_LBA_STATUS_INFORMATION => 14

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_ENDURANCE_GROUP_EVENT_AGGREGATE => 15

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_MEDIA_UNIT_STATUS => 16

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_SUPPORTED_CAPACITY_CONFIGURATION_LIST => 17

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_FEATURE_IDENTIFIERS_SUPPORTED_AND_EFFECTS => 18

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_NVME_MI_COMMANDS_SUPPORTED_AND_EFFECTS => 19

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_COMMAND_AND_FEATURE_LOCKDOWN => 20

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_BOOT_PARTITON => 21

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_ROTATIONAL_MEDIA_INFORMATION => 22

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_DISCOVERY => 112

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_RESERVATION_NOTIFICATION => 128

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_SANITIZE_STATUS => 129

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_CHANGED_ZONE_LIST => 191
}
