#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_GET_FEATURE_TIMESTAMP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - Timestamp
     * - Synch
     * - Origin
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Timestamp {
        get => (this._bitfield >> 0) & 0xFFFFFFFFFFFF
        set => this._bitfield := ((value & 0xFFFFFFFFFFFF) << 0) | (this._bitfield & ~(0xFFFFFFFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Synch {
        get => (this._bitfield >> 48) & 0x1
        set => this._bitfield := ((value & 0x1) << 48) | (this._bitfield & ~(0x1 << 48))
    }

    /**
     * @type {Integer}
     */
    Origin {
        get => (this._bitfield >> 49) & 0x7
        set => this._bitfield := ((value & 0x7) << 49) | (this._bitfield & ~(0x7 << 49))
    }

    /**
     * @type {Integer}
     */
    AsUlonglong {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
