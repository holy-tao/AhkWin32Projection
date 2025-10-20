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
     * 
     * @param {Pointer<DWRITE_TEXT_METRICS1>} textMetrics 
     * @returns {HRESULT} 
     */
    GetMetrics(textMetrics) {
        result := ComCall(71, this, "ptr", textMetrics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} glyphOrientation 
     * @returns {HRESULT} 
     */
    SetVerticalGlyphOrientation(glyphOrientation) {
        result := ComCall(72, this, "int", glyphOrientation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetVerticalGlyphOrientation() {
        result := ComCall(73, this, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} isLastLineWrappingEnabled 
     * @returns {HRESULT} 
     */
    SetLastLineWrapping(isLastLineWrappingEnabled) {
        result := ComCall(74, this, "int", isLastLineWrappingEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetLastLineWrapping() {
        result := ComCall(75, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} opticalAlignment 
     * @returns {HRESULT} 
     */
    SetOpticalAlignment(opticalAlignment) {
        result := ComCall(76, this, "int", opticalAlignment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOpticalAlignment() {
        result := ComCall(77, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFallback>} fontFallback 
     * @returns {HRESULT} 
     */
    SetFontFallback(fontFallback) {
        result := ComCall(78, this, "ptr", fontFallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFallback>} fontFallback 
     * @returns {HRESULT} 
     */
    GetFontFallback(fontFallback) {
        result := ComCall(79, this, "ptr", fontFallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
