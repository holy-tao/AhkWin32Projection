#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFontList2.ahk" { IDWriteFontList2 }
#Import ".\IDWriteFontSet1.ahk" { IDWriteFontSet1 }
#Import ".\IDWriteFontFamily1.ahk" { IDWriteFontFamily1 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DWRITE_FONT_AXIS_VALUE.ahk" { DWRITE_FONT_AXIS_VALUE }

/**
 * Represents a family of related fonts. **IDWriteFontFamily2** adds new facilities, including retrieving fonts by font axis values.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfamily2
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontFamily2 extends IDWriteFontFamily1 {
    /**
     * The interface identifier for IDWriteFontFamily2
     * @type {Guid}
     */
    static IID := Guid("{3ed49e77-a398-4261-b9cf-c126c2131ef3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontFamily2 interfaces
    */
    struct Vtbl extends IDWriteFontFamily1.Vtbl {
        GetMatchingFonts : IntPtr
        GetFontSet       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontFamily2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a list of fonts in the font family, ranked in order of how well they match the specified axis values.
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues Type: **[DWRITE_FONT_AXIS_VALUE](./ns-dwrite_3-dwrite_font_axis_value.md) const \***
     * 
     * A pointer to an array containing a list of font axis values. The array should be the size (the number of elements) indicated by the *fontAxisValueCount* argument.
     * @param {Integer} fontAxisValueCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of font axis values contained in the *fontAxisValues* array.
     * @returns {IDWriteFontList2} Type: **[IDWriteFontList2](./nn-dwrite_3-idwritefontlist2.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontList2](./nn-dwrite_3-idwritefontlist2.md) interface. On successful completion, the function sets the pointer to a newly created font list object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfamily2-getmatchingfonts
     */
    GetMatchingFonts(fontAxisValues, fontAxisValueCount) {
        result := ComCall(12, this, DWRITE_FONT_AXIS_VALUE.Ptr, fontAxisValues, "uint", fontAxisValueCount, "ptr*", &matchingFonts := 0, "HRESULT")
        return IDWriteFontList2(matchingFonts)
    }

    /**
     * Retrieves the underlying font set used by this family.
     * @returns {IDWriteFontSet1} Type: **[IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md) interface. On successful completion, the function sets the pointer to the font set used by the family.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfamily2-getfontset
     */
    GetFontSet() {
        result := ComCall(13, this, "ptr*", &fontSet := 0, "HRESULT")
        return IDWriteFontSet1(fontSet)
    }

    Query(iid) {
        if (IDWriteFontFamily2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMatchingFonts := CallbackCreate(GetMethod(implObj, "GetMatchingFonts"), flags, 4)
        this.vtbl.GetFontSet := CallbackCreate(GetMethod(implObj, "GetFontSet"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMatchingFonts)
        CallbackFree(this.vtbl.GetFontSet)
    }
}
