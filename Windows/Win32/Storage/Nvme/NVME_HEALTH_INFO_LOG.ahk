#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains fields that specify the information contained in the SMART / Health Information Log page.
 * @remarks
 * The temperature reported by a temperature sensor may be used to trigger an asynchronous event. For more information, see [NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD](ns-nvme-nvme_cdw11_feature_temperature_threshold.md).
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_health_info_log
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_HEALTH_INFO_LOG extends Win32Struct
{
    static sizeof => 512

    static packingSize => 4

    class _CriticalWarning_e__Union extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - AvailableSpaceLow
         * - TemperatureThreshold
         * - ReliabilityDegraded
         * - ReadOnly
         * - VolatileMemoryBackupDeviceFailed
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        AvailableSpaceLow {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        TemperatureThreshold {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        ReliabilityDegraded {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    
        /**
         * @type {Integer}
         */
        ReadOnly {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    
        /**
         * @type {Integer}
         */
        VolatileMemoryBackupDeviceFailed {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }
    
        /**
         * @type {Integer}
         */
        AsUchar {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
    }

    /**
     * A Critical Warning (**CriticalWarning**) structure containing fields that indicate critical warnings for the state of the controller.
     * 
     * Each field of the **CriticalWarning** structure is a bit that corresponds to a critical warning type; multiple bits may be set. If a bit is cleared to `0`, then that critical warning does not apply. Bits in this field represent the current associated state and are not persistent.
     * 
     * Critical warnings may result in an asynchronous event notification to the host.
     * @type {_CriticalWarning_e__Union}
     */
    CriticalWarning{
        get {
            if(!this.HasProp("__CriticalWarning"))
                this.__CriticalWarning := %this.__Class%._CriticalWarning_e__Union(0, this)
            return this.__CriticalWarning
        }
    }

    /**
     * Indicates the composite temperature, in degrees Kelvin, of the overall device, including the controller and the NVM subsystem.
     * 
     * If the temperature in this field exceeds the temperature threshold, an asynchronous event completion may occur. For more information, see [NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD](ns-nvme-nvme_cdw11_feature_temperature_threshold.md).
     * 
     * Warning and critical overheating composite temperature threshold values are reported by the **WCTEMP** and **CCTEMP** fields in the [Identify Controller](ns-nvme-nvme_identify_controller_data.md) data structure.
     * @type {Array<Byte>}
     */
    Temperature{
        get {
            if(!this.HasProp("__TemperatureProxyArray"))
                this.__TemperatureProxyArray := Win32FixedArray(this.ptr + 1, 2, Primitive, "char")
            return this.__TemperatureProxyArray
        }
    }

    /**
     * Indicates a normalized percentage (0 to 100) of the remaining spare capacity available.
     * @type {Integer}
     */
    AvailableSpare {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * Indicates the threshold of available spare capacity.
     * 
     * When the value of **AvailableSpare** falls below the threshold indicated in this field, an asynchronous event completion may occur. The value is indicated as a normalized percentage (0 to 100).
     * @type {Integer}
     */
    AvailableSpareThreshold {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * Indicates a vendor specific estimate of the percentage of NVM subsystem life used, based on the actual usage and the manufacturer’s prediction of NVM life.
     * 
     * A value of 100 indicates that the estimated endurance of the NVM in the NVM subsystem has been consumed, but may not indicate an NVM subsystem failure. The value is allowed to exceed 100. Percentages greater than 254 are represented as 255. This value is updated once per power-on hour (when the controller is not in a sleep state).
     * @type {Integer}
     */
    PercentageUsed {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * A reserved field.
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 6, 26, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * Indicates the number of 512 byte data units the host has read from the controller, not including metadata.
     * 
     * The value of this field is reported in thousands and is rounded up. For example, a value of 1 corresponds to 1000 units of 512 bytes read. When the Logical Block Access (LBA) size is a value other than 512 bytes, the controller converts the amount of data read to 512 byte units.
     * 
     * For the NVM command set, logical blocks read as part of Compare and Read operations are included in this value.
     * @type {Array<Byte>}
     */
    DataUnitRead{
        get {
            if(!this.HasProp("__DataUnitReadProxyArray"))
                this.__DataUnitReadProxyArray := Win32FixedArray(this.ptr + 32, 16, Primitive, "char")
            return this.__DataUnitReadProxyArray
        }
    }

    /**
     * Indicates the number of 512 byte data units the host has written to the controller, not including metadata.
     * 
     * The value of this field is reported in thousands and is rounded up. For example, a value of 1 corresponds to 1000 units of 512 bytes read. When the Logical Block Access (LBA) size is a value other than 512 bytes, the controller converts the amount of data written to 512 byte units.
     * 
     * For the NVM command set, logical blocks written as part of Write operations are included in this value. Write Uncorrectable commands do not impact this value.
     * @type {Array<Byte>}
     */
    DataUnitWritten{
        get {
            if(!this.HasProp("__DataUnitWrittenProxyArray"))
                this.__DataUnitWrittenProxyArray := Win32FixedArray(this.ptr + 48, 16, Primitive, "char")
            return this.__DataUnitWrittenProxyArray
        }
    }

    /**
     * Indicates the number of Read commands completed by the controller.
     * 
     * For the NVM command set, this is the number of Compare and Read commands.
     * @type {Array<Byte>}
     */
    HostReadCommands{
        get {
            if(!this.HasProp("__HostReadCommandsProxyArray"))
                this.__HostReadCommandsProxyArray := Win32FixedArray(this.ptr + 64, 16, Primitive, "char")
            return this.__HostReadCommandsProxyArray
        }
    }

    /**
     * Indicates the number of Write commands completed by the controller.
     * 
     * For the NVM command set, this is the number of Write commands.
     * @type {Array<Byte>}
     */
    HostWrittenCommands{
        get {
            if(!this.HasProp("__HostWrittenCommandsProxyArray"))
                this.__HostWrittenCommandsProxyArray := Win32FixedArray(this.ptr + 80, 16, Primitive, "char")
            return this.__HostWrittenCommandsProxyArray
        }
    }

    /**
     * Indicates the amount of time, in minutes, that the controller is busy with I/O commands.
     * 
     * The controller is busy when there is a command outstanding to an I/O Queue. Specifically, when a command was issued via an I/O [Submission Queue Tail doorbell](ns-nvme-nvme_submission_queue_tail_doorbell.md) write and the corresponding completion queue entry has not been posted yet to the associated I/O Completion Queue.
     * @type {Array<Byte>}
     */
    ControllerBusyTime{
        get {
            if(!this.HasProp("__ControllerBusyTimeProxyArray"))
                this.__ControllerBusyTimeProxyArray := Win32FixedArray(this.ptr + 96, 16, Primitive, "char")
            return this.__ControllerBusyTimeProxyArray
        }
    }

    /**
     * Indicates the number of power cycles.
     * @type {Array<Byte>}
     */
    PowerCycle{
        get {
            if(!this.HasProp("__PowerCycleProxyArray"))
                this.__PowerCycleProxyArray := Win32FixedArray(this.ptr + 112, 16, Primitive, "char")
            return this.__PowerCycleProxyArray
        }
    }

    /**
     * Indicates the number of power-on hours. This does not include time that the controller was powered and in a low power state condition.
     * @type {Array<Byte>}
     */
    PowerOnHours{
        get {
            if(!this.HasProp("__PowerOnHoursProxyArray"))
                this.__PowerOnHoursProxyArray := Win32FixedArray(this.ptr + 128, 16, Primitive, "char")
            return this.__PowerOnHoursProxyArray
        }
    }

    /**
     * Indicates the number of unsafe shutdowns. This count is incremented when a shutdown notification, indicated in the **SHN** filed of [Controller Configuration](ns-nvme-nvme_controller_configuration.md), is not received prior to loss of power.
     * @type {Array<Byte>}
     */
    UnsafeShutdowns{
        get {
            if(!this.HasProp("__UnsafeShutdownsProxyArray"))
                this.__UnsafeShutdownsProxyArray := Win32FixedArray(this.ptr + 144, 16, Primitive, "char")
            return this.__UnsafeShutdownsProxyArray
        }
    }

    /**
     * Indicates the number of occurrences where the controller detected an unrecovered data integrity error.
     * 
     * [Media Errors](ne-nvme-nvme_status_media_error_codes.md) such as uncorrectable ECC, CRC checksum failure, or LBA tag mismatch are included in this field.
     * @type {Array<Byte>}
     */
    MediaErrors{
        get {
            if(!this.HasProp("__MediaErrorsProxyArray"))
                this.__MediaErrorsProxyArray := Win32FixedArray(this.ptr + 160, 16, Primitive, "char")
            return this.__MediaErrorsProxyArray
        }
    }

    /**
     * Indicates the number of [Error Information](ns-nvme-nvme_error_info_log.md) log entries over the life of the controller.
     * @type {Array<Byte>}
     */
    ErrorInfoLogEntryCount{
        get {
            if(!this.HasProp("__ErrorInfoLogEntryCountProxyArray"))
                this.__ErrorInfoLogEntryCountProxyArray := Win32FixedArray(this.ptr + 176, 16, Primitive, "char")
            return this.__ErrorInfoLogEntryCountProxyArray
        }
    }

    /**
     * Indicates the amount of time, in minutes, that the controller is operational and the [Composite Temperature (**Temperature**)](#-field-temperature) is greater than or equal to the Warning Composite Temperature Threshold (**WCTEMP**) field and less than the Critical Composite Temperature Threshold (**CCTEMP**) field in the [Identify Controller](ns-nvme-nvme_identify_controller_data.md) data structure.
     * 
     * If the value of the **WCTEMP** or **CCTEMP** field is `0h`, then this field is always cleared to `0h` regardless of the **Temperature** value.
     * @type {Integer}
     */
    WarningCompositeTemperatureTime {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * Indicates the amount of time in minutes that the controller is operational and the [Composite Temperature (**Temperature**)](#-field-temperature) is greater the Critical Composite Temperature Threshold (**CCTEMP**) field in the [Identify Controller](ns-nvme-nvme_identify_controller_data.md) data structure.
     * 
     * If the value of the **CCTEMP** field is `0h`, then this field is always cleared to `0h` regardless of the **Temperature** value.
     * @type {Integer}
     */
    CriticalCompositeTemperatureTime {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * Indicates the current temperature in degrees Kelvin reported by temperature sensor 1.
     * @type {Integer}
     */
    TemperatureSensor1 {
        get => NumGet(this, 200, "ushort")
        set => NumPut("ushort", value, this, 200)
    }

    /**
     * Indicates the current temperature in degrees Kelvin reported by temperature sensor 2.
     * @type {Integer}
     */
    TemperatureSensor2 {
        get => NumGet(this, 202, "ushort")
        set => NumPut("ushort", value, this, 202)
    }

    /**
     * Indicates the current temperature in degrees Kelvin reported by temperature sensor 3.
     * @type {Integer}
     */
    TemperatureSensor3 {
        get => NumGet(this, 204, "ushort")
        set => NumPut("ushort", value, this, 204)
    }

    /**
     * Indicates the current temperature in degrees Kelvin reported by temperature sensor 4.
     * @type {Integer}
     */
    TemperatureSensor4 {
        get => NumGet(this, 206, "ushort")
        set => NumPut("ushort", value, this, 206)
    }

    /**
     * Indicates the current temperature in degrees Kelvin reported by temperature sensor 5.
     * @type {Integer}
     */
    TemperatureSensor5 {
        get => NumGet(this, 208, "ushort")
        set => NumPut("ushort", value, this, 208)
    }

    /**
     * Indicates the current temperature in degrees Kelvin reported by temperature sensor 6.
     * @type {Integer}
     */
    TemperatureSensor6 {
        get => NumGet(this, 210, "ushort")
        set => NumPut("ushort", value, this, 210)
    }

    /**
     * Indicates the current temperature in degrees Kelvin reported by temperature sensor 7.
     * @type {Integer}
     */
    TemperatureSensor7 {
        get => NumGet(this, 212, "ushort")
        set => NumPut("ushort", value, this, 212)
    }

    /**
     * Indicates the current temperature in degrees Kelvin reported by temperature sensor 8.
     * @type {Integer}
     */
    TemperatureSensor8 {
        get => NumGet(this, 214, "ushort")
        set => NumPut("ushort", value, this, 214)
    }

    /**
     * A reserved field.
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 216, 296, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }
}
