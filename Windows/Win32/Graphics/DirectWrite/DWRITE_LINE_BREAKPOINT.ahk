#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Line breakpoint characteristics of a character.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ns-dwrite-dwrite_line_breakpoint
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_LINE_BREAKPOINT extends Win32Struct
{
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
     * Type: <b>UINT8</b>
     * 
     * Indicates a breaking condition before the character.
     * @type {Integer}
     */
    breakConditionBefore {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * Type: <b>UINT8</b>
     * 
     * Indicates a breaking condition after the character.
     * @type {Integer}
     */
    breakConditionAfter {
        get => (this._bitfield >> 2) & 0x3
        set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
    }

    /**
     * Type: <b>UINT8</b>
     * 
     * Indicates that the character is some form of whitespace, which may be meaningful for justification.
     * @type {Integer}
     */
    isWhitespace {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * Type: <b>UINT8</b>
     * 
     * Indicates that the character is a soft hyphen, often used to indicate hyphenation points inside words.
     * @type {Integer}
     */
    isSoftHyphen {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * Type: <b>UINT8</b>
     * 
     * Reserved for future use.
     * @type {Integer}
     */
    padding {
        get => (this._bitfield >> 6) & 0x3
        set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
    }
}
