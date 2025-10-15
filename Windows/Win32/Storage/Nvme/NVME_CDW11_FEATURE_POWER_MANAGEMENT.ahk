#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW11_FEATURE_POWER_MANAGEMENT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - PS
     * - Reserved0
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PS {
        get => (this._bitfield >> 0) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 5) & 0x7FFFFFF
        set => this._bitfield := ((value & 0x7FFFFFF) << 5) | (this._bitfield & ~(0x7FFFFFF << 5))
    }

    /**
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
