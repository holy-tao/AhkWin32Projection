#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CXL_COMMON_EVENT_RECORD_HEADER.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_GENERAL_MEDIA_EVENT_RECORD extends Win32Struct {
    static sizeof => 136

    static packingSize => 8

    class _PhysicalAddress extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - Volatile
         * - DpaNotRepairable
         * - Reserved
         * - Dpa
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        Volatile {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        DpaNotRepairable {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        Dpa {
            get => (this._bitfield >> 6) & 0x3FFFFFFFFFFFFFF
            set => this._bitfield := ((value & 0x3FFFFFFFFFFFFFF) << 6) | (this._bitfield & ~(0x3FFFFFFFFFFFFFF << 6))
        }
    }

    class _MemoryEventDescriptor extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - UncorrectableEvent
         * - ThresholdEvent
         * - PoisonListOverflow
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
        UncorrectableEvent {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        ThresholdEvent {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        PoisonListOverflow {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    }

    class _ValidityFlags extends Win32Struct {
        static sizeof => 2
        static packingSize => 2

        /**
         * This bitfield backs the following members:
         * - Channel
         * - Rank
         * - Device
         * - ComponentIdentifier
         * - ComponentIdentifierFormat
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        Channel {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        Rank {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        Device {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        ComponentIdentifier {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        ComponentIdentifierFormat {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }
    }

    class _AdvProgCorrMemErrThresholdEventFlags extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - MoreThanOneComponent
         * - ProgrammableThresholdExceeded
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
        MoreThanOneComponent {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        ProgrammableThresholdExceeded {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    }

    /**
     * @type {CXL_COMMON_EVENT_RECORD_HEADER}
     */
    Header {
        get {
            if(!this.HasProp("__Header"))
                this.__Header := CXL_COMMON_EVENT_RECORD_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {_PhysicalAddress}
     */
    PhysicalAddress {
        get {
            if(!this.HasProp("__PhysicalAddress"))
                this.__PhysicalAddress := CXL_GENERAL_MEDIA_EVENT_RECORD._PhysicalAddress(48, this)
            return this.__PhysicalAddress
        }
    }

    /**
     * @type {_MemoryEventDescriptor}
     */
    MemoryEventDescriptor {
        get {
            if(!this.HasProp("__MemoryEventDescriptor"))
                this.__MemoryEventDescriptor := CXL_GENERAL_MEDIA_EVENT_RECORD._MemoryEventDescriptor(56, this)
            return this.__MemoryEventDescriptor
        }
    }

    /**
     * @type {Integer}
     */
    MemoryEventType {
        get => NumGet(this, 57, "char")
        set => NumPut("char", value, this, 57)
    }

    /**
     * @type {Integer}
     */
    TransactionType {
        get => NumGet(this, 58, "char")
        set => NumPut("char", value, this, 58)
    }

    /**
     * @type {_ValidityFlags}
     */
    ValidityFlags {
        get {
            if(!this.HasProp("__ValidityFlags"))
                this.__ValidityFlags := CXL_GENERAL_MEDIA_EVENT_RECORD._ValidityFlags(60, this)
            return this.__ValidityFlags
        }
    }

    /**
     * @type {Integer}
     */
    Channel {
        get => NumGet(this, 62, "char")
        set => NumPut("char", value, this, 62)
    }

    /**
     * @type {Integer}
     */
    Rank {
        get => NumGet(this, 63, "char")
        set => NumPut("char", value, this, 63)
    }

    /**
     * @type {Array<Integer>}
     */
    Device {
        get {
            if(!this.HasProp("__DeviceProxyArray"))
                this.__DeviceProxyArray := Win32FixedArray(this.ptr + 64, 3, Primitive, "char")
            return this.__DeviceProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    ComponentIdentifier {
        get {
            if(!this.HasProp("__ComponentIdentifierProxyArray"))
                this.__ComponentIdentifierProxyArray := Win32FixedArray(this.ptr + 67, 16, Primitive, "char")
            return this.__ComponentIdentifierProxyArray
        }
    }

    /**
     * @type {_AdvProgCorrMemErrThresholdEventFlags}
     */
    AdvProgCorrMemErrThresholdEventFlags {
        get {
            if(!this.HasProp("__AdvProgCorrMemErrThresholdEventFlags"))
                this.__AdvProgCorrMemErrThresholdEventFlags := CXL_GENERAL_MEDIA_EVENT_RECORD._AdvProgCorrMemErrThresholdEventFlags(83, this)
            return this.__AdvProgCorrMemErrThresholdEventFlags
        }
    }

    /**
     * @type {Array<Integer>}
     */
    CorrectedMemoryCountAtEvent {
        get {
            if(!this.HasProp("__CorrectedMemoryCountAtEventProxyArray"))
                this.__CorrectedMemoryCountAtEventProxyArray := Win32FixedArray(this.ptr + 84, 3, Primitive, "char")
            return this.__CorrectedMemoryCountAtEventProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    MemoryEventSubType {
        get => NumGet(this, 87, "char")
        set => NumPut("char", value, this, 87)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 88, 41, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
