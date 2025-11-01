#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw12_read_write
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW12_READ_WRITE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - NLB
     * - Reserved0
     * - DTYPE
     * - Reserved1
     * - PRINFO
     * - FUA
     * - LR
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NLB {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 16) & 0xF
        set => this._bitfield := ((value & 0xF) << 16) | (this._bitfield & ~(0xF << 16))
    }

    /**
     * @type {Integer}
     */
    DTYPE {
        get => (this._bitfield >> 20) & 0xF
        set => this._bitfield := ((value & 0xF) << 20) | (this._bitfield & ~(0xF << 20))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 24) & 0x3
        set => this._bitfield := ((value & 0x3) << 24) | (this._bitfield & ~(0x3 << 24))
    }

    /**
     * @type {Integer}
     */
    PRINFO {
        get => (this._bitfield >> 26) & 0xF
        set => this._bitfield := ((value & 0xF) << 26) | (this._bitfield & ~(0xF << 26))
    }

    /**
     * @type {Integer}
     */
    FUA {
        get => (this._bitfield >> 30) & 0x1
        set => this._bitfield := ((value & 0x1) << 30) | (this._bitfield & ~(0x1 << 30))
    }

    /**
     * @type {Integer}
     */
    LR {
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
