#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_COMMON_EVENT_RECORD_HEADER extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    class _EventRecordFlags extends Win32Struct {
        static sizeof => 2
        static packingSize => 1

        class _bits extends Win32Struct {
            static sizeof => 2
            static packingSize => 2

            /**
             * This bitfield backs the following members:
             * - EventRecordSeverity
             * - PermanentCondition
             * - MaintenanceNeeded
             * - PerformanceDegraded
             * - HardwareReplacementNeeded
             * - MaintenanceOperationSubclassValid
             * - LdIdValid
             * - HeadIdValid
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
            EventRecordSeverity {
                get => (this._bitfield >> 0) & 0x3
                set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
            }

            /**
             * @type {Integer}
             */
            PermanentCondition {
                get => (this._bitfield >> 2) & 0x1
                set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
            }

            /**
             * @type {Integer}
             */
            MaintenanceNeeded {
                get => (this._bitfield >> 3) & 0x1
                set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
            }

            /**
             * @type {Integer}
             */
            PerformanceDegraded {
                get => (this._bitfield >> 4) & 0x1
                set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
            }

            /**
             * @type {Integer}
             */
            HardwareReplacementNeeded {
                get => (this._bitfield >> 5) & 0x1
                set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
            }

            /**
             * @type {Integer}
             */
            MaintenanceOperationSubclassValid {
                get => (this._bitfield >> 6) & 0x1
                set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
            }

            /**
             * @type {Integer}
             */
            LdIdValid {
                get => (this._bitfield >> 7) & 0x1
                set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
            }

            /**
             * @type {Integer}
             */
            HeadIdValid {
                get => (this._bitfield >> 8) & 0x1
                set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
            }
        }

        /**
         * @type {_bits}
         */
        bits {
            get {
                if(!this.HasProp("__bits"))
                    this.__bits := CXL_COMMON_EVENT_RECORD_HEADER._EventRecordFlags._bits(0, this)
                return this.__bits
            }
        }

        /**
         * @type {Integer}
         */
        AsUshort {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    }

    /**
     * @type {Guid}
     */
    EventRecordIdentifier {
        get {
            if(!this.HasProp("__EventRecordIdentifier"))
                this.__EventRecordIdentifier := Guid(0, this)
            return this.__EventRecordIdentifier
        }
    }

    /**
     * @type {Integer}
     */
    EventRecordLength {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {_EventRecordFlags}
     */
    EventRecordFlags {
        get {
            if(!this.HasProp("__EventRecordFlags"))
                this.__EventRecordFlags := CXL_COMMON_EVENT_RECORD_HEADER._EventRecordFlags(17, this)
            return this.__EventRecordFlags
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }

    /**
     * @type {Integer}
     */
    EventRecordHandle {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    RelatedEventRecordHandle {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {Integer}
     */
    EventRecordTimestamp {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    MaintenanceOperationClass {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    MaintenanceOperationSubclass {
        get => NumGet(this, 33, "char")
        set => NumPut("char", value, this, 33)
    }

    /**
     * @type {Integer}
     */
    LdId {
        get => NumGet(this, 34, "ushort")
        set => NumPut("ushort", value, this, 34)
    }

    /**
     * @type {Integer}
     */
    HeadId {
        get => NumGet(this, 36, "char")
        set => NumPut("char", value, this, 36)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved1 {
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 37, 11, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }
}
