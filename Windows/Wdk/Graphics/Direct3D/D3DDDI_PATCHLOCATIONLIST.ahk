#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_PATCHLOCATIONLIST {
    #StructPack 4

    AllocationIndex : UInt32

    /**
     * This bitfield backs the following members:
     * - SlotId
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    SlotId {
        get => (this._bitfield >> 0) & 0xFFFFFF
        set => this._bitfield := ((value & 0xFFFFFF) << 0) | (this._bitfield & ~(0xFFFFFF << 0))
    }
    DriverId : UInt32

    AllocationOffset : UInt32

    PatchOffset : UInt32

    SplitOffset : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
