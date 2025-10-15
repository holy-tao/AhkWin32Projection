#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW11_FEATURE_ENABLE_IEEE1667_SILO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - Enable
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 0) & 0x7FFFFFFF
        set => this._bitfield := ((value & 0x7FFFFFFF) << 0) | (this._bitfield & ~(0x7FFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Enable {
        get => (this._bitfield >> 31) & 0x1
        set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
    }

    /**
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
