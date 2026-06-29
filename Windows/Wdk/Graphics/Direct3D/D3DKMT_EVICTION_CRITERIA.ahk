#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_EVICTION_CRITERIA {
    #StructPack 8


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - Primary
         * - Reserved
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        Primary {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    MinimumSize : Int64

    MaximumSize : Int64

    Flags : D3DKMT_EVICTION_CRITERIA._Flags

    static __New() {
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 16 })
        this.DeleteProp("__New")
    }
}
