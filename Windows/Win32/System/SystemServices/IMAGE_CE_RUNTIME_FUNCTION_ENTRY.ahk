#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_CE_RUNTIME_FUNCTION_ENTRY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    FuncStart {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - PrologLen
     * - FuncLen
     * - ThirtyTwoBit
     * - ExceptionFlag
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    PrologLen {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    FuncLen {
        get => (this._bitfield >> 8) & 0x3FFFFF
        set => this._bitfield := ((value & 0x3FFFFF) << 8) | (this._bitfield & ~(0x3FFFFF << 8))
    }

    /**
     * @type {Integer}
     */
    ThirtyTwoBit {
        get => (this._bitfield >> 30) & 0x1
        set => this._bitfield := ((value & 0x1) << 30) | (this._bitfield & ~(0x1 << 30))
    }

    /**
     * @type {Integer}
     */
    ExceptionFlag {
        get => (this._bitfield >> 31) & 0x1
        set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
    }
}
