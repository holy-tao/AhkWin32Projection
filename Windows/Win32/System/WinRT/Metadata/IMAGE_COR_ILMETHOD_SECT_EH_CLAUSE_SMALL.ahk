#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - Flags
     * - TryOffset
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => (this._bitfield1 >> 0) & 0xFFFF
        set => this._bitfield1 := ((value & 0xFFFF) << 0) | (this._bitfield1 & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    TryOffset {
        get => (this._bitfield1 >> 16) & 0xFFFF
        set => this._bitfield1 := ((value & 0xFFFF) << 16) | (this._bitfield1 & ~(0xFFFF << 16))
    }

    /**
     * This bitfield backs the following members:
     * - TryLength
     * - HandlerOffset
     * - HandlerLength
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    TryLength {
        get => (this._bitfield2 >> 0) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 0) | (this._bitfield2 & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    HandlerOffset {
        get => (this._bitfield2 >> 8) & 0xFFFF
        set => this._bitfield2 := ((value & 0xFFFF) << 8) | (this._bitfield2 & ~(0xFFFF << 8))
    }

    /**
     * @type {Integer}
     */
    HandlerLength {
        get => (this._bitfield2 >> 24) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 24) | (this._bitfield2 & ~(0xFF << 24))
    }

    /**
     * @type {Integer}
     */
    ClassToken {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    FilterOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
