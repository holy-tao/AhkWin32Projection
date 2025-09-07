#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that indicate which feature should be retrieved or configured by the **NVME_ADMIN_COMMAND_GET_FEATURES** and **NVME_ADMIN_COMMAND_SET_FEATURES** Admin commands.
 * @remarks
 * In the **NVME_ADMIN_COMMAND_GET_FEATURES** and **NVME_ADMIN_COMMAND_SET_FEATURES** Admin commands, the feature is specified in the Feature Identifier (**FID**) member of the [NVME_CDW10_GET_FEATURES](ns-nvme-nvme_cdw10_get_features.md) and [NVME_CDW10_SET_FEATURES](ns-nvme-nvme_cdw10_set_features.md) structures.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_features
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_FEATURES{

    /**
     * The Arbitration feature that controls command processing by defining the number of commands from a certain priority that may be executed.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_ARBITRATION => 1

    /**
     * The Power Management feature that allows the host to configure the power state.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_POWER_MANAGEMENT => 2

    /**
     * The Logical Block Addressing (LBA) Range Type feature that indicates the type and attributes of LBA ranges that are part of the specified namespace.
 * 
 * The LBA range information is used by a driver to determine if it can utilize a particular LBA range. The information is not exposed to higher level software.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_LBA_RANGE_TYPE => 3

    /**
     * The Temperature Threshold feature that maintains an over-temperature threshold or an under-temperature threshold for the nine temperature sensors.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_TEMPERATURE_THRESHOLD => 4

    /**
     * The Error Recovery feature that controls the error recovery attributes.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_ERROR_RECOVERY => 5

    /**
     * The Volatile Write Cache feature that controls whether the volatile write cache is enabled.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_VOLATILE_WRITE_CACHE => 6

    /**
     * The Number of Queues feature that maintains the number of queues that the host requests for this controller.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_NUMBER_OF_QUEUES => 7

    /**
     * The Interrupt Coalescing feature that configures the interrupt coalescing settings for the controller.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_INTERRUPT_COALESCING => 8

    /**
     * The Interrupt Vector Configuration feature that configures settings specific to a particular interrupt vector.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_INTERRUPT_VECTOR_CONFIG => 9

    /**
     * The Write Atomicity Normal feature that controls the operation of the Atomic Write Unit Normal (AWUN) and Namespace Atomic Write Unit Normal (NAWUN) parameters.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_WRITE_ATOMICITY => 10

    /**
     * The Asynchronous Event Configuration feature that controls the events that trigger an asynchronous event notification to the host.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_ASYNC_EVENT_CONFIG => 11

    /**
     * The Autonomous Power State Transition feature that configures the settings for autonomous power state transitions.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_AUTONOMOUS_POWER_STATE_TRANSITION => 12

    /**
     * The Host Memory Buffer feature that provides a mechanism for the host to allocate a portion of host memory for the controller to use exclusively.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_HOST_MEMORY_BUFFER => 13

    /**
     * The Timestamp feature.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_TIMESTAMP => 14

    /**
     * The Keep Alive feature.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_KEEP_ALIVE => 15

    /**
     * The Controlled Thermal Management feature.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_HOST_CONTROLLED_THERMAL_MANAGEMENT => 16

    /**
     * The Non-Operational Power State feature.
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
     * The Software Progress Marker feature that indicates the load count of pre-boot software and is persistent across power states.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_NVM_SOFTWARE_PROGRESS_MARKER => 128

    /**
     * The Host Identifier feature that allows the host to register a Host Identifier with the controller.
 * 
 * The Host Identifier is used by the controller to determine whether other controllers in the NVM Subsystem are associated with the same host and is only required to be initialized if reservations are supported.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_NVM_HOST_IDENTIFIER => 129

    /**
     * The Reservation Notification Mask feature that controls the masking of reservation notifications on a per namespace basis.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_NVM_RESERVATION_NOTIFICATION_MASK => 130

    /**
     * The Reservation Persistence feature that allows modification of the Persist Through Power Loss (PTPL) state.
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
    static NVME_FEATURE_PLP_HEALTH_MONITOR => 197
}
