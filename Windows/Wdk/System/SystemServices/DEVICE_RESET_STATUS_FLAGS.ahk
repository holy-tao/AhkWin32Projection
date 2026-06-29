#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEVICE_RESET_STATUS_FLAGS {
    #StructPack 8


    struct _u {
        /**
         * This bitfield backs the following members:
         * - KeepStackReset
         * - RecoveringFromBusError
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

        /**
         * @type {Integer}
         */
        RecoveringFromBusError {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    }

    u : DEVICE_RESET_STATUS_FLAGS._u

    static __New() {
        DefineProp(this.Prototype, 'AsUlonglong', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
