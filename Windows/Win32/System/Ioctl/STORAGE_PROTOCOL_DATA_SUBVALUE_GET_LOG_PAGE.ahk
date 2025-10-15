#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_PROTOCOL_DATA_SUBVALUE_GET_LOG_PAGE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - RetainAsynEvent
     * - LogSpecificField
     * - Reserved0
     * - UUIDIndex
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
    RetainAsynEvent {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    LogSpecificField {
        get => (this._bitfield >> 1) & 0xF
        set => this._bitfield := ((value & 0xF) << 1) | (this._bitfield & ~(0xF << 1))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 5) & 0x7
        set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
    }

    /**
     * @type {Integer}
     */
    UUIDIndex {
        get => (this._bitfield >> 8) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 8) | (this._bitfield & ~(0x7F << 8))
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => (this._bitfield >> 15) & 0x1FFFF
        set => this._bitfield := ((value & 0x1FFFF) << 15) | (this._bitfield & ~(0x1FFFF << 15))
    }

    /**
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
