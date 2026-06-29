#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a single character in a run (input string). The information indicates if the character glyph is affected by surrounding letters of the run.
 * @remarks
 * One or more characters in a run, immediately preceding and/or following the letter being shaped, can influence shaping. Information about these characters can help optimize higher-level layout code, such as that used to optimize paragraph layout.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_charprop
 * @namespace Windows.Win32.Globalization
 */
export default struct SCRIPT_CHARPROP {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - fCanGlyphAlone
     * - reserved
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    fCanGlyphAlone {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 1) & 0x7FFF
        set => this._bitfield := ((value & 0x7FFF) << 1) | (this._bitfield & ~(0x7FFF << 1))
    }
}
