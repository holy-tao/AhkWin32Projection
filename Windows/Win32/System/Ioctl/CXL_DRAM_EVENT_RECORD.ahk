#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CXL_COMMON_EVENT_RECORD_HEADER.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_DRAM_EVENT_RECORD extends Win32Struct {
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
         * - NibbleMask
         * - BankGroup
         * - Bank
         * - Row
         * - Column
         * - CorrectionMask
         * - ComponentIdentifier
         * - ComponentIdentifierFormat
         * - Subchannel
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
        NibbleMask {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        BankGroup {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        Bank {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        Row {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }

        /**
         * @type {Integer}
         */
        Column {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }

        /**
         * @type {Integer}
         */
        CorrectionMask {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }

        /**
         * @type {Integer}
         */
        ComponentIdentifier {
            get => (this._bitfield >> 8) & 0x1
            set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
        }

        /**
         * @type {Integer}
         */
        ComponentIdentifierFormat {
            get => (this._bitfield >> 9) & 0x1
            set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
        }

        /**
         * @type {Integer}
         */
        Subchannel {
            get => (this._bitfield >> 10) & 0x1
            set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
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
                this.__PhysicalAddress := CXL_DRAM_EVENT_RECORD._PhysicalAddress(48, this)
            return this.__PhysicalAddress
        }
    }

    /**
     * @type {_MemoryEventDescriptor}
     */
    MemoryEventDescriptor {
        get {
            if(!this.HasProp("__MemoryEventDescriptor"))
                this.__MemoryEventDescriptor := CXL_DRAM_EVENT_RECORD._MemoryEventDescriptor(56, this)
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
                this.__ValidityFlags := CXL_DRAM_EVENT_RECORD._ValidityFlags(60, this)
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
    NibbleMask {
        get {
            if(!this.HasProp("__NibbleMaskProxyArray"))
                this.__NibbleMaskProxyArray := Win32FixedArray(this.ptr + 64, 3, Primitive, "char")
            return this.__NibbleMaskProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    BankGroup {
        get => NumGet(this, 67, "char")
        set => NumPut("char", value, this, 67)
    }

    /**
     * @type {Integer}
     */
    Bank {
        get => NumGet(this, 68, "char")
        set => NumPut("char", value, this, 68)
    }

    /**
     * @type {Array<Integer>}
     */
    Row {
        get {
            if(!this.HasProp("__RowProxyArray"))
                this.__RowProxyArray := Win32FixedArray(this.ptr + 69, 3, Primitive, "char")
            return this.__RowProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Column {
        get {
            if(!this.HasProp("__ColumnProxyArray"))
                this.__ColumnProxyArray := Win32FixedArray(this.ptr + 72, 2, Primitive, "char")
            return this.__ColumnProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    CorrectionMask {
        get {
            if(!this.HasProp("__CorrectionMaskProxyArray"))
                this.__CorrectionMaskProxyArray := Win32FixedArray(this.ptr + 74, 32, Primitive, "char")
            return this.__CorrectionMaskProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    ComponentIdentifier {
        get {
            if(!this.HasProp("__ComponentIdentifierProxyArray"))
                this.__ComponentIdentifierProxyArray := Win32FixedArray(this.ptr + 106, 16, Primitive, "char")
            return this.__ComponentIdentifierProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    SubChannel {
        get => NumGet(this, 122, "char")
        set => NumPut("char", value, this, 122)
    }

    /**
     * @type {_AdvProgCorrMemErrThresholdEventFlags}
     */
    AdvProgCorrMemErrThresholdEventFlags {
        get {
            if(!this.HasProp("__AdvProgCorrMemErrThresholdEventFlags"))
                this.__AdvProgCorrMemErrThresholdEventFlags := CXL_DRAM_EVENT_RECORD._AdvProgCorrMemErrThresholdEventFlags(123, this)
            return this.__AdvProgCorrMemErrThresholdEventFlags
        }
    }

    /**
     * @type {Array<Integer>}
     */
    CVMECountAtEvent {
        get {
            if(!this.HasProp("__CVMECountAtEventProxyArray"))
                this.__CVMECountAtEventProxyArray := Win32FixedArray(this.ptr + 124, 3, Primitive, "char")
            return this.__CVMECountAtEventProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    MemoryEventSubType {
        get => NumGet(this, 127, "char")
        set => NumPut("char", value, this, 127)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 128, "char")
        set => NumPut("char", value, this, 128)
    }
}
