#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class RATING_SYSTEM extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    rating_system_id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - rating_system_is_age_type
     * - reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    rating_system_is_age_type {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 1) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
    }

    /**
     * @type {Array<Byte>}
     */
    country_code{
        get {
            if(!this.HasProp("__country_codeProxyArray"))
                this.__country_codeProxyArray := Win32FixedArray(this.ptr + 9, 3, Primitive, "char")
            return this.__country_codeProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    rating_attribute_count {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Pointer<RATING_ATTRIBUTE>}
     */
    lpratingattrib {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
