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
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW11_FEATURES extends Win32Struct
{
    static sizeof => 168

    static packingSize => 8

    /**
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
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
