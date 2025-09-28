#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMAGE_COR_ILMETHOD_FAT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - Flags
     * - Size
     * - MaxStack
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => (this._bitfield >> 0) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 0) | (this._bitfield & ~(0xFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Size {
        get => (this._bitfield >> 12) & 0xF
        set => this._bitfield := ((value & 0xF) << 12) | (this._bitfield & ~(0xF << 12))
    }

    /**
     * @type {Integer}
     */
    MaxStack {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }

    /**
     * @type {Integer}
     */
    CodeSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    LocalVarSigTok {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
