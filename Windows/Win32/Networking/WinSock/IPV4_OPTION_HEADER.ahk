#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IPV4_OPTION_HEADER extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    /**
     * @type {Integer}
     */
    OptionType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - OptionNumber
     * - OptionClass
     * - CopiedFlag
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    OptionNumber {
        get => (this._bitfield >> 0) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    OptionClass {
        get => (this._bitfield >> 5) & 0x3
        set => this._bitfield := ((value & 0x3) << 5) | (this._bitfield & ~(0x3 << 5))
    }

    /**
     * @type {Integer}
     */
    CopiedFlag {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    OptionLength {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }
}
