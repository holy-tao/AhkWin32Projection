#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFontFaceReference.ahk" { IDWriteFontFaceReference }
#Import ".\DWRITE_LOCALITY.ahk" { DWRITE_LOCALITY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteFontFace3.ahk" { IDWriteFontFace3 }
#Import ".\IDWriteFont.ahk" { IDWriteFont }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IDWriteFont2.ahk" { IDWriteFont2 }

/**
 * Represents a font in a font collection.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefont3
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFont3 extends IDWriteFont2 {
    /**
     * The interface identifier for IDWriteFont3
     * @type {Guid}
     */
    static IID := Guid("{29748ed6-8c9c-4a6a-be0b-d912e8538944}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFont3 interfaces
    */
    struct Vtbl extends IDWriteFont2.Vtbl {
        CreateFontFace       : IntPtr
        Equals               : IntPtr
        GetFontFaceReference : IntPtr
        HasCharacter         : IntPtr
        GetLocality          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFont3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a font face object for the font. (IDWriteFont3.CreateFontFace)
     * @returns {IDWriteFontFace3} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontface3">IDWriteFontFace3</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontface3">IDWriteFontFace3</a> interface for the newly created font face object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefont3-createfontface
     */
    CreateFontFace() {
        result := ComCall(19, this, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace3(fontFace)
    }

    /**
     * Compares two instances of font references for equality.
     * @param {IDWriteFont} _font Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefont">IDWriteFont</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefont">IDWriteFont</a> interface for the other font instance to compare to this font instance.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns whether the two instances of font references are equal. Returns <b>TRUE</b> if the two instances are equal; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefont3-equals
     */
    Equals(_font) {
        result := ComCall(20, this, "ptr", _font, BOOL)
        return result
    }

    /**
     * Gets a font face reference that identifies this font. (IDWriteFont3.GetFontFaceReference)
     * @returns {IDWriteFontFaceReference} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference">IDWriteFontFaceReference</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference">IDWriteFontFaceReference</a> interface for the newly created font face reference object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefont3-getfontfacereference
     */
    GetFontFaceReference() {
        result := ComCall(21, this, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference(fontFaceReference)
    }

    /**
     * 
     * @param {Integer} unicodeValue 
     * @returns {BOOL} 
     */
    HasCharacter(unicodeValue) {
        result := ComCall(22, this, "uint", unicodeValue, BOOL)
        return result
    }

    /**
     * Gets the current locality of the font.
     * @remarks
     * For fully local files, the result will always  be DWRITE_LOCALITY_LOCAL. A downloadable file may be any of the states, and this function may change between calls.
     * @returns {DWRITE_LOCALITY} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_locality">DWRITE_LOCALITY</a></b>
     * 
     * Returns the current locality of the font.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefont3-getlocality
     */
    GetLocality() {
        result := ComCall(23, this, DWRITE_LOCALITY)
        return result
    }

    Query(iid) {
        if (IDWriteFont3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateFontFace := CallbackCreate(GetMethod(implObj, "CreateFontFace"), flags, 2)
        this.vtbl.Equals := CallbackCreate(GetMethod(implObj, "Equals"), flags, 2)
        this.vtbl.GetFontFaceReference := CallbackCreate(GetMethod(implObj, "GetFontFaceReference"), flags, 2)
        this.vtbl.HasCharacter := CallbackCreate(GetMethod(implObj, "HasCharacter"), flags, 2)
        this.vtbl.GetLocality := CallbackCreate(GetMethod(implObj, "GetLocality"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateFontFace)
        CallbackFree(this.vtbl.Equals)
        CallbackFree(this.vtbl.GetFontFaceReference)
        CallbackFree(this.vtbl.HasCharacter)
        CallbackFree(this.vtbl.GetLocality)
    }
}
