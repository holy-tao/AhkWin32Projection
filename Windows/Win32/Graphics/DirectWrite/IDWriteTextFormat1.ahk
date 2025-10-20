#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteTextFormat.ahk

/**
 * Describes the font and paragraph properties used to format text, and it describes locale information.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nn-dwrite_2-idwritetextformat1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextFormat1 extends IDWriteTextFormat{
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
     * 
     * @param {Integer} glyphOrientation 
     * @returns {HRESULT} 
     */
    SetVerticalGlyphOrientation(glyphOrientation) {
        result := ComCall(28, this, "int", glyphOrientation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetVerticalGlyphOrientation() {
        result := ComCall(29, this, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} isLastLineWrappingEnabled 
     * @returns {HRESULT} 
     */
    SetLastLineWrapping(isLastLineWrappingEnabled) {
        result := ComCall(30, this, "int", isLastLineWrappingEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetLastLineWrapping() {
        result := ComCall(31, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} opticalAlignment 
     * @returns {HRESULT} 
     */
    SetOpticalAlignment(opticalAlignment) {
        result := ComCall(32, this, "int", opticalAlignment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOpticalAlignment() {
        result := ComCall(33, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFallback>} fontFallback 
     * @returns {HRESULT} 
     */
    SetFontFallback(fontFallback) {
        result := ComCall(34, this, "ptr", fontFallback, "int")
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
        result := ComCall(35, this, "ptr", fontFallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
