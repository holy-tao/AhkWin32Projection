#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFont.ahk
#Include ..\..\Globalization\FONTSIGNATURE.ahk
#Include .\IDWriteFontSet.ahk
#Include .\IDWriteGdiInterop.ahk

/**
 * Provides interoperability with GDI, such as methods to convert a font face to a LOGFONT structure, or to convert a GDI font description into a font face. It is also used to create bitmap render target objects.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritegdiinterop1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteGdiInterop1 extends IDWriteGdiInterop{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteGdiInterop1
     * @type {Guid}
     */
    static IID => Guid("{4556be70-3abd-4f70-90be-421780a6f515}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFontFromLOGFONT", "GetFontSignature", "GetFontSignature1", "GetMatchingFontsByLOGFONT"]

    /**
     * 
     * @param {Pointer<LOGFONTW>} logFont 
     * @param {IDWriteFontCollection} fontCollection 
     * @returns {IDWriteFont} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritegdiinterop1-createfontfromlogfont
     */
    CreateFontFromLOGFONT(logFont, fontCollection) {
        result := ComCall(8, this, "ptr", logFont, "ptr", fontCollection, "ptr*", &font := 0, "HRESULT")
        return IDWriteFont(font)
    }

    /**
     * 
     * @param {IDWriteFontFace} fontFace 
     * @returns {FONTSIGNATURE} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritegdiinterop1-getfontsignature(idwritefontface_fontsignature)
     */
    GetFontSignature(fontFace) {
        fontSignature := FONTSIGNATURE()
        result := ComCall(9, this, "ptr", fontFace, "ptr", fontSignature, "HRESULT")
        return fontSignature
    }

    /**
     * 
     * @param {IDWriteFont} font 
     * @returns {FONTSIGNATURE} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritegdiinterop1-getfontsignature(idwritefontface_fontsignature)
     */
    GetFontSignature1(font) {
        fontSignature := FONTSIGNATURE()
        result := ComCall(10, this, "ptr", font, "ptr", fontSignature, "HRESULT")
        return fontSignature
    }

    /**
     * 
     * @param {Pointer<LOGFONTA>} logFont 
     * @param {IDWriteFontSet} fontSet 
     * @returns {IDWriteFontSet} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritegdiinterop1-getmatchingfontsbylogfont
     */
    GetMatchingFontsByLOGFONT(logFont, fontSet) {
        result := ComCall(11, this, "ptr", logFont, "ptr", fontSet, "ptr*", &filteredSet := 0, "HRESULT")
        return IDWriteFontSet(filteredSet)
    }
}
