#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_admin_queue_attributes
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ADMIN_QUEUE_ATTRIBUTES extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - ASQS
     * - Reserved0
     * - ACQS
     * - Reserved1
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ASQS {
        get => (this._bitfield >> 0) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 0) | (this._bitfield & ~(0xFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 12) & 0xF
        set => this._bitfield := ((value & 0xF) << 12) | (this._bitfield & ~(0xF << 12))
    }

    /**
     * @type {Integer}
     */
    ACQS {
        get => (this._bitfield >> 16) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 16) | (this._bitfield & ~(0xFFF << 16))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 28) & 0xF
        set => this._bitfield := ((value & 0xF) << 28) | (this._bitfield & ~(0xF << 28))
    }

    /**
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
