#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteFontSet1.ahk" { IDWriteFontSet1 }
#Import ".\IDWriteFontFamily2.ahk" { IDWriteFontFamily2 }
#Import ".\IDWriteFontCollection1.ahk" { IDWriteFontCollection1 }
#Import ".\DWRITE_FONT_FAMILY_MODEL.ahk" { DWRITE_FONT_FAMILY_MODEL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DWRITE_FONT_AXIS_VALUE.ahk" { DWRITE_FONT_AXIS_VALUE }
#Import ".\IDWriteFontList2.ahk" { IDWriteFontList2 }

/**
 * This interface encapsulates a set of fonts, such as the set of fonts installed on the system, or the set of fonts in a particular directory. The font collection API can be used to discover what font families and fonts are available, and to obtain some metadata about the fonts. (IDWriteFontCollection2)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontcollection2
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontCollection2 extends IDWriteFontCollection1 {
    /**
     * The interface identifier for IDWriteFontCollection2
     * @type {Guid}
     */
    static IID := Guid("{514039c6-4617-4064-bf8b-92ea83e506e0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontCollection2 interfaces
    */
    struct Vtbl extends IDWriteFontCollection1.Vtbl {
        GetFontFamily      : IntPtr
        GetMatchingFonts   : IntPtr
        GetFontFamilyModel : IntPtr
        GetFontSet         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontCollection2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a font family object, given a zero-based font family index.
     * @param {Integer} index Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Zero-based index of the font family.
     * @returns {IDWriteFontFamily2} Type: **[IDWriteFontFamily2](./nn-dwrite_3-idwritefontfamily2.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontFamily2](./nn-dwrite_3-idwritefontfamily2.md) interface. On successful completion, the function sets the pointer to a newly created font family object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontcollection2-getfontfamily
     */
    GetFontFamily(index) {
        result := ComCall(9, this, "uint", index, "ptr*", &_fontFamily := 0, "HRESULT")
        return IDWriteFontFamily2(_fontFamily)
    }

    /**
     * Retrieves a list of fonts in the specified font family, ranked in order of how well they match the specified axis values.
     * @remarks
     * If no fonts match, an empty list object is returned (calling [IDWriteFontList::GetFontCount](../dwrite/nf-dwrite-idwritefontlist-getfontcount.md) on it returns 0), but the function doesn't return an error.
     * @param {PWSTR} familyName Type: **[WCHAR](/windows/win32/winprog/windows-data-types) const \***
     * 
     * Name of the font family. The name is not case-sensitive, but must otherwise exactly match a family name in the collection.
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues Type: **[DWRITE_FONT_AXIS_VALUE](./ns-dwrite_3-dwrite_font_axis_value.md) const \***
     * 
     * A pointer to an array containing a list of font axis values. The array should be the size (the number of elements) indicated by the *fontAxisValueCount* argument.
     * @param {Integer} fontAxisValueCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of font axis values contained in the *fontAxisValues* array.
     * @returns {IDWriteFontList2} Type: **[IDWriteFontList2](./nn-dwrite_3-idwritefontlist2.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontList2](./nn-dwrite_3-idwritefontlist2.md) interface. On successful completion, the function sets the pointer to a newly created font list object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontcollection2-getmatchingfonts
     */
    GetMatchingFonts(familyName, fontAxisValues, fontAxisValueCount) {
        familyName := familyName is String ? StrPtr(familyName) : familyName

        result := ComCall(10, this, "ptr", familyName, DWRITE_FONT_AXIS_VALUE.Ptr, fontAxisValues, "uint", fontAxisValueCount, "ptr*", &fontList := 0, "HRESULT")
        return IDWriteFontList2(fontList)
    }

    /**
     * Retrieves the font family model used by the font collection to group families.
     * @returns {DWRITE_FONT_FAMILY_MODEL} Type: **[DWRITE_FONT_FAMILY_MODEL](./ne-dwrite_3-dwrite_font_family_model.md)**
     * 
     * How families are grouped in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontcollection2-getfontfamilymodel
     */
    GetFontFamilyModel() {
        result := ComCall(11, this, DWRITE_FONT_FAMILY_MODEL)
        return result
    }

    /**
     * Retrieves the underlying font set used by this collection.
     * @returns {IDWriteFontSet1} Type: **[IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md) interface. On successful completion, the function sets the pointer to the font set used by the collection.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontcollection2-getfontset
     */
    GetFontSet() {
        result := ComCall(12, this, "ptr*", &fontSet := 0, "HRESULT")
        return IDWriteFontSet1(fontSet)
    }

    Query(iid) {
        if (IDWriteFontCollection2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFontFamily := CallbackCreate(GetMethod(implObj, "GetFontFamily"), flags, 3)
        this.vtbl.GetMatchingFonts := CallbackCreate(GetMethod(implObj, "GetMatchingFonts"), flags, 5)
        this.vtbl.GetFontFamilyModel := CallbackCreate(GetMethod(implObj, "GetFontFamilyModel"), flags, 1)
        this.vtbl.GetFontSet := CallbackCreate(GetMethod(implObj, "GetFontSet"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFontFamily)
        CallbackFree(this.vtbl.GetMatchingFonts)
        CallbackFree(this.vtbl.GetFontFamilyModel)
        CallbackFree(this.vtbl.GetFontSet)
    }
}
