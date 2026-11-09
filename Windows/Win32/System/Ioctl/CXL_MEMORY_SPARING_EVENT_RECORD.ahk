#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CXL_COMMON_EVENT_RECORD_HEADER.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MEMORY_SPARING_EVENT_RECORD extends Win32Struct {
    static sizeof => 128

    static packingSize => 8

    class _Flags extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - QueryResourcesFlag
         * - HardSparingFlag
         * - DeviceInitiated
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
        QueryResourcesFlag {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        HardSparingFlag {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        DeviceInitiated {
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
        ComponentIdentifier {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }

        /**
         * @type {Integer}
         */
        ComponentIdentifierFormat {
            get => (this._bitfield >> 8) & 0x1
            set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
        }

        /**
         * @type {Integer}
         */
        Subchannel {
            get => (this._bitfield >> 9) & 0x1
            set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
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
     * @type {Integer}
     */
    MaintenanceOperationClass {
        get => NumGet(this, 48, "char")
        set => NumPut("char", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    MaintenanceOperationSubclass {
        get => NumGet(this, 49, "char")
        set => NumPut("char", value, this, 49)
    }

    /**
     * @type {_Flags}
     */
    Flags {
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := CXL_MEMORY_SPARING_EVENT_RECORD._Flags(50, this)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    Result {
        get => NumGet(this, 51, "char")
        set => NumPut("char", value, this, 51)
    }

    /**
     * @type {_ValidityFlags}
     */
    ValidityFlags {
        get {
            if(!this.HasProp("__ValidityFlags"))
                this.__ValidityFlags := CXL_MEMORY_SPARING_EVENT_RECORD._ValidityFlags(52, this)
            return this.__ValidityFlags
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 54, 6, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    SpareResourceAvailable {
        get => NumGet(this, 60, "ushort")
        set => NumPut("ushort", value, this, 60)
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
    ComponentIdentifier {
        get {
            if(!this.HasProp("__ComponentIdentifierProxyArray"))
                this.__ComponentIdentifierProxyArray := Win32FixedArray(this.ptr + 74, 16, Primitive, "char")
            return this.__ComponentIdentifierProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    SubChannel {
        get => NumGet(this, 90, "char")
        set => NumPut("char", value, this, 90)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved3 {
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 91, 37, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }
}
