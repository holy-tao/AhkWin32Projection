#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw10_get_features
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW10_GET_FEATURES extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - FID
     * - SEL
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
    FID {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    SEL {
        get => (this._bitfield >> 8) & 0x7
        set => this._bitfield := ((value & 0x7) << 8) | (this._bitfield & ~(0x7 << 8))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 11) & 0x1FFFFF
        set => this._bitfield := ((value & 0x1FFFFF) << 11) | (this._bitfield & ~(0x1FFFFF << 11))
    }

    /**
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
