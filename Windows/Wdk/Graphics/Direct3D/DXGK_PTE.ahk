#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_PTE {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - Valid
     * - Zero
     * - CacheCoherent
     * - ReadOnly
     * - NoExecute
     * - Segment
     * - LargePage
     * - PhysicalAdapterIndex
     * - PageTablePageSize
     * - SystemReserved0
     * - Reserved
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    Valid {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Zero {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    CacheCoherent {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    ReadOnly {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    NoExecute {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    Segment {
        get => (this._bitfield >> 5) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 5) | (this._bitfield & ~(0x1F << 5))
    }

    /**
     * @type {Integer}
     */
    LargePage {
        get => (this._bitfield >> 10) & 0x1
        set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
    }

    /**
     * @type {Integer}
     */
    PhysicalAdapterIndex {
        get => (this._bitfield >> 11) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 11) | (this._bitfield & ~(0x3F << 11))
    }

    /**
     * @type {Integer}
     */
    PageTablePageSize {
        get => (this._bitfield >> 17) & 0x3
        set => this._bitfield := ((value & 0x3) << 17) | (this._bitfield & ~(0x3 << 17))
    }

    /**
     * @type {Integer}
     */
    SystemReserved0 {
        get => (this._bitfield >> 19) & 0x1
        set => this._bitfield := ((value & 0x1) << 19) | (this._bitfield & ~(0x1 << 19))
    }
    PageAddress : Int64

    static __New() {
        DefineProp(this.Prototype, 'Flags', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'PageTableAddress', { type: Int64, offset: 8 })
        this.DeleteProp("__New")
    }
}
