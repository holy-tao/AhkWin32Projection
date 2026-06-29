#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_XPF_PROCESSOR_ERROR_SECTION_VALIDBITS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - LocalAPICId
     * - CpuId
     * - ProcInfoCount
     * - ContextInfoCount
     * - Reserved
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    LocalAPICId {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    CpuId {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    ProcInfoCount {
        get => (this._bitfield >> 2) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 2) | (this._bitfield & ~(0x3F << 2))
    }

    /**
     * @type {Integer}
     */
    ContextInfoCount {
        get => (this._bitfield >> 8) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 8) | (this._bitfield & ~(0x3F << 8))
    }
    static __New() {
        DefineProp(this.Prototype, 'ValidBits', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
