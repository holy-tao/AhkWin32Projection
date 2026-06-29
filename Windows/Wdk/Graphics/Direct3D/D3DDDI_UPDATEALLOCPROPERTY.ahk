#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_UPDATEALLOCPROPERTY {
    #StructPack 8

    hPagingQueue : UInt32

    hAllocation : UInt32

    SupportedSegmentSet : UInt32

    PreferredSegment : IntPtr

    Flags : IntPtr

    PagingFenceValue : Int64

    /**
     * This bitfield backs the following members:
     * - SetAccessedPhysically
     * - SetSupportedSegmentSet
     * - SetPreferredSegment
     * - SetUnmoveable
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    SetAccessedPhysically {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    SetSupportedSegmentSet {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    SetPreferredSegment {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    SetUnmoveable {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }
    static __New() {
        DefineProp(this.Prototype, 'PropertyMaskValue', { type: UInt32, offset: 40 })
        this.DeleteProp("__New")
    }
}
