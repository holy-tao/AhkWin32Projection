#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class DDELN extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - unused
     * - fRelease
     * - fDeferUpd
     * - fAckReq
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    unused {
        get => (this._bitfield >> 0) & 0x1FFF
        set => this._bitfield := ((value & 0x1FFF) << 0) | (this._bitfield & ~(0x1FFF << 0))
    }

    /**
     * @type {Integer}
     */
    fRelease {
        get => (this._bitfield >> 13) & 0x1
        set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
    }

    /**
     * @type {Integer}
     */
    fDeferUpd {
        get => (this._bitfield >> 14) & 0x1
        set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
    }

    /**
     * @type {Integer}
     */
    fAckReq {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * @type {Integer}
     */
    cfFormat {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }
}
