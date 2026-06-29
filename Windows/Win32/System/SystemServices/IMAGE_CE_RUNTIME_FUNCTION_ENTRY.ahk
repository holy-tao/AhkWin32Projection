#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_CE_RUNTIME_FUNCTION_ENTRY {
    #StructPack 4

    FuncStart : UInt32

    /**
     * This bitfield backs the following members:
     * - PrologLen
     * - FuncLen
     * - ThirtyTwoBit
     * - ExceptionFlag
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    PrologLen {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    FuncLen {
        get => (this._bitfield >> 8) & 0x3FFFFF
        set => this._bitfield := ((value & 0x3FFFFF) << 8) | (this._bitfield & ~(0x3FFFFF << 8))
    }

    /**
     * @type {Integer}
     */
    ThirtyTwoBit {
        get => (this._bitfield >> 30) & 0x1
        set => this._bitfield := ((value & 0x1) << 30) | (this._bitfield & ~(0x1 << 30))
    }

    /**
     * @type {Integer}
     */
    ExceptionFlag {
        get => (this._bitfield >> 31) & 0x1
        set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
    }
}
