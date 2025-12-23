#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_CDW11_FEATURE_NUMBER_OF_QUEUES.ahk
#Include .\NVME_CDW11_FEATURE_INTERRUPT_COALESCING.ahk
#Include .\NVME_CDW11_FEATURE_INTERRUPT_VECTOR_CONFIG.ahk
#Include .\NVME_CDW11_FEATURE_LBA_RANGE_TYPE.ahk
#Include .\NVME_CDW11_FEATURE_ARBITRATION.ahk
#Include .\NVME_CDW11_FEATURE_VOLATILE_WRITE_CACHE.ahk
#Include .\NVME_CDW11_FEATURE_ASYNC_EVENT_CONFIG.ahk
#Include .\NVME_CDW11_FEATURE_POWER_MANAGEMENT.ahk
#Include .\NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION.ahk
#Include .\NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD.ahk
#Include .\NVME_CDW11_FEATURE_ERROR_RECOVERY.ahk
#Include .\NVME_CDW11_FEATURE_HOST_MEMORY_BUFFER.ahk
#Include .\NVME_CDW11_FEATURE_WRITE_ATOMICITY_NORMAL.ahk
#Include .\NVME_CDW11_FEATURE_NON_OPERATIONAL_POWER_STATE.ahk
#Include .\NVME_CDW11_FEATURE_IO_COMMAND_SET_PROFILE.ahk
#Include .\NVME_CDW0_FEATURE_ERROR_INJECTION.ahk
#Include .\NVME_CDW11_FEATURE_HOST_IDENTIFIER.ahk
#Include .\NVME_CDW11_FEATURE_RESERVATION_PERSISTENCE.ahk
#Include .\NVME_CDW11_FEATURE_RESERVATION_NOTIFICATION_MASK.ahk
#Include .\NVME_CDW11_FEATURE_GET_HOST_METADATA.ahk
#Include .\NVME_CDW11_FEATURE_SET_HOST_METADATA.ahk

/**
 * Contains parameters for the Get Features and Set Features commands that retrieve or set the attributes of the specified feature.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_features
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW11_FEATURES extends Win32Struct
{
    static sizeof => 160

    static packingSize => 4

    /**
     * Specifies an [NVME_CDW11_FEATURE_NUMBER_OF_QUEUES](ns-nvme-nvme_cdw11_feature_number_of_queues.md) structure containing values that indicates the number of queues that the host requests for this controller.
     * 
     * When a Set Features or Get Features command is submitted for the Number of Queues Feature, the **NVME_CDW11_FEATURE_NUMBER_OF_QUEUES** structure is returned in the Dword 0 (**DW0**) field of the [Completion Queue entry](ns-nvme-nvme_completion_entry.md) for that command.
     * @type {NVME_CDW11_FEATURE_NUMBER_OF_QUEUES}
     */
    NumberOfQueues{
        get {
            if(!this.HasProp("__NumberOfQueues"))
                this.__NumberOfQueues := NVME_CDW11_FEATURE_NUMBER_OF_QUEUES(0, this)
            return this.__NumberOfQueues
        }
    }

    /**
     * Specifies an [NVME_CDW11_FEATURE_INTERRUPT_COALESCING](ns-nvme-nvme_cdw11_feature_interrupt_coalescing.md) structure containing values that configure the interrupt coalescing settings.
     * 
     * When a Get Features command is submitted for the Interrupt Coalescing Feature, the values specified in the **TIME** and **THR** fields of the **NVME_CDW11_FEATURE_INTERRUPT_COALESCING** structure are returned in the **DW0** field of the [Completion Queue Entry](ns-nvme-nvme_completion_entry.md) for that command.
     * @type {NVME_CDW11_FEATURE_INTERRUPT_COALESCING}
     */
    InterruptCoalescing{
        get {
            if(!this.HasProp("__InterruptCoalescing"))
                this.__InterruptCoalescing := NVME_CDW11_FEATURE_INTERRUPT_COALESCING(0, this)
            return this.__InterruptCoalescing
        }
    }

    /**
     * Specifies an [NVME_CDW11_FEATURE_INTERRUPT_VECTOR_CONFIG](ns-nvme-nvme_cdw11_feature_interrupt_vector_config.md) structure containing values that configure settings specific to a particular interrupt vector.
     * 
     * When a Get Features command is submitted for the Interrupt Vector Configuration Feature, the values specified in the Interrupt Vector (**IV**) and Coalescing Disabled (**CD**) fields of the **NVME_CDW11_FEATURE_INTERRUPT_VECTOR_CONFIG** structure are returned in the **DW0** field of the [Completion Queue Entry](ns-nvme-nvme_completion_entry.md) for that command.
     * 
     * Prior to issuing this feature, the host should configure the specified Interrupt Vector with a valid I/O Completion Queue. If the I/O Completion Queue or Interrupt Vector specified is invalid, the controller will return a status of [NVME_STATUS_INVALID_FIELD_IN_COMMAND](ne-nvme-nvme_status_generic_command_codes.md).
     * @type {NVME_CDW11_FEATURE_INTERRUPT_VECTOR_CONFIG}
     */
    InterruptVectorConfig{
        get {
            if(!this.HasProp("__InterruptVectorConfig"))
                this.__InterruptVectorConfig := NVME_CDW11_FEATURE_INTERRUPT_VECTOR_CONFIG(0, this)
            return this.__InterruptVectorConfig
        }
    }

    /**
     * Specifies an [NVME_CDW11_FEATURE_LBA_RANGE_TYPE](ns-nvme-nvme_cdw11_feature_lba_range_type.md) structure containing a value that specifies the number of LBA ranges for the LBA Range Type Feature in the Set Features command.
     * 
     * This field is used for the Set Features command only and is ignored for the Get Features command.
     * 
     * The LBA Range Type feature specifies type and attributes of Logical Block Allocation (LBA) ranges that are part of the specified namespace. The feature uses the **NVME_CDW11_FEATURE_LBA_RANGE_TYPE** structure to specify the number of LBA ranges, and the [NVME_LBA_RANGET_TYPE_ENTRY](ns-nvme-nvme_lba_ranget_type_entry.md) data structure to specify the type and attribute information.
     * 
     * When a Get Features command is submitted for the LBA Range Type feature, the value specified in the **NUM** field of the **NVME_CDW11_FEATURE_LBA_RANGE_TYPE** structure is returned in the **DW0** field of the [Completion Queue entry](ns-nvme-nvme_completion_entry.md), and the LBA Range Type [NVME_LBA_RANGET_TYPE_ENTRY](ns-nvme-nvme_lba_ranget_type_entry.md) data structure is returned in the data buffer for that command.
     * @type {NVME_CDW11_FEATURE_LBA_RANGE_TYPE}
     */
    LbaRangeType{
        get {
            if(!this.HasProp("__LbaRangeType"))
                this.__LbaRangeType := NVME_CDW11_FEATURE_LBA_RANGE_TYPE(0, this)
            return this.__LbaRangeType
        }
    }

    /**
     * Specifies an [NVME_CDW11_FEATURE_ARBITRATION](ns-nvme-nvme_cdw11_feature_arbitration.md) structure containing values that control command arbitration.
     * 
     * When a Get Features command is submitted for the Arbitration feature, the structure specified in this field is returned in the **DW0** field of the [Completion Queue entry](ns-nvme-nvme_completion_entry.md) for that command.
     * @type {NVME_CDW11_FEATURE_ARBITRATION}
     */
    Arbitration{
        get {
            if(!this.HasProp("__Arbitration"))
                this.__Arbitration := NVME_CDW11_FEATURE_ARBITRATION(0, this)
            return this.__Arbitration
        }
    }

    /**
     * Specifies an [NVME_CDW11_FEATURE_VOLATILE_WRITE_CACHE](ns-nvme-nvme_cdw11_feature_volatile_write_cache.md) structure containing values that control the volatile write cache, if present, on the controller.
     * 
     * When a Get Features command is submitted for the Volatile Write Cache Feature, the value specified in the **WCE** field of the **NVME_CDW11_FEATURE_VOLATILE_WRITE_CACHE** is returned in the **DW0** field of the [Completion Queue Entry](ns-nvme-nvme_completion_entry.md) for that command.
     * @type {NVME_CDW11_FEATURE_VOLATILE_WRITE_CACHE}
     */
    VolatileWriteCache{
        get {
            if(!this.HasProp("__VolatileWriteCache"))
                this.__VolatileWriteCache := NVME_CDW11_FEATURE_VOLATILE_WRITE_CACHE(0, this)
            return this.__VolatileWriteCache
        }
    }

    /**
     * Specifies an [NVME_CDW11_FEATURE_ASYNC_EVENT_CONFIG](ns-nvme-nvme_cdw11_feature_async_event_config.md) structure containing parameters for the Asynchronous Event Configuration Feature that controls the events that trigger an asynchronous event notification to the host.
     * 
     * When a Get Features command is submitted for the Asynchronous Event Configuration Feature, the values specified in The **NVME_CDW11_FEATURE_ASYNC_EVENT_CONFIG** structure are returned in the **DW0** field of the [Completion Queue Entry](ns-nvme-nvme_completion_entry.md) structure for that command.
     * @type {NVME_CDW11_FEATURE_ASYNC_EVENT_CONFIG}
     */
    AsyncEventConfig{
        get {
            if(!this.HasProp("__AsyncEventConfig"))
                this.__AsyncEventConfig := NVME_CDW11_FEATURE_ASYNC_EVENT_CONFIG(0, this)
            return this.__AsyncEventConfig
        }
    }

    /**
     * Specifies an [NVME_CDW11_FEATURE_POWER_MANAGEMENT](ns-nvme-nvme_cdw11_feature_power_management.md) structure containing values that allow the host to configure the power state.
     * 
     * When a Get Features command is submitted for the Power Management feature, the **NVME_CDW11_FEATURE_POWER_MANAGEMENT** structure is returned in the **DW0** field of the [Completion Queue entry](ns-nvme-nvme_completion_entry.md) for that command.
     * @type {NVME_CDW11_FEATURE_POWER_MANAGEMENT}
     */
    PowerManagement{
        get {
            if(!this.HasProp("__PowerManagement"))
                this.__PowerManagement := NVME_CDW11_FEATURE_POWER_MANAGEMENT(0, this)
            return this.__PowerManagement
        }
    }

    /**
     * Specifies an [NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION](ns-nvme-nvme_cdw11_feature_auto_power_state_transition.md) structure containing parameters for the Autonomous Power State Transition Feature that configures the settings for autonomous power state transitions.
     * 
     * The Autonomous Power State Transition Feature specifies the attribute information in the **NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION** data structure and the [Autonomous Power State Transition Entry](ns-nvme-nvme_auto_power_state_transition_entry.md) data structure.
     * 
     * When a Get Features command is submitted for the Autonomous Power State Transition Feature, the value specified in The **APSTE** field of the **NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION** structure is returned in the **DW0** field of the [Completion Queue Entry](ns-nvme-nvme_completion_entry.md), and the [NVME_AUTO_POWER_STATE_TRANSITION_ENTRY](ns-nvme-nvme_auto_power_state_transition_entry.md) data structure is returned in the data buffer for that command.
     * @type {NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION}
     */
    AutoPowerStateTransition{
        get {
            if(!this.HasProp("__AutoPowerStateTransition"))
                this.__AutoPowerStateTransition := NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION(0, this)
            return this.__AutoPowerStateTransition
        }
    }

    /**
     * Specifies an [NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD](ns-nvme-nvme_cdw11_feature_temperature_threshold.md) structure containing values that are used to set or retrieve temperature threshold values for the controller.
     * @type {NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD}
     */
    TemperatureThreshold{
        get {
            if(!this.HasProp("__TemperatureThreshold"))
                this.__TemperatureThreshold := NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD(0, this)
            return this.__TemperatureThreshold
        }
    }

    /**
     * @type {NVME_CDW11_FEATURE_ERROR_RECOVERY}
     */
    ErrorRecovery{
        get {
            if(!this.HasProp("__ErrorRecovery"))
                this.__ErrorRecovery := NVME_CDW11_FEATURE_ERROR_RECOVERY(0, this)
            return this.__ErrorRecovery
        }
    }

    /**
     * Specifies an [NVME_CDW11_FEATURE_HOST_MEMORY_BUFFER](ns-nvme-nvme_cdw11_feature_temperature_threshold.md) structure containing values that are used to control the Host Memory Buffer.
     * 
     * The Host Memory Buffer feature provides a mechanism for the host to allocate a portion of host memory for the controller to use exclusively. After a successful completion of a Set Features command that enables the host memory buffer, the host will not write to the associated host memory region, buffer size, or descriptor list until the host memory buffer has been disabled. After a successful completion of a Set Features command that disables the host memory buffer, the controller will not access any data in the host memory buffer until the host memory buffer has been enabled.
     * 
     * The *Host Memory Descriptor List* is a physically contiguous data structure in host memory that describes the address and length pairs of the Host Memory Buffer. The boundaries and contents of the list are defined in following fields and structures:
     * 
     * - The lower bounds of the Host Memory Descriptor List address are defined in the **HMDLLA** field of the [NVME_CDW13_FEATURE_HOST_MEMORY_BUFFER](ns-nvme-nvme_cdw13_feature_host_memory_buffer.md).
     * - The upper bounds of the Host Memory Descriptor List address are defined in the **HMDLUA** field of the [NVME_CDW14_FEATURE_HOST_MEMORY_BUFFER](ns-nvme-nvme_cdw14_feature_host_memory_buffer.md).
     * - The number of addresses and length pairs for the Host Memory Descriptor List are specified in the Host Memory Descriptor List Entry Count in the **HMDLEC** field of the [NVME_CDW15_FEATURE_HOST_MEMORY_BUFFER](ns-nvme-nvme_cdw15_feature_host_memory_buffer.md). 
     * - The fields for an entry in the Host Memory Descriptor List are specified in the [NVME_HOST_MEMORY_BUFFER_DESCRIPTOR_ENTRY](ns-nvme-nvme_host_memory_buffer_descriptor_entry.md) structure.
     * @type {NVME_CDW11_FEATURE_HOST_MEMORY_BUFFER}
     */
    HostMemoryBuffer{
        get {
            if(!this.HasProp("__HostMemoryBuffer"))
                this.__HostMemoryBuffer := NVME_CDW11_FEATURE_HOST_MEMORY_BUFFER(0, this)
            return this.__HostMemoryBuffer
        }
    }

    /**
     * Specifies an [NVME_CDW11_FEATURE_WRITE_ATOMICITY_NORMAL](ns-nvme-nvme_cdw11_feature_write_atomicity_normal.md) structure containing values that control the operation of the Atomic Write Unit Normal (AWUN) and Namespace Atomic Write Unit Normal (NAWUN) parameters that define the controller’s support for atomic operations.
     * 
     * When a Get Features command is submitted for the Write Atomicity Normal Feature, the values specified in The **NVME_CDW11_FEATURE_WRITE_ATOMICITY_NORMAL** structure are returned in the **DW0** field of the [Completion Queue Entry](ns-nvme-nvme_completion_entry.md) structure for that command.
     * @type {NVME_CDW11_FEATURE_WRITE_ATOMICITY_NORMAL}
     */
    WriteAtomicityNormal{
        get {
            if(!this.HasProp("__WriteAtomicityNormal"))
                this.__WriteAtomicityNormal := NVME_CDW11_FEATURE_WRITE_ATOMICITY_NORMAL(0, this)
            return this.__WriteAtomicityNormal
        }
    }

    /**
     * Specifies an [NVME_CDW11_FEATURE_NON_OPERATIONAL_POWER_STATE](ns-nvme-nvme_cdw11_feature_non_operational_power_state.md) structure containing values for the Non-Operational Power State Feature that indicates whether permissive mode is enabled for a non-operational power state.
     * @type {NVME_CDW11_FEATURE_NON_OPERATIONAL_POWER_STATE}
     */
    NonOperationalPowerState{
        get {
            if(!this.HasProp("__NonOperationalPowerState"))
                this.__NonOperationalPowerState := NVME_CDW11_FEATURE_NON_OPERATIONAL_POWER_STATE(0, this)
            return this.__NonOperationalPowerState
        }
    }

    /**
     * @type {NVME_CDW11_FEATURE_IO_COMMAND_SET_PROFILE}
     */
    IoCommandSetProfile{
        get {
            if(!this.HasProp("__IoCommandSetProfile"))
                this.__IoCommandSetProfile := NVME_CDW11_FEATURE_IO_COMMAND_SET_PROFILE(0, this)
            return this.__IoCommandSetProfile
        }
    }

    /**
     * @type {NVME_CDW0_FEATURE_ERROR_INJECTION}
     */
    ErrorInjection{
        get {
            if(!this.HasProp("__ErrorInjection"))
                this.__ErrorInjection := NVME_CDW0_FEATURE_ERROR_INJECTION(0, this)
            return this.__ErrorInjection
        }
    }

    /**
     * @type {NVME_CDW11_FEATURE_HOST_IDENTIFIER}
     */
    HostIdentifier{
        get {
            if(!this.HasProp("__HostIdentifier"))
                this.__HostIdentifier := NVME_CDW11_FEATURE_HOST_IDENTIFIER(0, this)
            return this.__HostIdentifier
        }
    }

    /**
     * @type {NVME_CDW11_FEATURE_RESERVATION_PERSISTENCE}
     */
    ReservationPersistence{
        get {
            if(!this.HasProp("__ReservationPersistence"))
                this.__ReservationPersistence := NVME_CDW11_FEATURE_RESERVATION_PERSISTENCE(0, this)
            return this.__ReservationPersistence
        }
    }

    /**
     * @type {NVME_CDW11_FEATURE_RESERVATION_NOTIFICATION_MASK}
     */
    ReservationNotificationMask{
        get {
            if(!this.HasProp("__ReservationNotificationMask"))
                this.__ReservationNotificationMask := NVME_CDW11_FEATURE_RESERVATION_NOTIFICATION_MASK(0, this)
            return this.__ReservationNotificationMask
        }
    }

    /**
     * @type {NVME_CDW11_FEATURE_GET_HOST_METADATA}
     */
    GetHostMetadata{
        get {
            if(!this.HasProp("__GetHostMetadata"))
                this.__GetHostMetadata := NVME_CDW11_FEATURE_GET_HOST_METADATA(0, this)
            return this.__GetHostMetadata
        }
    }

    /**
     * @type {NVME_CDW11_FEATURE_SET_HOST_METADATA}
     */
    SetHostMetadata{
        get {
            if(!this.HasProp("__SetHostMetadata"))
                this.__SetHostMetadata := NVME_CDW11_FEATURE_SET_HOST_METADATA(0, this)
            return this.__SetHostMetadata
        }
    }

    /**
     * 
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
