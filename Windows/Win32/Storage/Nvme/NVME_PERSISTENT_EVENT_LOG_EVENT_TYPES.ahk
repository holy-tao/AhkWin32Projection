#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_PERSISTENT_EVENT_LOG_EVENT_TYPES{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_RESERVED0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_SMART_HEALTH_LOG_SNAPSHOT => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_FIRMWARE_COMMIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_TIMESTAMP_CHANGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_POWER_ON_OR_RESET => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_NVM_SUBSYSTEM_HARDWARE_ERROR => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_CHANGE_NAMESPACE => 6

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_FORMAT_NVM_START => 7

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_FORMAT_NVM_COMPLETION => 8

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_SANITIZE_START => 9

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_SANITIZE_COMPLETION => 10

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_SET_FEATURE => 11

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_TELEMETRY_LOG_CREATED => 12

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_THERMAL_EXCURSION => 13

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_RESERVED1_BEGIN => 14

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_RESERVED1_END => 221

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_VENDOR_SPECIFIC_EVENT => 222

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_TCG_DEFINED => 223

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_RESERVED2_BEGIN => 224

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_RESERVED2_END => 255

    /**
     * @type {Integer (Int32)}
     */
    static NVME_PERSISTENT_EVENT_TYPE_MAX => 255
}
