#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate a Notice event type.
 * @remarks
 * Use this enumeration to specify values in the **NVME_ASYNC_EVENT_TYPE_NOTICE** field of the [NVME_ASYNC_EVENT_TYPES](ne-nvme-nvme_async_event_types.md) enumeration that is used in the Async Event Request Admin command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_async_event_notice_codes
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ASYNC_EVENT_NOTICE_CODES extends Win32Enum{

    /**
     * The [Identify Namespace data structure](../nvme/ns-nvme-nvme_identify_namespace_data.md) for one or more namespaces has changed.
     * 
     * Host software may use this event as an indication that it should read the [Identify Namespace](../nvme/ns-nvme-nvme_identify_namespace_data.md) data structures for each namespace to determine what has changed.
     * 
     * A controller should not send this event when [Namespace Utilization (NUSE)](../nvme/ns-nvme-nvme_identify_namespace_data.md) has changed, as this is a frequent event that does not require action by the host. A controller should only send this event for changes to the [Format Progress Indicator (FPI)](../nvme/ns-nvme-nvme_identify_namespace_data.md) field when bits `6:0` of that field transition from a non-zero value to zero or from a zero value to a non-zero value.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_NOTICE_NAMESPACE_ATTRIBUTE_CHANGED => 0

    /**
     * The controller is starting a firmware activation process during which command processing is paused.
     * 
     * Host software may use the Processing Paused (PP) field of [NVME_CONTROLLER_STATUS](ns-nvme-nvme_controller_status.md) to determine when command processing has resumed. To clear this event, the host software reads the [Firmware Slot Information log page](ns-nvme-nvme_firmware_slot_info_log.md).
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_NOTICE_FIRMWARE_ACTIVATION_STARTING => 1

    /**
     * The controller has saved the controller internal state in the Telemetry Controller-Initiated log page and set the Telemetry Controller-Initiated Data Available field to 1h in that log page. To clear this event, the host issues a Get Log Page command with Retain Asynchronous Event bit cleared to ‘0’ for the Telemetry Controller-Initiated log.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_NOTICE_TELEMETRY_LOG_CHANGED => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_NOTICE_ASYMMETRIC_ACCESS_CHANGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_NOTICE_PREDICTABLE_LATENCY_EVENT_AGGREGATE_LOG_CHANGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_NOTICE_LBA_STATUS_INFORMATION_ALERT => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_NOTICE_ENDURANCE_GROUP_EVENT_AGGREGATE_LOG_CHANGE => 6

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_NOTICE_ZONE_DESCRIPTOR_CHANGED => 239

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_NOTICE_DISCOVERY_LOG_PAGE_CHANGED => 240
}
