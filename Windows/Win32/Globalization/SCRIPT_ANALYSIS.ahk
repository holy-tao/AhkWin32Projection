#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCRIPT_STATE.ahk" { SCRIPT_STATE }

/**
 * Contains a portion of a Unicode string, that is, an &quot;item&quot;.
 * @remarks
 * This structure is filled by <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemize">ScriptItemize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemizeopentype">ScriptItemizeOpenType</a>, each of which breaks a Unicode string into individually shapeable items. Neither function accesses the <b>SCRIPT_ANALYSIS</b> structure directly. Each function handles an array of <a href="https://docs.microsoft.com/windows/win32/api/usp10/ns-usp10-script_item">SCRIPT_ITEM</a> structures, each of which has a member defining a <b>SCRIPT_ANALYSIS</b> structure.
 * 
 * Applications that use <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemizeopentype">ScriptItemizeOpenType</a> instead of <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemize">ScriptItemize</a> should also use <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptshapeopentype">ScriptShapeOpenType</a> and <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptplaceopentype">ScriptPlaceOpenType</a> instead of <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptshape">ScriptShape</a> and <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptplace">ScriptPlace</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Intl/displaying-text-with-uniscribe">Displaying Text with Uniscribe</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_analysis
 * @namespace Windows.Win32.Globalization
 */
export default struct SCRIPT_ANALYSIS {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - eScript
     * - fRTL
     * - fLayoutRTL
     * - fLinkBefore
     * - fLinkAfter
     * - fLogicalOrder
     * - fNoGlyphIndex
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    eScript {
        get => (this._bitfield >> 0) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 0) | (this._bitfield & ~(0x3FF << 0))
    }

    /**
     * @type {Integer}
     */
    fRTL {
        get => (this._bitfield >> 10) & 0x1
        set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
    }

    /**
     * @type {Integer}
     */
    fLayoutRTL {
        get => (this._bitfield >> 11) & 0x1
        set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
    }

    /**
     * @type {Integer}
     */
    fLinkBefore {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * @type {Integer}
     */
    fLinkAfter {
        get => (this._bitfield >> 13) & 0x1
        set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
    }

    /**
     * @type {Integer}
     */
    fLogicalOrder {
        get => (this._bitfield >> 14) & 0x1
        set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
    }

    /**
     * @type {Integer}
     */
    fNoGlyphIndex {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }
    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/usp10/ns-usp10-script_state">SCRIPT_STATE</a> structure containing a copy of the Unicode algorithm state.
     */
    s : SCRIPT_STATE

}
