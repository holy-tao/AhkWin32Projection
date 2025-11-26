#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DWRITE_TEXT_METRICS1.ahk
#Include .\IDWriteFontFallback.ahk
#Include .\IDWriteTextLayout1.ahk

/**
 * Represents a block of text after it has been fully analyzed and formatted.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nn-dwrite_2-idwritetextlayout2
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextLayout2 extends IDWriteTextLayout1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteTextLayout2
     * @type {Guid}
     */
    static IID => Guid("{1093c18f-8d5e-43f0-b064-0917311b525e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 71

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMetrics", "SetVerticalGlyphOrientation", "GetVerticalGlyphOrientation", "SetLastLineWrapping", "GetLastLineWrapping", "SetOpticalAlignment", "GetOpticalAlignment", "SetFontFallback", "GetFontFallback"]

    /**
     * Retrieves overall metrics for the formatted string.
     * @returns {DWRITE_TEXT_METRICS1} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ns-dwrite_2-dwrite_text_metrics1">DWRITE_TEXT_METRICS1</a>*</b>
     * 
     * When this method returns, contains the measured distances of text and associated content after being formatted.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextlayout2-getmetrics
     */
    GetMetrics() {
        textMetrics := DWRITE_TEXT_METRICS1()
        result := ComCall(71, this, "ptr", textMetrics, "HRESULT")
        return textMetrics
    }

    /**
     * Set the preferred orientation of glyphs when using a vertical reading direction.
     * @param {Integer} glyphOrientation Preferred glyph orientation.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextlayout2-setverticalglyphorientation
     */
    SetVerticalGlyphOrientation(glyphOrientation) {
        result := ComCall(72, this, "int", glyphOrientation, "HRESULT")
        return result
    }

    /**
     * Get the preferred orientation of glyphs when using a vertical reading direction.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextlayout2-getverticalglyphorientation
     */
    GetVerticalGlyphOrientation() {
        result := ComCall(73, this, "int")
        return result
    }

    /**
     * Set whether or not the last word on the last line is wrapped.
     * @param {BOOL} isLastLineWrappingEnabled Line wrapping option.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextlayout2-setlastlinewrapping
     */
    SetLastLineWrapping(isLastLineWrappingEnabled) {
        result := ComCall(74, this, "int", isLastLineWrappingEnabled, "HRESULT")
        return result
    }

    /**
     * Get whether or not the last word on the last line is wrapped.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextlayout2-getlastlinewrapping
     */
    GetLastLineWrapping() {
        result := ComCall(75, this, "int")
        return result
    }

    /**
     * Set how the glyphs align to the edges the margin.
     * @param {Integer} opticalAlignment Optical alignment option.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextlayout2-setopticalalignment
     */
    SetOpticalAlignment(opticalAlignment) {
        result := ComCall(76, this, "int", opticalAlignment, "HRESULT")
        return result
    }

    /**
     * Get how the glyphs align to the edges the margin.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextlayout2-getopticalalignment
     */
    GetOpticalAlignment() {
        result := ComCall(77, this, "int")
        return result
    }

    /**
     * Apply a custom font fallback onto layout.
     * @param {IDWriteFontFallback} fontFallback Custom font fallback created from <a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontfallbackbuilder-createfontfallback">IDWriteFontFallbackBuilder::CreateFontFallback</a> or <a href="https://docs.microsoft.com/windows/win32/DirectWrite/idwritefactory2-getsystemfontfallback">IDWriteFactory2::GetSystemFontFallback</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextlayout2-setfontfallback
     */
    SetFontFallback(fontFallback) {
        result := ComCall(78, this, "ptr", fontFallback, "HRESULT")
        return result
    }

    /**
     * Get the current font fallback object.
     * @returns {IDWriteFontFallback} The current font fallback object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextlayout2-getfontfallback
     */
    GetFontFallback() {
        result := ComCall(79, this, "ptr*", &fontFallback := 0, "HRESULT")
        return IDWriteFontFallback(fontFallback)
    }
}
