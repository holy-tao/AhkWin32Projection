#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_ROOT_BUS_OSC_SUPPORT_FIELD {
    #StructPack 4


    struct _u {
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
         */
        _bitfield : Int32


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
        static __New() {
            DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    u : PCI_ROOT_BUS_OSC_SUPPORT_FIELD._u

}
