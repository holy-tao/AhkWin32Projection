#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains native digit and digit substitution settings.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_digitsubstitute
 * @namespace Windows.Win32.Globalization
 */
export default struct SCRIPT_DIGITSUBSTITUTE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - NationalDigitLanguage
     * - TraditionalDigitLanguage
     */
    _bitfield1 : Int32


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
     */
    _bitfield2 : Int32


    /**
     * @type {Integer}
     */
    DigitSubstitute {
        get => (this._bitfield2 >> 0) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 0) | (this._bitfield2 & ~(0xFF << 0))
    }
    /**
     * Reserved; initialize to 0.
     */
    dwReserved : UInt32

}
