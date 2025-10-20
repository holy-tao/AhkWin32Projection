#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteGdiInterop.ahk

/**
 * Provides interoperability with GDI, such as methods to convert a font face to a LOGFONT structure, or to convert a GDI font description into a font face. It is also used to create bitmap render target objects.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritegdiinterop1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteGdiInterop1 extends IDWriteGdiInterop{
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
     * 
     * @param {Pointer<LOGFONTW>} logFont 
     * @param {Pointer<IDWriteFontCollection>} fontCollection 
     * @param {Pointer<IDWriteFont>} font 
     * @returns {HRESULT} 
     */
    CreateFontFromLOGFONT(logFont, fontCollection, font) {
        result := ComCall(8, this, "ptr", logFont, "ptr", fontCollection, "ptr", font, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFace>} fontFace 
     * @param {Pointer<FONTSIGNATURE>} fontSignature 
     * @returns {HRESULT} 
     */
    GetFontSignature(fontFace, fontSignature) {
        result := ComCall(9, this, "ptr", fontFace, "ptr", fontSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFont>} font 
     * @param {Pointer<FONTSIGNATURE>} fontSignature 
     * @returns {HRESULT} 
     */
    GetFontSignature(font, fontSignature) {
        result := ComCall(10, this, "ptr", font, "ptr", fontSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<LOGFONTA>} logFont 
     * @param {Pointer<IDWriteFontSet>} fontSet 
     * @param {Pointer<IDWriteFontSet>} filteredSet 
     * @returns {HRESULT} 
     */
    GetMatchingFontsByLOGFONT(logFont, fontSet, filteredSet) {
        result := ComCall(11, this, "ptr", logFont, "ptr", fontSet, "ptr", filteredSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
