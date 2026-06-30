#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_ROOT_BUS_OSC_SUPPORT_FIELD extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    class _u extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - ExtendedConfigOpRegions
         * - ActiveStatePowerManagement
         * - ClockPowerManagement
         * - SegmentGroups
         * - MessageSignaledInterrupts
         * - OptimizedBufferFlushAndFill
         * - AspmOptionality
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        ExtendedConfigOpRegions {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        ActiveStatePowerManagement {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        ClockPowerManagement {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        SegmentGroups {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        MessageSignaledInterrupts {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        OptimizedBufferFlushAndFill {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }

        /**
         * @type {Integer}
         */
        AspmOptionality {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }

        /**
         * @type {Integer}
         */
        AsULONG {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    }

    /**
     * @type {_u}
     */
    u {
        get {
            if(!this.HasProp("__u"))
                this.__u := PCI_ROOT_BUS_OSC_SUPPORT_FIELD._u(0, this)
            return this.__u
        }
    }
}
