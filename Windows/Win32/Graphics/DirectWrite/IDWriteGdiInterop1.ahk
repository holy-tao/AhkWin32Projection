#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFont.ahk
#Include ..\..\Globalization\FONTSIGNATURE.ahk
#Include .\IDWriteFontSet.ahk
#Include .\IDWriteGdiInterop.ahk

/**
 * Provides interoperability with GDI, such as methods to convert a font face to a LOGFONT structure, or to convert a GDI font description into a font face. It is also used to create bitmap render target objects. (IDWriteGdiInterop1)
 * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nn-dwrite_3-idwritegdiinterop1
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
     * Creates a font object that matches the properties specified by the LOGFONT structure. (IDWriteGdiInterop1.CreateFontFromLOGFONT)
     * @param {Pointer<LOGFONTW>} logFont Type: <b>LOGFONTW</b>
     * 
     * Structure containing a GDI-compatible font description.
     * @param {IDWriteFontCollection} fontCollection_ Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollection">IDWriteFontCollection</a>*</b>
     * 
     * The font collection to search. If NULL, the local system font collection is used.
     * @returns {Pointer<IDWriteFont>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritegdiinterop1-createfontfromlogfont
     */
    CreateFontFromLOGFONT(logFont, fontCollection_) {
        result := ComCall(8, this, "ptr", logFont, "ptr", fontCollection_, "ptr*", &font_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return font_
    }

    /**
     * Retrieves a font signature.
     * @param {IDWriteFontFace} fontFace 
     * @returns {FONTSIGNATURE} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectWrite/idwritegdiinterop1-getfontsignature-overload
     */
    GetFontSignature(fontFace) {
        fontSignature_ := FONTSIGNATURE()
        result := ComCall(9, this, "ptr", fontFace, "ptr", fontSignature_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fontSignature_
    }

    /**
     * Retrieves a font signature.
     * @param {IDWriteFont} font_ 
     * @returns {FONTSIGNATURE} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectWrite/idwritegdiinterop1-getfontsignature-overload
     */
    GetFontSignature1(font_) {
        fontSignature_ := FONTSIGNATURE()
        result := ComCall(10, this, "ptr", font_, "ptr", fontSignature_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fontSignature_
    }

    /**
     * Gets a list of matching fonts based on the specified LOGFONT values. Only fonts of that family name will be returned.
     * @param {Pointer<LOGFONTA>} logFont Type: <b>LOGFONT</b>
     * 
     * Structure containing a GDI-compatible font description.
     * @param {IDWriteFontSet} fontSet Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset">IDWriteFontSet</a>*</b>
     * 
     * The font set to search.
     * @returns {Pointer<IDWriteFontSet>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset">IDWriteFontSet</a>**</b>
     * 
     * &gt;Receives the filtered font set if successful.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritegdiinterop1-getmatchingfontsbylogfont
     */
    GetMatchingFontsByLOGFONT(logFont, fontSet) {
        result := ComCall(11, this, "ptr", logFont, "ptr", fontSet, "ptr*", &filteredSet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return filteredSet
    }
}
