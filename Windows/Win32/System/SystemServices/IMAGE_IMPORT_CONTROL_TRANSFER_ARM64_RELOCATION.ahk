#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_IMPORT_CONTROL_TRANSFER_ARM64_RELOCATION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - PageRelativeOffset
     * - IndirectCall
     * - RegisterIndex
     * - ImportType
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
        get => (this._bitfield >> 0) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 0) | (this._bitfield & ~(0x3FF << 0))
    }

    /**
     * @type {Integer}
     */
    IndirectCall {
        get => (this._bitfield >> 10) & 0x1
        set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
    }

    /**
     * @type {Integer}
     */
    RegisterIndex {
        get => (this._bitfield >> 11) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 11) | (this._bitfield & ~(0x1F << 11))
    }

    /**
     * @type {Integer}
     */
    ImportType {
        get => (this._bitfield >> 16) & 0x1
        set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
    }

    /**
     * @type {Integer}
     */
    IATIndex {
        get => (this._bitfield >> 17) & 0x7FFF
        set => this._bitfield := ((value & 0x7FFF) << 17) | (this._bitfield & ~(0x7FFF << 17))
    }
}
