#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_features
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_FEATURES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_ARBITRATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_POWER_MANAGEMENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_LBA_RANGE_TYPE => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_TEMPERATURE_THRESHOLD => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_ERROR_RECOVERY => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_VOLATILE_WRITE_CACHE => 6

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_NUMBER_OF_QUEUES => 7

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_INTERRUPT_COALESCING => 8

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_INTERRUPT_VECTOR_CONFIG => 9

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_WRITE_ATOMICITY => 10

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_ASYNC_EVENT_CONFIG => 11

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_AUTONOMOUS_POWER_STATE_TRANSITION => 12

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_HOST_MEMORY_BUFFER => 13

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_TIMESTAMP => 14

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_KEEP_ALIVE => 15

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_HOST_CONTROLLED_THERMAL_MANAGEMENT => 16

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_NONOPERATIONAL_POWER_STATE => 17

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_READ_RECOVERY_LEVEL_CONFIG => 18

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_PREDICTABLE_LATENCY_MODE_CONFIG => 19

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_PREDICTABLE_LATENCY_MODE_WINDOW => 20

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_LBA_STATUS_INFORMATION_REPORT_INTERVAL => 21

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_HOST_BEHAVIOR_SUPPORT => 22

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_SANITIZE_CONFIG => 23

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_ENDURANCE_GROUP_EVENT_CONFIG => 24

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_IO_COMMAND_SET_PROFILE => 25

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_ENHANCED_CONTROLLER_METADATA => 125

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_CONTROLLER_METADATA => 126

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_NAMESPACE_METADATA => 127

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_NVM_SOFTWARE_PROGRESS_MARKER => 128

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_NVM_HOST_IDENTIFIER => 129

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_NVM_RESERVATION_NOTIFICATION_MASK => 130

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_NVM_RESERVATION_PERSISTANCE => 131

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_NVM_NAMESPACE_WRITE_PROTECTION_CONFIG => 132

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_ERROR_INJECTION => 192

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_CLEAR_FW_UPDATE_HISTORY => 193

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_READONLY_WRITETHROUGH_MODE => 194

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_CLEAR_PCIE_CORRECTABLE_ERROR_COUNTERS => 195

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_ENABLE_IEEE1667_SILO => 196

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_LATENCY_MONITOR => 197

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_PLP_HEALTH_CHECK_INTERVAL => 198

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_DSSD_POWER_STATE => 199
}
