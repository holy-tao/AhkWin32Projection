#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_ALLOCATIONINFO {
    #StructPack 8


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - Primary
         * - Stereo
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

        /**
         * @type {Integer}
         */
        Stereo {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
        static __New() {
            DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    hAllocation : UInt32

    pSystemMem : IntPtr

    pPrivateDriverData : IntPtr

    PrivateDriverDataSize : UInt32

    VidPnSourceId : UInt32

    Flags : D3DDDI_ALLOCATIONINFO._Flags

}
