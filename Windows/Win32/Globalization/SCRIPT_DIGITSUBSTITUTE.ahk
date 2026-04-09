#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains native digit and digit substitution settings.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_digitsubstitute
 * @namespace Windows.Win32.Globalization
 */
class SCRIPT_DIGITSUBSTITUTE extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - NationalDigitLanguage
     * - TraditionalDigitLanguage
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NationalDigitLanguage {
        get => (this._bitfield1 >> 0) & 0xFFFF
        set => this._bitfield1 := ((value & 0xFFFF) << 0) | (this._bitfield1 & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    TraditionalDigitLanguage {
        get => (this._bitfield1 >> 16) & 0xFFFF
        set => this._bitfield1 := ((value & 0xFFFF) << 16) | (this._bitfield1 & ~(0xFFFF << 16))
    }

    /**
     * This bitfield backs the following members:
     * - DigitSubstitute
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    DigitSubstitute {
        get => (this._bitfield2 >> 0) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 0) | (this._bitfield2 & ~(0xFF << 0))
    }

    /**
     * Reserved; initialize to 0.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
