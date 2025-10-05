#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_IMPORT_CONTROL_TRANSFER_DYNAMIC_RELOCATION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - PageRelativeOffset
     * - IndirectCall
     * - IATIndex
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PageRelativeOffset {
        get => (this._bitfield >> 0) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 0) | (this._bitfield & ~(0xFFF << 0))
    }

    /**
     * @type {Integer}
     */
    IndirectCall {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * @type {Integer}
     */
    IATIndex {
        get => (this._bitfield >> 13) & 0x7FFFF
        set => this._bitfield := ((value & 0x7FFFF) << 13) | (this._bitfield & ~(0x7FFFF << 13))
    }
}
