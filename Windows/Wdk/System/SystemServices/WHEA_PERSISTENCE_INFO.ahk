#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_PERSISTENCE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * This bitfield backs the following members:
     * - Signature
     * - Length
     * - Identifier
     * - Attributes
     * - DoNotLog
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
    Signature {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Length {
        get => (this._bitfield >> 16) & 0xFFFFFF
        set => this._bitfield := ((value & 0xFFFFFF) << 16) | (this._bitfield & ~(0xFFFFFF << 16))
    }

    /**
     * @type {Integer}
     */
    Identifier {
        get => (this._bitfield >> 40) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 40) | (this._bitfield & ~(0xFFFF << 40))
    }

    /**
     * @type {Integer}
     */
    Attributes {
        get => (this._bitfield >> 56) & 0x3
        set => this._bitfield := ((value & 0x3) << 56) | (this._bitfield & ~(0x3 << 56))
    }

    /**
     * @type {Integer}
     */
    DoNotLog {
        get => (this._bitfield >> 58) & 0x1
        set => this._bitfield := ((value & 0x1) << 58) | (this._bitfield & ~(0x1 << 58))
    }

    /**
     * @type {Integer}
     */
    AsULONGLONG {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
