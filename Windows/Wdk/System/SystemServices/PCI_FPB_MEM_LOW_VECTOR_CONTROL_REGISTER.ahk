#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_FPB_MEM_LOW_VECTOR_CONTROL_REGISTER {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - MemLowDecodeMechanismEnable
     * - Rsvd0
     * - MemLowVectorGranularity
     * - Rsvd1
     * - MemLowVectorStart
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    MemLowDecodeMechanismEnable {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Rsvd0 {
        get => (this._bitfield >> 1) & 0x7
        set => this._bitfield := ((value & 0x7) << 1) | (this._bitfield & ~(0x7 << 1))
    }

    /**
     * @type {Integer}
     */
    MemLowVectorGranularity {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }

    /**
     * @type {Integer}
     */
    Rsvd1 {
        get => (this._bitfield >> 8) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 8) | (this._bitfield & ~(0xFFF << 8))
    }

    /**
     * @type {Integer}
     */
    MemLowVectorStart {
        get => (this._bitfield >> 20) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 20) | (this._bitfield & ~(0xFFF << 20))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
