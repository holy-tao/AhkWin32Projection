#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PERSISTENCE_INFO {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - Signature
     * - Length
     * - Identifier
     * - Attributes
     * - DoNotLog
     * - Reserved
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    Signature {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Length {
        get => (this._bitfield >> 16) & 0xFFFFFF
        set => this._bitfield := ((value & 0xFFFFFF) << 16) | (this._bitfield & ~(0xFFFFFF << 16))
    }

    /**
     * @type {Integer}
     */
    Identifier {
        get => (this._bitfield >> 40) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 40) | (this._bitfield & ~(0xFFFF << 40))
    }

    /**
     * @type {Integer}
     */
    Attributes {
        get => (this._bitfield >> 56) & 0x3
        set => this._bitfield := ((value & 0x3) << 56) | (this._bitfield & ~(0x3 << 56))
    }

    /**
     * @type {Integer}
     */
    DoNotLog {
        get => (this._bitfield >> 58) & 0x1
        set => this._bitfield := ((value & 0x1) << 58) | (this._bitfield & ~(0x1 << 58))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONGLONG', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
