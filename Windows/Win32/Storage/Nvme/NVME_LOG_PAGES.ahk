#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that indicate the log pages that can be retrieved by the Get Log Page **NVME_ADMIN_COMMAND_GET_LOG_PAGE** Admin Command.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_log_pages
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_LOG_PAGES{

    /**
     * The Error Information log page that contains extended error information for a command that completed with an error or reported an error that is not specific to a particular command.
 * 
 * The information contained in the Error Information log page is defined in the [NVME_ERROR_INFO_LOG](ns-nvme-nvme_error_info_log.md) structure.
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_ERROR_INFO => 1

    /**
     * The SMART / Health Information log page that contains SMART and general health information.
 * 
 * The information contained in the SMART/Health Information log page is defined in the [NVME_HEALTH_INFO_LOG](ns-nvme-nvme_health_info_log.md) structure.
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_HEALTH_INFO => 2

    /**
     * The Firmware Slot Information log page that describes the firmware revision stored in each supported firmware slot.
 * 
 * The information contained in the Firmware Slot Information log page is defined in the [FIRMWARE_SLOT_INFO_LOG](ns-nvme-nvme_firmware_slot_info_log.md) structure.
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_FIRMWARE_SLOT_INFO => 3

    /**
     * The Changed Namespace List log page that describes namespaces in the controller that have changed [Identify Namespace](../nvme/ns-nvme-nvme_identify_namespace_data.md) information since the last time the log page was read.
 * 
 * The information contained in the Changed Namespace List log page is defined in the [CHANGED_NAMESPACE_LIST_LOG](ns-nvme-nvme_changed_namespace_list_log.md) structure.
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_CHANGED_NAMESPACE_LIST => 4

    /**
     * The Commands Supported and Effects log page that describes the commands that the controller supports and the effects of those commands on the state of the NVM subsystem.
 * 
 * The information contained in the Commands Supported and Effects log page is defined in the [NVME_COMMAND_EFFECTS_LOG](ns-nvme-nvme_command_effects_log.md) structure.
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_COMMAND_EFFECTS => 5

    /**
     * The Device Self-Test log page that describes the status, completion percentage, and results of a device self-test.
 * 
 * The information contained in the Device Self Test log page is defined in the [NVME_DEVICE_SELF_TEST_LOG](ns-nvme-nvme_device_self_test_log.md) structure.
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_DEVICE_SELF_TEST => 6

    /**
     * The Telemetry Host-Initiated log page that describes telemetry data from the host.
 * 
 * The information contained in the Telemetry Host-Initiated log page is defined in the [NVME_TELEMETRY_HOST_INITIATED_LOG](ns-nvme-nvme_device_self_test_log.md) structure.
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_TELEMETRY_HOST_INITIATED => 7

    /**
     * The Telemetry Controller-Initiated log page that describes telemetry data from the controller.
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_TELEMETRY_CTLR_INITIATED => 8

    /**
     * The Endurance Group Information log page that contains information about the amount of data being read from and written to an Endurance Group.
 * 
 * The information contained in the Endurance Group Information log page is defined in the [NVME_ENDURANCE_GROUP_LOG](ns-nvme-nvme_endurance_group_log.md) structure.
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
     * The Reservation Notification log page that is created whenever an unmasked reservation notification occurs on any namespace that may be accessed by the controller.
 * 
 * The information contained in the Reservation Notification log page is defined in the [NVME_RESERVATION_NOTIFICATION_LOG](ns-nvme-nvme_reservation_notification_log.md) structure.
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_RESERVATION_NOTIFICATION => 128

    /**
     * The Sanitize Status log page that is created whenever an unmasked reservation notification occurs on any namespace that may be accessed by the controller.
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_SANITIZE_STATUS => 129

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_CHANGED_ZONE_LIST => 191
}
