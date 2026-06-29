#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_CDW11_FEATURE_NUMBER_OF_QUEUES.ahk" { NVME_CDW11_FEATURE_NUMBER_OF_QUEUES }
#Import ".\NVME_CDW11_FEATURE_RESERVATION_NOTIFICATION_MASK.ahk" { NVME_CDW11_FEATURE_RESERVATION_NOTIFICATION_MASK }
#Import ".\NVME_CDW0_FEATURE_ERROR_INJECTION.ahk" { NVME_CDW0_FEATURE_ERROR_INJECTION }
#Import ".\NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD.ahk" { NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD }
#Import ".\NVME_CDW11_FEATURE_ARBITRATION.ahk" { NVME_CDW11_FEATURE_ARBITRATION }
#Import ".\NVME_CDW11_FEATURE_SET_HOST_METADATA.ahk" { NVME_CDW11_FEATURE_SET_HOST_METADATA }
#Import ".\NVME_CDW11_FEATURE_HOST_IDENTIFIER.ahk" { NVME_CDW11_FEATURE_HOST_IDENTIFIER }
#Import ".\NVME_CDW11_FEATURE_IO_COMMAND_SET_PROFILE.ahk" { NVME_CDW11_FEATURE_IO_COMMAND_SET_PROFILE }
#Import ".\NVME_CDW11_FEATURE_RESERVATION_PERSISTENCE.ahk" { NVME_CDW11_FEATURE_RESERVATION_PERSISTENCE }
#Import ".\NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION.ahk" { NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION }
#Import ".\NVME_CDW11_FEATURE_POWER_MANAGEMENT.ahk" { NVME_CDW11_FEATURE_POWER_MANAGEMENT }
#Import ".\NVME_CDW11_FEATURE_INTERRUPT_VECTOR_CONFIG.ahk" { NVME_CDW11_FEATURE_INTERRUPT_VECTOR_CONFIG }
#Import ".\NVME_CDW11_FEATURE_HOST_MEMORY_BUFFER.ahk" { NVME_CDW11_FEATURE_HOST_MEMORY_BUFFER }
#Import ".\NVME_CDW11_FEATURE_ERROR_RECOVERY.ahk" { NVME_CDW11_FEATURE_ERROR_RECOVERY }
#Import ".\NVME_CDW11_FEATURE_NON_OPERATIONAL_POWER_STATE.ahk" { NVME_CDW11_FEATURE_NON_OPERATIONAL_POWER_STATE }
#Import ".\NVME_CDW11_FEATURE_VOLATILE_WRITE_CACHE.ahk" { NVME_CDW11_FEATURE_VOLATILE_WRITE_CACHE }
#Import ".\NVME_CDW11_FEATURE_WRITE_ATOMICITY_NORMAL.ahk" { NVME_CDW11_FEATURE_WRITE_ATOMICITY_NORMAL }
#Import ".\NVME_CDW11_FEATURE_GET_HOST_METADATA.ahk" { NVME_CDW11_FEATURE_GET_HOST_METADATA }
#Import ".\NVME_CDW11_FEATURE_LBA_RANGE_TYPE.ahk" { NVME_CDW11_FEATURE_LBA_RANGE_TYPE }
#Import ".\NVME_CDW11_FEATURE_INTERRUPT_COALESCING.ahk" { NVME_CDW11_FEATURE_INTERRUPT_COALESCING }
#Import ".\NVME_CDW11_FEATURE_ASYNC_EVENT_CONFIG.ahk" { NVME_CDW11_FEATURE_ASYNC_EVENT_CONFIG }

/**
 * Contains parameters for the Get Features and Set Features commands that retrieve or set the attributes of the specified feature.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_features
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURES {
    #StructPack 4

    /**
     * Specifies an [NVME_CDW11_FEATURE_NUMBER_OF_QUEUES](ns-nvme-nvme_cdw11_feature_number_of_queues.md) structure containing values that indicates the number of queues that the host requests for this controller.
     * 
     * When a Set Features or Get Features command is submitted for the Number of Queues Feature, the **NVME_CDW11_FEATURE_NUMBER_OF_QUEUES** structure is returned in the Dword 0 (**DW0**) field of the [Completion Queue entry](ns-nvme-nvme_completion_entry.md) for that command.
     */
    NumberOfQueues : NVME_CDW11_FEATURE_NUMBER_OF_QUEUES

    static __New() {
        DefineProp(this.Prototype, 'InterruptCoalescing', { type: NVME_CDW11_FEATURE_INTERRUPT_COALESCING, offset: 0 })
        DefineProp(this.Prototype, 'InterruptVectorConfig', { type: NVME_CDW11_FEATURE_INTERRUPT_VECTOR_CONFIG, offset: 0 })
        DefineProp(this.Prototype, 'LbaRangeType', { type: NVME_CDW11_FEATURE_LBA_RANGE_TYPE, offset: 0 })
        DefineProp(this.Prototype, 'Arbitration', { type: NVME_CDW11_FEATURE_ARBITRATION, offset: 0 })
        DefineProp(this.Prototype, 'VolatileWriteCache', { type: NVME_CDW11_FEATURE_VOLATILE_WRITE_CACHE, offset: 0 })
        DefineProp(this.Prototype, 'AsyncEventConfig', { type: NVME_CDW11_FEATURE_ASYNC_EVENT_CONFIG, offset: 0 })
        DefineProp(this.Prototype, 'PowerManagement', { type: NVME_CDW11_FEATURE_POWER_MANAGEMENT, offset: 0 })
        DefineProp(this.Prototype, 'AutoPowerStateTransition', { type: NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION, offset: 0 })
        DefineProp(this.Prototype, 'TemperatureThreshold', { type: NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD, offset: 0 })
        DefineProp(this.Prototype, 'ErrorRecovery', { type: NVME_CDW11_FEATURE_ERROR_RECOVERY, offset: 0 })
        DefineProp(this.Prototype, 'HostMemoryBuffer', { type: NVME_CDW11_FEATURE_HOST_MEMORY_BUFFER, offset: 0 })
        DefineProp(this.Prototype, 'WriteAtomicityNormal', { type: NVME_CDW11_FEATURE_WRITE_ATOMICITY_NORMAL, offset: 0 })
        DefineProp(this.Prototype, 'NonOperationalPowerState', { type: NVME_CDW11_FEATURE_NON_OPERATIONAL_POWER_STATE, offset: 0 })
        DefineProp(this.Prototype, 'IoCommandSetProfile', { type: NVME_CDW11_FEATURE_IO_COMMAND_SET_PROFILE, offset: 0 })
        DefineProp(this.Prototype, 'ErrorInjection', { type: NVME_CDW0_FEATURE_ERROR_INJECTION, offset: 0 })
        DefineProp(this.Prototype, 'HostIdentifier', { type: NVME_CDW11_FEATURE_HOST_IDENTIFIER, offset: 0 })
        DefineProp(this.Prototype, 'ReservationPersistence', { type: NVME_CDW11_FEATURE_RESERVATION_PERSISTENCE, offset: 0 })
        DefineProp(this.Prototype, 'ReservationNotificationMask', { type: NVME_CDW11_FEATURE_RESERVATION_NOTIFICATION_MASK, offset: 0 })
        DefineProp(this.Prototype, 'GetHostMetadata', { type: NVME_CDW11_FEATURE_GET_HOST_METADATA, offset: 0 })
        DefineProp(this.Prototype, 'SetHostMetadata', { type: NVME_CDW11_FEATURE_SET_HOST_METADATA, offset: 0 })
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
