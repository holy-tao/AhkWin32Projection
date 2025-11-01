#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<DWRITE_TEXT_METRICS1>} textMetrics 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextlayout2-getmetrics
     */
    GetMetrics(textMetrics) {
        result := ComCall(71, this, "ptr", textMetrics, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} glyphOrientation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextlayout2-setverticalglyphorientation
     */
    SetVerticalGlyphOrientation(glyphOrientation) {
        result := ComCall(72, this, "int", glyphOrientation, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextlayout2-getverticalglyphorientation
     */
    GetVerticalGlyphOrientation() {
        result := ComCall(73, this, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} isLastLineWrappingEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextlayout2-setlastlinewrapping
     */
    SetLastLineWrapping(isLastLineWrappingEnabled) {
        result := ComCall(74, this, "int", isLastLineWrappingEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextlayout2-getlastlinewrapping
     */
    GetLastLineWrapping() {
        result := ComCall(75, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} opticalAlignment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextlayout2-setopticalalignment
     */
    SetOpticalAlignment(opticalAlignment) {
        result := ComCall(76, this, "int", opticalAlignment, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextlayout2-getopticalalignment
     */
    GetOpticalAlignment() {
        result := ComCall(77, this, "int")
        return result
    }

    /**
     * 
     * @param {IDWriteFontFallback} fontFallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextlayout2-setfontfallback
     */
    SetFontFallback(fontFallback) {
        result := ComCall(78, this, "ptr", fontFallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFallback>} fontFallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextlayout2-getfontfallback
     */
    GetFontFallback(fontFallback) {
        result := ComCall(79, this, "ptr*", fontFallback, "HRESULT")
        return result
    }
}
