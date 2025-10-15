#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPV4_OPTION_HEADER.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IPV4_TIMESTAMP_OPTION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {IPV4_OPTION_HEADER}
     */
    OptionHeader{
        get {
            if(!this.HasProp("__OptionHeader"))
                this.__OptionHeader := IPV4_OPTION_HEADER(this.ptr + 0)
            return this.__OptionHeader
        }
    }

    /**
     * @type {Integer}
     */
    Pointer {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    FlagsOverflow {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * This bitfield backs the following members:
     * - Flags
     * - Overflow
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    Overflow {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }
}
