#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct BUS_SPECIFIC_RESET_FLAGS {
    #StructPack 8


    struct _u {
        /**
         * This bitfield backs the following members:
         * - KeepStackReset
         * - Reserved
         */
        _bitfield : Int64


        /**
         * @type {Integer}
         */
        KeepStackReset {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    u : BUS_SPECIFIC_RESET_FLAGS._u

    static __New() {
        DefineProp(this.Prototype, 'AsUlonglong', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
