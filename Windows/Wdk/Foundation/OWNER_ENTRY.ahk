#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct OWNER_ENTRY {
    #StructPack 8

    OwnerThread : IntPtr

    /**
     * This bitfield backs the following members:
     * - IoPriorityBoosted
     * - OwnerReferenced
     * - IoQoSPriorityBoosted
     * - OwnerCount
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    IoPriorityBoosted {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    OwnerReferenced {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    IoQoSPriorityBoosted {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    OwnerCount {
        get => (this._bitfield >> 3) & 0x1FFFFFFF
        set => this._bitfield := ((value & 0x1FFFFFFF) << 3) | (this._bitfield & ~(0x1FFFFFFF << 3))
    }
    static __New() {
        DefineProp(this.Prototype, 'TableSize', { type: UInt32, offset: 8 })
        this.DeleteProp("__New")
    }
}
