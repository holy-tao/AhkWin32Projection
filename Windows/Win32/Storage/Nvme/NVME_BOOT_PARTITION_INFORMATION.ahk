#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_BOOT_PARTITION_INFORMATION extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - BPSZ
     * - Reserved0
     * - BRS
     * - Reserved1
     * - ABPID
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    BPSZ {
        get => (this._bitfield >> 0) & 0x7FFF
        set => this._bitfield := ((value & 0x7FFF) << 0) | (this._bitfield & ~(0x7FFF << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 15) & 0x1FF
        set => this._bitfield := ((value & 0x1FF) << 15) | (this._bitfield & ~(0x1FF << 15))
    }

    /**
     * @type {Integer}
     */
    BRS {
        get => (this._bitfield >> 24) & 0x3
        set => this._bitfield := ((value & 0x3) << 24) | (this._bitfield & ~(0x3 << 24))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 26) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 26) | (this._bitfield & ~(0x1F << 26))
    }

    /**
     * @type {Integer}
     */
    ABPID {
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
