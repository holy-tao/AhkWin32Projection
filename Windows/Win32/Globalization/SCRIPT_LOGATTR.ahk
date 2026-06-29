#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains attributes of logical characters that are useful when editing and formatting text.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_logattr
 * @namespace Windows.Win32.Globalization
 */
export default struct SCRIPT_LOGATTR {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - fSoftBreak
     * - fWhiteSpace
     * - fCharStop
     * - fWordStop
     * - fInvalid
     * - fReserved
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    fSoftBreak {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    fWhiteSpace {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    fCharStop {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    fWordStop {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    fInvalid {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    fReserved {
        get => (this._bitfield >> 5) & 0x7
        set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
    }
}
