#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class NDR64_USER_MARSHAL_FLAGS extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * This bitfield backs the following members:
     * - Reserved
     * - IID
     * - RefPointer
     * - UniquePointer
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => (this._bitfield >> 0) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    IID {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    RefPointer {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    UniquePointer {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }
}
