#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_PERSISTENT_EVENT_LOG_EVENT_TYPES extends Win32Enum {

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_RESERVED0
     * @type {Integer (Int32)}
     */
    static TYPE_RESERVED0 => 0

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_SMART_HEALTH_LOG_SNAPSHOT
     * @type {Integer (Int32)}
     */
    static TYPE_SMART_HEALTH_LOG_SNAPSHOT => 1

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_FIRMWARE_COMMIT
     * @type {Integer (Int32)}
     */
    static TYPE_FIRMWARE_COMMIT => 2

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_TIMESTAMP_CHANGE
     * @type {Integer (Int32)}
     */
    static TYPE_TIMESTAMP_CHANGE => 3

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_POWER_ON_OR_RESET
     * @type {Integer (Int32)}
     */
    static TYPE_POWER_ON_OR_RESET => 4

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_NVM_SUBSYSTEM_HARDWARE_ERROR
     * @type {Integer (Int32)}
     */
    static TYPE_NVM_SUBSYSTEM_HARDWARE_ERROR => 5

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_CHANGE_NAMESPACE
     * @type {Integer (Int32)}
     */
    static TYPE_CHANGE_NAMESPACE => 6

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_FORMAT_NVM_START
     * @type {Integer (Int32)}
     */
    static TYPE_FORMAT_NVM_START => 7

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_FORMAT_NVM_COMPLETION
     * @type {Integer (Int32)}
     */
    static TYPE_FORMAT_NVM_COMPLETION => 8

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_SANITIZE_START
     * @type {Integer (Int32)}
     */
    static TYPE_SANITIZE_START => 9

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_SANITIZE_COMPLETION
     * @type {Integer (Int32)}
     */
    static TYPE_SANITIZE_COMPLETION => 10

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_SET_FEATURE
     * @type {Integer (Int32)}
     */
    static TYPE_SET_FEATURE => 11

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_TELEMETRY_LOG_CREATED
     * @type {Integer (Int32)}
     */
    static TYPE_TELEMETRY_LOG_CREATED => 12

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_THERMAL_EXCURSION
     * @type {Integer (Int32)}
     */
    static TYPE_THERMAL_EXCURSION => 13

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_RESERVED1_BEGIN
     * @type {Integer (Int32)}
     */
    static TYPE_RESERVED1_BEGIN => 14

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_RESERVED1_END
     * @type {Integer (Int32)}
     */
    static TYPE_RESERVED1_END => 221

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_VENDOR_SPECIFIC_EVENT
     * @type {Integer (Int32)}
     */
    static TYPE_VENDOR_SPECIFIC_EVENT => 222

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_TCG_DEFINED
     * @type {Integer (Int32)}
     */
    static TYPE_TCG_DEFINED => 223

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_RESERVED2_BEGIN
     * @type {Integer (Int32)}
     */
    static TYPE_RESERVED2_BEGIN => 224

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_RESERVED2_END
     * @type {Integer (Int32)}
     */
    static TYPE_RESERVED2_END => 255

    /**
     * Native name: NVME_PERSISTENT_EVENT_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static TYPE_MAX => 255
}
