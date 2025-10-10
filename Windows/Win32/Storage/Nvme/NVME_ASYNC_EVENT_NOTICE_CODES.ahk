#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ASYNC_EVENT_NOTICE_CODES{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_NOTICE_NAMESPACE_ATTRIBUTE_CHANGED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_NOTICE_FIRMWARE_ACTIVATION_STARTING => 1

    /**
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
