#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_MEMORY_DEVICE_IDENTIFY_INFO extends Win32Struct {
    static sizeof => 72

    static packingSize => 2

    class _PoisonHandlingCapabilities extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - InjectsPersistentPoison
         * - ScansForPoison
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
        InjectsPersistentPoison {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        ScansForPoison {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    }

    class _QoSTelemetryCapabilities extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - EgressPortCongestionSupported
         * - TemporaryThroughputReductionSupported
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
        EgressPortCongestionSupported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        TemporaryThroughputReductionSupported {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    }

    /**
     * @type {String}
     */
    FWRevision {
        get => StrGet(this.ptr + 0, 15, "UTF-8")
        set => StrPut(value, this.ptr + 0, 15, "UTF-8")
    }

    /**
     * @type {Array<Integer>}
     */
    TotalCapacity {
        get {
            if(!this.HasProp("__TotalCapacityProxyArray"))
                this.__TotalCapacityProxyArray := Win32FixedArray(this.ptr + 16, 8, Primitive, "char")
            return this.__TotalCapacityProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    VolatileOnlyCapacity {
        get {
            if(!this.HasProp("__VolatileOnlyCapacityProxyArray"))
                this.__VolatileOnlyCapacityProxyArray := Win32FixedArray(this.ptr + 24, 8, Primitive, "char")
            return this.__VolatileOnlyCapacityProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    PersistentOnlyCapacity {
        get {
            if(!this.HasProp("__PersistentOnlyCapacityProxyArray"))
                this.__PersistentOnlyCapacityProxyArray := Win32FixedArray(this.ptr + 32, 8, Primitive, "char")
            return this.__PersistentOnlyCapacityProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    PartitionAlignment {
        get {
            if(!this.HasProp("__PartitionAlignmentProxyArray"))
                this.__PartitionAlignmentProxyArray := Win32FixedArray(this.ptr + 40, 8, Primitive, "char")
            return this.__PartitionAlignmentProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    InformationEventLogSize {
        get {
            if(!this.HasProp("__InformationEventLogSizeProxyArray"))
                this.__InformationEventLogSizeProxyArray := Win32FixedArray(this.ptr + 48, 2, Primitive, "char")
            return this.__InformationEventLogSizeProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    WarningEventLogSize {
        get {
            if(!this.HasProp("__WarningEventLogSizeProxyArray"))
                this.__WarningEventLogSizeProxyArray := Win32FixedArray(this.ptr + 50, 2, Primitive, "char")
            return this.__WarningEventLogSizeProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    FailureEventLogSize {
        get {
            if(!this.HasProp("__FailureEventLogSizeProxyArray"))
                this.__FailureEventLogSizeProxyArray := Win32FixedArray(this.ptr + 52, 2, Primitive, "char")
            return this.__FailureEventLogSizeProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    FatalEventLogSize {
        get {
            if(!this.HasProp("__FatalEventLogSizeProxyArray"))
                this.__FatalEventLogSizeProxyArray := Win32FixedArray(this.ptr + 54, 2, Primitive, "char")
            return this.__FatalEventLogSizeProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    LSASize {
        get {
            if(!this.HasProp("__LSASizeProxyArray"))
                this.__LSASizeProxyArray := Win32FixedArray(this.ptr + 56, 4, Primitive, "char")
            return this.__LSASizeProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    PoisonListMaximumMediaErrorRecords {
        get {
            if(!this.HasProp("__PoisonListMaximumMediaErrorRecordsProxyArray"))
                this.__PoisonListMaximumMediaErrorRecordsProxyArray := Win32FixedArray(this.ptr + 60, 3, Primitive, "char")
            return this.__PoisonListMaximumMediaErrorRecordsProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    InjectPoisonLimit {
        get {
            if(!this.HasProp("__InjectPoisonLimitProxyArray"))
                this.__InjectPoisonLimitProxyArray := Win32FixedArray(this.ptr + 63, 2, Primitive, "char")
            return this.__InjectPoisonLimitProxyArray
        }
    }

    /**
     * @type {_PoisonHandlingCapabilities}
     */
    PoisonHandlingCapabilities {
        get {
            if(!this.HasProp("__PoisonHandlingCapabilities"))
                this.__PoisonHandlingCapabilities := CXL_MAILBOX_MEMORY_DEVICE_IDENTIFY_INFO._PoisonHandlingCapabilities(65, this)
            return this.__PoisonHandlingCapabilities
        }
    }

    /**
     * @type {_QoSTelemetryCapabilities}
     */
    QoSTelemetryCapabilities {
        get {
            if(!this.HasProp("__QoSTelemetryCapabilities"))
                this.__QoSTelemetryCapabilities := CXL_MAILBOX_MEMORY_DEVICE_IDENTIFY_INFO._QoSTelemetryCapabilities(66, this)
            return this.__QoSTelemetryCapabilities
        }
    }

    /**
     * @type {Array<Integer>}
     */
    DynamicCapacityEventLogSize {
        get {
            if(!this.HasProp("__DynamicCapacityEventLogSizeProxyArray"))
                this.__DynamicCapacityEventLogSizeProxyArray := Win32FixedArray(this.ptr + 67, 2, Primitive, "char")
            return this.__DynamicCapacityEventLogSizeProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 69, 3, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
