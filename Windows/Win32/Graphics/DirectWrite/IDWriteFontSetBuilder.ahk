#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFontFaceReference.ahk" { IDWriteFontFaceReference }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDWriteFontSet.ahk" { IDWriteFontSet }
#Import ".\DWRITE_FONT_PROPERTY.ahk" { DWRITE_FONT_PROPERTY }

/**
 * Contains methods for building a font set. (IDWriteFontSetBuilder)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontsetbuilder
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontSetBuilder extends IUnknown {
    /**
     * The interface identifier for IDWriteFontSetBuilder
     * @type {Guid}
     */
    static IID := Guid("{2f642afe-9c68-4f40-b8be-457401afcb3d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontSetBuilder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddFontFaceReference  : IntPtr
        AddFontFaceReference1 : IntPtr
        AddFontSet            : IntPtr
        CreateFontSet         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontSetBuilder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a reference to a font to the set being built. The necessary metadata will automatically be extracted from the font upon calling CreateFontSet. (overload 1/2)
     * @param {IDWriteFontFaceReference} fontFaceReference Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference">IDWriteFontFaceReference</a>*</b>
     * 
     * Font face reference object to add to the set.
     * @param {Pointer<DWRITE_FONT_PROPERTY>} _properties 
     * @param {Integer} propertyCount 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontsetbuilder-addfontfacereference(idwritefontfacereference)
     */
    AddFontFaceReference(fontFaceReference, _properties, propertyCount) {
        result := ComCall(3, this, "ptr", fontFaceReference, DWRITE_FONT_PROPERTY.Ptr, _properties, "uint", propertyCount, "HRESULT")
        return result
    }

    /**
     * Adds a reference to a font to the set being built. The necessary metadata will automatically be extracted from the font upon calling CreateFontSet. (overload 1/2)
     * @param {IDWriteFontFaceReference} fontFaceReference Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference">IDWriteFontFaceReference</a>*</b>
     * 
     * Font face reference object to add to the set.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontsetbuilder-addfontfacereference(idwritefontfacereference)
     */
    AddFontFaceReference1(fontFaceReference) {
        result := ComCall(4, this, "ptr", fontFaceReference, "HRESULT")
        return result
    }

    /**
     * Appends an existing font set to the one being built, allowing one to aggregate two sets or to essentially extend an existing one.
     * @param {IDWriteFontSet} fontSet Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset">IDWriteFontSet</a>*</b>
     * 
     * Font set to append font face references from.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontsetbuilder-addfontset
     */
    AddFontSet(fontSet) {
        result := ComCall(5, this, "ptr", fontSet, "HRESULT")
        return result
    }

    /**
     * Creates a font set from all the font face references added so far with AddFontFaceReference.
     * @remarks
     * Creating a font set takes less time if the references were added with metadata rather than needing to extract the metadata from the
     *       font file.
     * @returns {IDWriteFontSet} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset">IDWriteFontSet</a>**</b>
     * 
     * Contains the newly created font set object, or nullptr in case of failure.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontsetbuilder-createfontset
     */
    CreateFontSet() {
        result := ComCall(6, this, "ptr*", &fontSet := 0, "HRESULT")
        return IDWriteFontSet(fontSet)
    }

    Query(iid) {
        if (IDWriteFontSetBuilder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddFontFaceReference := CallbackCreate(GetMethod(implObj, "AddFontFaceReference"), flags, 4)
        this.vtbl.AddFontFaceReference1 := CallbackCreate(GetMethod(implObj, "AddFontFaceReference1"), flags, 2)
        this.vtbl.AddFontSet := CallbackCreate(GetMethod(implObj, "AddFontSet"), flags, 2)
        this.vtbl.CreateFontSet := CallbackCreate(GetMethod(implObj, "CreateFontSet"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddFontFaceReference)
        CallbackFree(this.vtbl.AddFontFaceReference1)
        CallbackFree(this.vtbl.AddFontSet)
        CallbackFree(this.vtbl.CreateFontSet)
    }
}
