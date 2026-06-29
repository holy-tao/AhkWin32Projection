#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_ROOT_BUS_OSC_CONTROL_FIELD {
    #StructPack 4


    struct _u {
        /**
         * This bitfield backs the following members:
         * - ExpressNativeHotPlug
         * - ShpcNativeHotPlug
         * - ExpressNativePME
         * - ExpressAdvancedErrorReporting
         * - ExpressCapabilityStructure
         * - LatencyToleranceReporting
         * - Reserved
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        ExpressNativeHotPlug {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        ShpcNativeHotPlug {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        ExpressNativePME {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        ExpressAdvancedErrorReporting {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        ExpressCapabilityStructure {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        LatencyToleranceReporting {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    u : PCI_ROOT_BUS_OSC_CONTROL_FIELD._u

}
