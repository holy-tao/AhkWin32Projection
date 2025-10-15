#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ADMIN_COMPLETION_QUEUE_BASE_ADDRESS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - ACQB
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
        get => (this._bitfield >> 0) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 0) | (this._bitfield & ~(0xFFF << 0))
    }

    /**
     * @type {Integer}
     */
    ACQB {
        get => (this._bitfield >> 12) & 0xFFFFFFFFFFFFF
        set => this._bitfield := ((value & 0xFFFFFFFFFFFFF) << 12) | (this._bitfield & ~(0xFFFFFFFFFFFFF << 12))
    }

    /**
     * @type {Integer}
     */
    AsUlonglong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
