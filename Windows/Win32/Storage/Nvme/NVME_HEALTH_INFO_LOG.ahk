#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains fields that specify the information contained in the SMART / Health Information Log page.
 * @remarks
 * The temperature reported by a temperature sensor may be used to trigger an asynchronous event. For more information, see [NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD](ns-nvme-nvme_cdw11_feature_temperature_threshold.md).
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_health_info_log
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_HEALTH_INFO_LOG {
    #StructPack 4


    struct _CriticalWarning {
        /**
         * This bitfield backs the following members:
         * - AvailableSpaceLow
         * - TemperatureThreshold
         * - ReliabilityDegraded
         * - ReadOnly
         * - VolatileMemoryBackupDeviceFailed
         * - Reserved
         */
        _bitfield : Int8


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
        static __New() {
            DefineProp(this.Prototype, 'AsUchar', { type: Int8, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * A Critical Warning (**CriticalWarning**) structure containing fields that indicate critical warnings for the state of the controller.
     * 
     * Each field of the **CriticalWarning** structure is a bit that corresponds to a critical warning type; multiple bits may be set. If a bit is cleared to `0`, then that critical warning does not apply. Bits in this field represent the current associated state and are not persistent.
     * 
     * Critical warnings may result in an asynchronous event notification to the host.
     */
    CriticalWarning : NVME_HEALTH_INFO_LOG._CriticalWarning

    /**
     * Indicates the composite temperature, in degrees Kelvin, of the overall device, including the controller and the NVM subsystem.
     * 
     * If the temperature in this field exceeds the temperature threshold, an asynchronous event completion may occur. For more information, see [NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD](ns-nvme-nvme_cdw11_feature_temperature_threshold.md).
     * 
     * Warning and critical overheating composite temperature threshold values are reported by the **WCTEMP** and **CCTEMP** fields in the [Identify Controller](ns-nvme-nvme_identify_controller_data.md) data structure.
     */
    Temperature : Int8[2]

    /**
     * Indicates a normalized percentage (0 to 100) of the remaining spare capacity available.
     */
    AvailableSpare : Int8

    /**
     * Indicates the threshold of available spare capacity.
     * 
     * When the value of **AvailableSpare** falls below the threshold indicated in this field, an asynchronous event completion may occur. The value is indicated as a normalized percentage (0 to 100).
     */
    AvailableSpareThreshold : Int8

    /**
     * Indicates a vendor specific estimate of the percentage of NVM subsystem life used, based on the actual usage and the manufacturer’s prediction of NVM life.
     * 
     * A value of 100 indicates that the estimated endurance of the NVM in the NVM subsystem has been consumed, but may not indicate an NVM subsystem failure. The value is allowed to exceed 100. Percentages greater than 254 are represented as 255. This value is updated once per power-on hour (when the controller is not in a sleep state).
     */
    PercentageUsed : Int8

    /**
     * A reserved field.
     */
    Reserved0 : Int8[26]

    /**
     * Indicates the number of 512 byte data units the host has read from the controller, not including metadata.
     * 
     * The value of this field is reported in thousands and is rounded up. For example, a value of 1 corresponds to 1000 units of 512 bytes read. When the Logical Block Access (LBA) size is a value other than 512 bytes, the controller converts the amount of data read to 512 byte units.
     * 
     * For the NVM command set, logical blocks read as part of Compare and Read operations are included in this value.
     */
    DataUnitRead : Int8[16]

    /**
     * Indicates the number of 512 byte data units the host has written to the controller, not including metadata.
     * 
     * The value of this field is reported in thousands and is rounded up. For example, a value of 1 corresponds to 1000 units of 512 bytes read. When the Logical Block Access (LBA) size is a value other than 512 bytes, the controller converts the amount of data written to 512 byte units.
     * 
     * For the NVM command set, logical blocks written as part of Write operations are included in this value. Write Uncorrectable commands do not impact this value.
     */
    DataUnitWritten : Int8[16]

    /**
     * Indicates the number of Read commands completed by the controller.
     * 
     * For the NVM command set, this is the number of Compare and Read commands.
     */
    HostReadCommands : Int8[16]

    /**
     * Indicates the number of Write commands completed by the controller.
     * 
     * For the NVM command set, this is the number of Write commands.
     */
    HostWrittenCommands : Int8[16]

    /**
     * Indicates the amount of time, in minutes, that the controller is busy with I/O commands.
     * 
     * The controller is busy when there is a command outstanding to an I/O Queue. Specifically, when a command was issued via an I/O [Submission Queue Tail doorbell](ns-nvme-nvme_submission_queue_tail_doorbell.md) write and the corresponding completion queue entry has not been posted yet to the associated I/O Completion Queue.
     */
    ControllerBusyTime : Int8[16]

    /**
     * Indicates the number of power cycles.
     */
    PowerCycle : Int8[16]

    /**
     * Indicates the number of power-on hours. This does not include time that the controller was powered and in a low power state condition.
     */
    PowerOnHours : Int8[16]

    /**
     * Indicates the number of unsafe shutdowns. This count is incremented when a shutdown notification, indicated in the **SHN** filed of [Controller Configuration](ns-nvme-nvme_controller_configuration.md), is not received prior to loss of power.
     */
    UnsafeShutdowns : Int8[16]

    /**
     * Indicates the number of occurrences where the controller detected an unrecovered data integrity error.
     * 
     * [Media Errors](ne-nvme-nvme_status_media_error_codes.md) such as uncorrectable ECC, CRC checksum failure, or LBA tag mismatch are included in this field.
     */
    MediaErrors : Int8[16]

    /**
     * Indicates the number of [Error Information](ns-nvme-nvme_error_info_log.md) log entries over the life of the controller.
     */
    ErrorInfoLogEntryCount : Int8[16]

    /**
     * Indicates the amount of time, in minutes, that the controller is operational and the [Composite Temperature (**Temperature**)](#-field-temperature) is greater than or equal to the Warning Composite Temperature Threshold (**WCTEMP**) field and less than the Critical Composite Temperature Threshold (**CCTEMP**) field in the [Identify Controller](ns-nvme-nvme_identify_controller_data.md) data structure.
     * 
     * If the value of the **WCTEMP** or **CCTEMP** field is `0h`, then this field is always cleared to `0h` regardless of the **Temperature** value.
     */
    WarningCompositeTemperatureTime : UInt32

    /**
     * Indicates the amount of time in minutes that the controller is operational and the [Composite Temperature (**Temperature**)](#-field-temperature) is greater the Critical Composite Temperature Threshold (**CCTEMP**) field in the [Identify Controller](ns-nvme-nvme_identify_controller_data.md) data structure.
     * 
     * If the value of the **CCTEMP** field is `0h`, then this field is always cleared to `0h` regardless of the **Temperature** value.
     */
    CriticalCompositeTemperatureTime : UInt32

    /**
     * Indicates the current temperature in degrees Kelvin reported by temperature sensor 1.
     */
    TemperatureSensor1 : UInt16

    /**
     * Indicates the current temperature in degrees Kelvin reported by temperature sensor 2.
     */
    TemperatureSensor2 : UInt16

    /**
     * Indicates the current temperature in degrees Kelvin reported by temperature sensor 3.
     */
    TemperatureSensor3 : UInt16

    /**
     * Indicates the current temperature in degrees Kelvin reported by temperature sensor 4.
     */
    TemperatureSensor4 : UInt16

    /**
     * Indicates the current temperature in degrees Kelvin reported by temperature sensor 5.
     */
    TemperatureSensor5 : UInt16

    /**
     * Indicates the current temperature in degrees Kelvin reported by temperature sensor 6.
     */
    TemperatureSensor6 : UInt16

    /**
     * Indicates the current temperature in degrees Kelvin reported by temperature sensor 7.
     */
    TemperatureSensor7 : UInt16

    /**
     * Indicates the current temperature in degrees Kelvin reported by temperature sensor 8.
     */
    TemperatureSensor8 : UInt16

    /**
     * A reserved field.
     */
    Reserved1 : Int8[296]

}
