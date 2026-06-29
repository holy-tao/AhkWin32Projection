#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Globalization\FONTSIGNATURE.ahk" { FONTSIGNATURE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteFontSet.ahk" { IDWriteFontSet }
#Import ".\IDWriteFontFace.ahk" { IDWriteFontFace }
#Import ".\IDWriteFont.ahk" { IDWriteFont }
#Import "..\Gdi\LOGFONTW.ahk" { LOGFONTW }
#Import ".\IDWriteGdiInterop.ahk" { IDWriteGdiInterop }
#Import ".\IDWriteFontCollection.ahk" { IDWriteFontCollection }
#Import "..\Gdi\LOGFONTA.ahk" { LOGFONTA }

/**
 * Provides interoperability with GDI, such as methods to convert a font face to a LOGFONT structure, or to convert a GDI font description into a font face. It is also used to create bitmap render target objects. (IDWriteGdiInterop1)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritegdiinterop1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteGdiInterop1 extends IDWriteGdiInterop {
    /**
     * The interface identifier for IDWriteGdiInterop1
     * @type {Guid}
     */
    static IID := Guid("{4556be70-3abd-4f70-90be-421780a6f515}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteGdiInterop1 interfaces
    */
    struct Vtbl extends IDWriteGdiInterop.Vtbl {
        CreateFontFromLOGFONT     : IntPtr
        GetFontSignature          : IntPtr
        GetFontSignature1         : IntPtr
        GetMatchingFontsByLOGFONT : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteGdiInterop1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a font object that matches the properties specified by the LOGFONT structure. (IDWriteGdiInterop1.CreateFontFromLOGFONT)
     * @param {Pointer<LOGFONTW>} logFont Type: <b>LOGFONTW</b>
     * 
     * Structure containing a GDI-compatible font description.
     * @param {IDWriteFontCollection} _fontCollection Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollection">IDWriteFontCollection</a>*</b>
     * 
     * The font collection to search. If NULL, the local system font collection is used.
     * @returns {IDWriteFont} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefont">IDWriteFont</a>**</b>
     * 
     * Receives a newly created font object if successful, or NULL in case of error.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritegdiinterop1-createfontfromlogfont
     */
    CreateFontFromLOGFONT(logFont, _fontCollection) {
        result := ComCall(8, this, LOGFONTW.Ptr, logFont, "ptr", _fontCollection, "ptr*", &_font := 0, "HRESULT")
        return IDWriteFont(_font)
    }

    /**
     * Reads the font signature from the given font. (overload 1/2)
     * @param {IDWriteFontFace} fontFace Type: [in] <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefont">IDWriteFont</a>*</b>
     * 
     * Font to read font signature from.
     * @returns {FONTSIGNATURE} Type: [out] <b>FONTSIGNATURE*</b>
     * 
     * Font signature from the OS/2 table, ulUnicodeRange, and ulCodePageRange.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritegdiinterop1-getfontsignature(idwritefontface_fontsignature)
     */
    GetFontSignature(fontFace) {
        _fontSignature := FONTSIGNATURE()
        result := ComCall(9, this, "ptr", fontFace, FONTSIGNATURE.Ptr, _fontSignature, "HRESULT")
        return _fontSignature
    }

    /**
     * Reads the font signature from the given font. (overload 1/2)
     * @param {IDWriteFont} _font 
     * @returns {FONTSIGNATURE} Type: [out] <b>FONTSIGNATURE*</b>
     * 
     * Font signature from the OS/2 table, ulUnicodeRange, and ulCodePageRange.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritegdiinterop1-getfontsignature(idwritefontface_fontsignature)
     */
    GetFontSignature1(_font) {
        _fontSignature := FONTSIGNATURE()
        result := ComCall(10, this, "ptr", _font, FONTSIGNATURE.Ptr, _fontSignature, "HRESULT")
        return _fontSignature
    }

    /**
     * Gets a list of matching fonts based on the specified LOGFONT values. Only fonts of that family name will be returned.
     * @param {Pointer<LOGFONTA>} logFont Type: <b>LOGFONT</b>
     * 
     * Structure containing a GDI-compatible font description.
     * @param {IDWriteFontSet} fontSet Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset">IDWriteFontSet</a>*</b>
     * 
     * The font set to search.
     * @returns {IDWriteFontSet} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset">IDWriteFontSet</a>**</b>
     * 
     * &gt;Receives the filtered font set if successful.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritegdiinterop1-getmatchingfontsbylogfont
     */
    GetMatchingFontsByLOGFONT(logFont, fontSet) {
        result := ComCall(11, this, LOGFONTA.Ptr, logFont, "ptr", fontSet, "ptr*", &filteredSet := 0, "HRESULT")
        return IDWriteFontSet(filteredSet)
    }

    Query(iid) {
        if (IDWriteGdiInterop1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateFontFromLOGFONT := CallbackCreate(GetMethod(implObj, "CreateFontFromLOGFONT"), flags, 4)
        this.vtbl.GetFontSignature := CallbackCreate(GetMethod(implObj, "GetFontSignature"), flags, 3)
        this.vtbl.GetFontSignature1 := CallbackCreate(GetMethod(implObj, "GetFontSignature1"), flags, 3)
        this.vtbl.GetMatchingFontsByLOGFONT := CallbackCreate(GetMethod(implObj, "GetMatchingFontsByLOGFONT"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateFontFromLOGFONT)
        CallbackFree(this.vtbl.GetFontSignature)
        CallbackFree(this.vtbl.GetFontSignature1)
        CallbackFree(this.vtbl.GetMatchingFontsByLOGFONT)
    }
}
