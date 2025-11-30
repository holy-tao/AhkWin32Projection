#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_TIMESTAMP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * This bitfield backs the following members:
     * - Seconds
     * - Minutes
     * - Hours
     * - Precise
     * - Reserved
     * - Day
     * - Month
     * - Year
     * - Century
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Seconds {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    Minutes {
        get => (this._bitfield >> 8) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
    }

    /**
     * @type {Integer}
     */
    Hours {
        get => (this._bitfield >> 16) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 16) | (this._bitfield & ~(0xFF << 16))
    }

    /**
     * @type {Integer}
     */
    Precise {
        get => (this._bitfield >> 24) & 0x1
        set => this._bitfield := ((value & 0x1) << 24) | (this._bitfield & ~(0x1 << 24))
    }

    /**
     * @type {Integer}
     */
    Day {
        get => (this._bitfield >> 32) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 32) | (this._bitfield & ~(0xFF << 32))
    }

    /**
     * @type {Integer}
     */
    Month {
        get => (this._bitfield >> 40) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 40) | (this._bitfield & ~(0xFF << 40))
    }

    /**
     * @type {Integer}
     */
    Year {
        get => (this._bitfield >> 48) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 48) | (this._bitfield & ~(0xFF << 48))
    }

    /**
     * @type {Integer}
     */
    Century {
        get => (this._bitfield >> 56) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 56) | (this._bitfield & ~(0xFF << 56))
    }

    /**
     * @type {Integer}
     */
    AsLARGE_INTEGER {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
