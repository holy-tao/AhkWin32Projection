#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CANCEL_PRESENTS_FLAGS {
    #StructPack 4


    struct _ReprogramInterrupt {
        /**
         * This bitfield backs the following members:
         * - NewVSyncInterruptState
         * - Reserved
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        NewVSyncInterruptState {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    ReprogramInterrupt : D3DKMT_CANCEL_PRESENTS_FLAGS._ReprogramInterrupt

    static __New() {
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
