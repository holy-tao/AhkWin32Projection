#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY_XDATA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    HeaderData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - FunctionLength
     * - Version
     * - ExceptionDataPresent
     * - EpilogInHeader
     * - EpilogCount
     * - CodeWords
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    FunctionLength {
        get => (this._bitfield >> 0) & 0x3FFFF
        set => this._bitfield := ((value & 0x3FFFF) << 0) | (this._bitfield & ~(0x3FFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Version {
        get => (this._bitfield >> 18) & 0x3
        set => this._bitfield := ((value & 0x3) << 18) | (this._bitfield & ~(0x3 << 18))
    }

    /**
     * @type {Integer}
     */
    ExceptionDataPresent {
        get => (this._bitfield >> 20) & 0x1
        set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
    }

    /**
     * @type {Integer}
     */
    EpilogInHeader {
        get => (this._bitfield >> 21) & 0x1
        set => this._bitfield := ((value & 0x1) << 21) | (this._bitfield & ~(0x1 << 21))
    }

    /**
     * @type {Integer}
     */
    EpilogCount {
        get => (this._bitfield >> 22) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 22) | (this._bitfield & ~(0x1F << 22))
    }

    /**
     * @type {Integer}
     */
    CodeWords {
        get => (this._bitfield >> 27) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 27) | (this._bitfield & ~(0x1F << 27))
    }
}
