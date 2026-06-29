#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about special processing for each script.
 * @remarks
 * This structure is filled by the <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptgetproperties">ScriptGetProperties</a> function.
 * 
 * Many Uniscribe scripts do not correspond directly to 8-bit character sets. When some of the characters in a script are supported by more than one character set, the <b>fAmbiguousCharSet</b> member is set. The application should do further processing to determine the character set to use when requesting a font suitable for the run. For example, it might determine that the run consists of multiple languages and split the run so that a different font is used for each language.
 * 
 * The application uses the following code during initialization to get a pointer to the <b>SCRIPT_PROPERTIES</b>  array.
 * 
 * 
 * ```cpp
 * const SCRIPT_PROPERTIES **ppScriptProperties; // Array of pointers  
 *                                               // to properties 
 * int iMaxScript;
 * HRESULT hr;
 * 
 * hr = ScriptGetProperties(&ppScriptProperties, &iMaxScript);
 * 
 * ```
 * 
 * 
 * Then the application can inspect the properties of the script of an item as shown in the next example.
 * 
 * 
 * ```cpp
 * hr = ScriptItemize(pwcInChars, cInChars, cMaxItems, psControl, psState, pItems, pcItems);
 * //...
 * if (ppScriptProperties[pItems[iItem].a.eScript]->fNeedsCaretInfo) 
 *     {
 *         // Use ScriptBreak to restrict the caret from entering clusters (for example). 
 *     }
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_properties
 * @namespace Windows.Win32.Globalization
 */
export default struct SCRIPT_PROPERTIES {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - langid
     * - fNumeric
     * - fComplex
     * - fNeedsWordBreaking
     * - fNeedsCaretInfo
     * - bCharSet
     * - fControl
     * - fPrivateUseArea
     * - fNeedsCharacterJustify
     * - fInvalidGlyph
     */
    _bitfield1 : Int32


    /**
     * @type {Integer}
     */
    langid {
        get => (this._bitfield1 >> 0) & 0xFFFF
        set => this._bitfield1 := ((value & 0xFFFF) << 0) | (this._bitfield1 & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    fNumeric {
        get => (this._bitfield1 >> 16) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 16) | (this._bitfield1 & ~(0x1 << 16))
    }

    /**
     * @type {Integer}
     */
    fComplex {
        get => (this._bitfield1 >> 17) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 17) | (this._bitfield1 & ~(0x1 << 17))
    }

    /**
     * @type {Integer}
     */
    fNeedsWordBreaking {
        get => (this._bitfield1 >> 18) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 18) | (this._bitfield1 & ~(0x1 << 18))
    }

    /**
     * @type {Integer}
     */
    fNeedsCaretInfo {
        get => (this._bitfield1 >> 19) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 19) | (this._bitfield1 & ~(0x1 << 19))
    }

    /**
     * @type {Integer}
     */
    bCharSet {
        get => (this._bitfield1 >> 20) & 0xFF
        set => this._bitfield1 := ((value & 0xFF) << 20) | (this._bitfield1 & ~(0xFF << 20))
    }

    /**
     * @type {Integer}
     */
    fControl {
        get => (this._bitfield1 >> 28) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 28) | (this._bitfield1 & ~(0x1 << 28))
    }

    /**
     * @type {Integer}
     */
    fPrivateUseArea {
        get => (this._bitfield1 >> 29) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 29) | (this._bitfield1 & ~(0x1 << 29))
    }

    /**
     * @type {Integer}
     */
    fNeedsCharacterJustify {
        get => (this._bitfield1 >> 30) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 30) | (this._bitfield1 & ~(0x1 << 30))
    }

    /**
     * @type {Integer}
     */
    fInvalidGlyph {
        get => (this._bitfield1 >> 31) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 31) | (this._bitfield1 & ~(0x1 << 31))
    }
    /**
     * This bitfield backs the following members:
     * - fInvalidLogAttr
     * - fCDM
     * - fAmbiguousCharSet
     * - fClusterSizeVaries
     * - fRejectInvalid
     */
    _bitfield2 : Int32


    /**
     * @type {Integer}
     */
    fInvalidLogAttr {
        get => (this._bitfield2 >> 0) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 0) | (this._bitfield2 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    fCDM {
        get => (this._bitfield2 >> 1) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 1) | (this._bitfield2 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    fAmbiguousCharSet {
        get => (this._bitfield2 >> 2) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 2) | (this._bitfield2 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    fClusterSizeVaries {
        get => (this._bitfield2 >> 3) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 3) | (this._bitfield2 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    fRejectInvalid {
        get => (this._bitfield2 >> 4) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 4) | (this._bitfield2 & ~(0x1 << 4))
    }
}
