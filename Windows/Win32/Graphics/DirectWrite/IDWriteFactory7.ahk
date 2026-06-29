#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFactory6.ahk" { IDWriteFactory6 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteFontSet2.ahk" { IDWriteFontSet2 }
#Import ".\IDWriteFontCollection3.ahk" { IDWriteFontCollection3 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DWRITE_FONT_FAMILY_MODEL.ahk" { DWRITE_FONT_FAMILY_MODEL }

/**
 * This interface represents a factory object from which all DirectWrite objects are created. **IDWriteFactory7** adds new facilities for working with system fonts.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefactory7
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFactory7 extends IDWriteFactory6 {
    /**
     * The interface identifier for IDWriteFactory7
     * @type {Guid}
     */
    static IID := Guid("{35d0e0b3-9076-4d2e-a016-a91b568a06b4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFactory7 interfaces
    */
    struct Vtbl extends IDWriteFactory6.Vtbl {
        GetSystemFontSet        : IntPtr
        GetSystemFontCollection : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFactory7.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the set of system fonts. (IDWriteFactory7::GetSystemFontSet)
     * @param {BOOL} includeDownloadableFonts Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * `true` if you want to include downloadable fonts. `false` if you only want locally installed fonts.
     * @returns {IDWriteFontSet2} Type: **[IDWriteFontSet2](./nn-dwrite_3-idwritefontset2.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontSet2](./nn-dwrite_3-idwritefontset2.md) interface. On successful completion, the function sets the pointer to the font set object, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory7-getsystemfontset
     */
    GetSystemFontSet(includeDownloadableFonts) {
        result := ComCall(55, this, BOOL, includeDownloadableFonts, "ptr*", &fontSet := 0, "HRESULT")
        return IDWriteFontSet2(fontSet)
    }

    /**
     * Retrieves a collection of fonts, grouped into families. (IDWriteFactory7::GetSystemFontCollection)
     * @param {BOOL} includeDownloadableFonts Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * `true` if you want to include downloadable fonts. `false` if you only want locally installed fonts.
     * @param {DWRITE_FONT_FAMILY_MODEL} fontFamilyModel Type: **[DWRITE_FONT_FAMILY_MODEL](./ne-dwrite_3-dwrite_font_family_model.md)**
     * 
     * How to group families in the collection.
     * @returns {IDWriteFontCollection3} Type: **[IDWriteFontCollection3](./nn-dwrite_3-idwritefontcollection3.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontCollection3](./nn-dwrite_3-idwritefontcollection3.md) interface. On successful completion, the function sets the pointer to a newly created font collection object, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory7-getsystemfontcollection
     */
    GetSystemFontCollection(includeDownloadableFonts, fontFamilyModel) {
        result := ComCall(56, this, BOOL, includeDownloadableFonts, DWRITE_FONT_FAMILY_MODEL, fontFamilyModel, "ptr*", &_fontCollection := 0, "HRESULT")
        return IDWriteFontCollection3(_fontCollection)
    }

    Query(iid) {
        if (IDWriteFactory7.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSystemFontSet := CallbackCreate(GetMethod(implObj, "GetSystemFontSet"), flags, 3)
        this.vtbl.GetSystemFontCollection := CallbackCreate(GetMethod(implObj, "GetSystemFontCollection"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSystemFontSet)
        CallbackFree(this.vtbl.GetSystemFontCollection)
    }
}
