#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW10_RESERVATION_REGISTER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - RREGA
     * - IEKEY
     * - Reserved
     * - CPTPL
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    RREGA {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    IEKEY {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => (this._bitfield >> 4) & 0x3FFFFFF
        set => this._bitfield := ((value & 0x3FFFFFF) << 4) | (this._bitfield & ~(0x3FFFFFF << 4))
    }

    /**
     * @type {Integer}
     */
    CPTPL {
        get => (this._bitfield >> 30) & 0x3
        set => this._bitfield := ((value & 0x3) << 30) | (this._bitfield & ~(0x3 << 30))
    }

    /**
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
