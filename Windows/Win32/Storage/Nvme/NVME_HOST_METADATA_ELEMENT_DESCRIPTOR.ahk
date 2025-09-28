#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_HOST_METADATA_ELEMENT_DESCRIPTOR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - ET
     * - Reserved0
     * - ER
     * - Reserved1
     * - ELEN
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ET {
        get => (this._bitfield >> 0) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 0) | (this._bitfield & ~(0x3F << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 6) & 0x3
        set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
    }

    /**
     * @type {Integer}
     */
    ER {
        get => (this._bitfield >> 8) & 0xF
        set => this._bitfield := ((value & 0xF) << 8) | (this._bitfield & ~(0xF << 8))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 12) & 0xF
        set => this._bitfield := ((value & 0xF) << 12) | (this._bitfield & ~(0xF << 12))
    }

    /**
     * @type {Integer}
     */
    ELEN {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }

    /**
     * @type {Array<Byte>}
     */
    EVAL{
        get {
            if(!this.HasProp("__EVALProxyArray"))
                this.__EVALProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__EVALProxyArray
        }
    }
}
