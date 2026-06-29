#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_FLIPMANAGER_PRESENTHISTORYTOKEN {
    #StructPack 8


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - Discard
         * - PresentAt
         * - hPrivateDataIsPointer
         * - Reserved
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        Discard {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        PresentAt {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        hPrivateDataIsPointer {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
        static __New() {
            DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    hPrivateData : Int64

    PresentAtQpc : Int64

    Flags : D3DKMT_FLIPMANAGER_PRESENTHISTORYTOKEN._Flags

}
