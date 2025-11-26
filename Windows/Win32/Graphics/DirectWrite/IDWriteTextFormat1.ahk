#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFallback.ahk
#Include .\IDWriteTextFormat.ahk

/**
 * Describes the font and paragraph properties used to format text, and it describes locale information.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nn-dwrite_2-idwritetextformat1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextFormat1 extends IDWriteTextFormat{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteTextFormat1
     * @type {Guid}
     */
    static IID => Guid("{5f174b49-0d8b-4cfb-8bca-f1cce9d06c67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetVerticalGlyphOrientation", "GetVerticalGlyphOrientation", "SetLastLineWrapping", "GetLastLineWrapping", "SetOpticalAlignment", "GetOpticalAlignment", "SetFontFallback", "GetFontFallback"]

    /**
     * Sets the orientation of a text format.
     * @param {Integer} glyphOrientation Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_vertical_glyph_orientation">DWRITE_VERTICAL_GLYPH_ORIENTATION</a></b>
     * 
     * The orientation to apply to the text format.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextformat1-setverticalglyphorientation
     */
    SetVerticalGlyphOrientation(glyphOrientation) {
        result := ComCall(28, this, "int", glyphOrientation, "HRESULT")
        return result
    }

    /**
     * Get the preferred orientation of glyphs when using a vertical reading direction.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_vertical_glyph_orientation">DWRITE_VERTICAL_GLYPH_ORIENTATION</a></b>
     * 
     * The preferred orientation of glyphs when using a vertical reading direction.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextformat1-getverticalglyphorientation
     */
    GetVerticalGlyphOrientation() {
        result := ComCall(29, this, "int")
        return result
    }

    /**
     * Sets the wrapping mode of the last line.
     * @param {BOOL} isLastLineWrappingEnabled Type: <b>BOOL</b>
     * 
     * If set to FALSE, the last line is not wrapped. If set to TRUE, the last line is wrapped.
     * 
     * The last line is wrapped by default.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextformat1-setlastlinewrapping
     */
    SetLastLineWrapping(isLastLineWrappingEnabled) {
        result := ComCall(30, this, "int", isLastLineWrappingEnabled, "HRESULT")
        return result
    }

    /**
     * Gets the wrapping mode of the last line.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns FALSE if the last line is not wrapped; TRUE if the last line is wrapped.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextformat1-getlastlinewrapping
     */
    GetLastLineWrapping() {
        result := ComCall(31, this, "int")
        return result
    }

    /**
     * Sets the optical margin alignment for the text format.
     * @param {Integer} opticalAlignment The optical alignment to set.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextformat1-setopticalalignment
     */
    SetOpticalAlignment(opticalAlignment) {
        result := ComCall(32, this, "int", opticalAlignment, "HRESULT")
        return result
    }

    /**
     * Gets the optical margin alignment for the text format.
     * @returns {Integer} The optical alignment.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextformat1-getopticalalignment
     */
    GetOpticalAlignment() {
        result := ComCall(33, this, "int")
        return result
    }

    /**
     * Applies the custom font fallback onto the layout. If none is set, it uses the default system fallback list.
     * @param {IDWriteFontFallback} fontFallback Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/nn-dwrite_2-idwritefontfallback">IDWriteFontFallback</a>*</b>
     * 
     * The font fallback to apply to the layout.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextformat1-setfontfallback
     */
    SetFontFallback(fontFallback) {
        result := ComCall(34, this, "ptr", fontFallback, "HRESULT")
        return result
    }

    /**
     * Gets the current fallback. If none was ever set since creating the layout, it will be nullptr.
     * @returns {IDWriteFontFallback} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/nn-dwrite_2-idwritefontfallback">IDWriteFontFallback</a>**</b>
     * 
     * Contains an address of a pointer to the the current font fallback object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextformat1-getfontfallback
     */
    GetFontFallback() {
        result := ComCall(35, this, "ptr*", &fontFallback := 0, "HRESULT")
        return IDWriteFontFallback(fontFallback)
    }
}
