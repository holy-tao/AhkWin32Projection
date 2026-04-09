#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Line breakpoint characteristics of a character.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_line_breakpoint
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_LINE_BREAKPOINT extends Win32Struct {
    static sizeof => 1

    static packingSize => 1

    /**
     * This bitfield backs the following members:
     * - breakConditionBefore
     * - breakConditionAfter
     * - isWhitespace
     * - isSoftHyphen
     * - padding
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    breakConditionBefore {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    breakConditionAfter {
        get => (this._bitfield >> 2) & 0x3
        set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
    }

    /**
     * @type {Integer}
     */
    isWhitespace {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    isSoftHyphen {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    padding {
        get => (this._bitfield >> 6) & 0x3
        set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
    }
}
