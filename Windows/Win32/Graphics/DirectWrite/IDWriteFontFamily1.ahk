#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFontFaceReference.ahk" { IDWriteFontFaceReference }
#Import ".\IDWriteFontFamily.ahk" { IDWriteFontFamily }
#Import ".\IDWriteFont3.ahk" { IDWriteFont3 }
#Import ".\DWRITE_LOCALITY.ahk" { DWRITE_LOCALITY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents a family of related fonts. (IDWriteFontFamily1)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfamily1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontFamily1 extends IDWriteFontFamily {
    /**
     * The interface identifier for IDWriteFontFamily1
     * @type {Guid}
     */
    static IID := Guid("{da20d8ef-812a-4c43-9802-62ec4abd7adf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontFamily1 interfaces
    */
    struct Vtbl extends IDWriteFontFamily.Vtbl {
        GetFontLocality      : IntPtr
        GetFont              : IntPtr
        GetFontFaceReference : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontFamily1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the current location of a font given its zero-based index. (IDWriteFontFamily1.GetFontLocality)
     * @remarks
     * For fully local files, the result will always be <b>DWRITE_LOCALITY_LOCAL</b>. For streamed files, the result depends on how much of the file has been downloaded. <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfamily1-getfont">GetFont</a> fails if the locality is <b>DWRITE_LOCALITY_REMOTE</b> and potentially fails if <b>DWRITE_LOCALITY_PARTIAL</b>.
     * @param {Integer} listIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the font in the font list.
     * @returns {DWRITE_LOCALITY} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_locality">DWRITE_LOCALITY</a></b>
     * 
     * Returns a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_locality">DWRITE_LOCALITY</a>-typed value that specifies the location of the specified font.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfamily1-getfontlocality
     */
    GetFontLocality(listIndex) {
        result := ComCall(9, this, "uint", listIndex, DWRITE_LOCALITY)
        return result
    }

    /**
     * Gets a font given its zero-based index. (IDWriteFontFamily1.GetFont)
     * @param {Integer} listIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the font in the font list.
     * @returns {IDWriteFont3} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefont3">IDWriteFont3</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefont3">IDWriteFont3</a> interface for the newly created font object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfamily1-getfont
     */
    GetFont(listIndex) {
        result := ComCall(10, this, "uint", listIndex, "ptr*", &_font := 0, "HRESULT")
        return IDWriteFont3(_font)
    }

    /**
     * Gets a font face reference given its zero-based index. (IDWriteFontFamily1.GetFontFaceReference)
     * @param {Integer} listIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the font in the font list.
     * @returns {IDWriteFontFaceReference} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference">IDWriteFontFaceReference</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference">IDWriteFontFaceReference</a> interface for the newly created font face reference object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfamily1-getfontfacereference
     */
    GetFontFaceReference(listIndex) {
        result := ComCall(11, this, "uint", listIndex, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference(fontFaceReference)
    }

    Query(iid) {
        if (IDWriteFontFamily1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFontLocality := CallbackCreate(GetMethod(implObj, "GetFontLocality"), flags, 2)
        this.vtbl.GetFont := CallbackCreate(GetMethod(implObj, "GetFont"), flags, 3)
        this.vtbl.GetFontFaceReference := CallbackCreate(GetMethod(implObj, "GetFontFaceReference"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFontLocality)
        CallbackFree(this.vtbl.GetFont)
        CallbackFree(this.vtbl.GetFontFaceReference)
    }
}
