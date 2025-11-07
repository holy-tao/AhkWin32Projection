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
     * 
     * @param {Integer} glyphOrientation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextformat1-setverticalglyphorientation
     */
    SetVerticalGlyphOrientation(glyphOrientation) {
        result := ComCall(28, this, "int", glyphOrientation, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextformat1-getverticalglyphorientation
     */
    GetVerticalGlyphOrientation() {
        result := ComCall(29, this, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} isLastLineWrappingEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextformat1-setlastlinewrapping
     */
    SetLastLineWrapping(isLastLineWrappingEnabled) {
        result := ComCall(30, this, "int", isLastLineWrappingEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextformat1-getlastlinewrapping
     */
    GetLastLineWrapping() {
        result := ComCall(31, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} opticalAlignment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextformat1-setopticalalignment
     */
    SetOpticalAlignment(opticalAlignment) {
        result := ComCall(32, this, "int", opticalAlignment, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextformat1-getopticalalignment
     */
    GetOpticalAlignment() {
        result := ComCall(33, this, "int")
        return result
    }

    /**
     * 
     * @param {IDWriteFontFallback} fontFallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextformat1-setfontfallback
     */
    SetFontFallback(fontFallback) {
        result := ComCall(34, this, "ptr", fontFallback, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDWriteFontFallback} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextformat1-getfontfallback
     */
    GetFontFallback() {
        result := ComCall(35, this, "ptr*", &fontFallback := 0, "HRESULT")
        return IDWriteFontFallback(fontFallback)
    }
}
