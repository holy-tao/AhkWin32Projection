#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW11_FEATURE_READONLY_WRITETHROUGH_MODE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - EOLBehavior
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
        get => (this._bitfield >> 0) & 0x3FFFFFFF
        set => this._bitfield := ((value & 0x3FFFFFFF) << 0) | (this._bitfield & ~(0x3FFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    EOLBehavior {
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
