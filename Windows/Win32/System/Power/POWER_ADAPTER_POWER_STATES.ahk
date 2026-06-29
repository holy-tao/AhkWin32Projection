#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct POWER_ADAPTER_POWER_STATES {
    #StructPack 4


    struct _States {
        /**
         * This bitfield backs the following members:
         * - Online
         * - RecState
         * - Reserved
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        Online {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        RecState {
            get => (this._bitfield >> 1) & 0x3
            set => this._bitfield := ((value & 0x3) << 1) | (this._bitfield & ~(0x3 << 1))
        }
    }

    States : POWER_ADAPTER_POWER_STATES._States

    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
