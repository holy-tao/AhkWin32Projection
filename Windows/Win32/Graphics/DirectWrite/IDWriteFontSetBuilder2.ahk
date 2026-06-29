#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DWRITE_FONT_SIMULATIONS.ahk" { DWRITE_FONT_SIMULATIONS }
#Import ".\DWRITE_FONT_AXIS_RANGE.ahk" { DWRITE_FONT_AXIS_RANGE }
#Import ".\IDWriteFontFile.ahk" { IDWriteFontFile }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DWRITE_FONT_AXIS_VALUE.ahk" { DWRITE_FONT_AXIS_VALUE }
#Import ".\IDWriteFontSetBuilder1.ahk" { IDWriteFontSetBuilder1 }
#Import ".\DWRITE_FONT_PROPERTY.ahk" { DWRITE_FONT_PROPERTY }

/**
 * Contains methods for building a font set. (IDWriteFontSetBuilder2)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontsetbuilder2
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontSetBuilder2 extends IDWriteFontSetBuilder1 {
    /**
     * The interface identifier for IDWriteFontSetBuilder2
     * @type {Guid}
     */
    static IID := Guid("{ee5ba612-b131-463c-8f4f-3189b9401e45}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontSetBuilder2 interfaces
    */
    struct Vtbl extends IDWriteFontSetBuilder1.Vtbl {
        AddFont     : IntPtr
        AddFontFile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontSetBuilder2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a font to the set being built.
     * @remarks
     * The font properties should include at least a family (typographic or weight/style/stretch). Otherwise the font would be accessible in the **IDWriteFontSet** only by index, not name.
     * @param {IDWriteFontFile} fontFile Type: **[IDWriteFontFile](../dwrite/nn-dwrite-idwritefontfile.md)\***
     * 
     * Font file reference object to add to the set.
     * @param {Integer} fontFaceIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The zero-based index of a font face in a collection.
     * @param {DWRITE_FONT_SIMULATIONS} fontSimulations Type: **[DWRITE_FONT_SIMULATIONS](../dwrite/ne-dwrite-dwrite_font_simulations.md)**
     * 
     * Font face simulation flags for algorithmic emboldening and italicization.
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues Type: **[DWRITE_FONT_AXIS_VALUE](./ns-dwrite_3-dwrite_font_axis_value.md) const \***
     * 
     * A pointer to an array containing a list of font axis values. The array should be the size (the number of elements) indicated by the *fontAxisValueCount* argument.
     * @param {Integer} fontAxisValueCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of font axis values contained in the *fontAxisValues* array.
     * @param {Pointer<DWRITE_FONT_AXIS_RANGE>} fontAxisRanges Type: **[DWRITE_FONT_AXIS_RANGE](./ns-dwrite_3-dwrite_font_axis_range.md) const \***
     * 
     * List of axis ranges.
     * @param {Integer} fontAxisRangeCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Number of axis ranges.
     * @param {Pointer<DWRITE_FONT_PROPERTY>} _properties Type: **[DWRITE_FONT_PROPERTY](./ns-dwrite_3-dwrite_font_property.md) const \***
     * 
     * List of properties to associate with the reference.
     * @param {Integer} propertyCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of properties defined.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontsetbuilder2-addfont
     */
    AddFont(fontFile, fontFaceIndex, fontSimulations, fontAxisValues, fontAxisValueCount, fontAxisRanges, fontAxisRangeCount, _properties, propertyCount) {
        result := ComCall(8, this, "ptr", fontFile, "uint", fontFaceIndex, DWRITE_FONT_SIMULATIONS, fontSimulations, DWRITE_FONT_AXIS_VALUE.Ptr, fontAxisValues, "uint", fontAxisValueCount, DWRITE_FONT_AXIS_RANGE.Ptr, fontAxisRanges, "uint", fontAxisRangeCount, DWRITE_FONT_PROPERTY.Ptr, _properties, "uint", propertyCount, "HRESULT")
        return result
    }

    /**
     * Adds references to all the fonts in the specified font file. The method parses the font file to determine the fonts and their properties.
     * @param {PWSTR} filePath Type: **[WCHAR](/windows/win32/winprog/windows-data-types) const \***
     * 
     * Absolute file path to add to the font set.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontsetbuilder2-addfontfile
     */
    AddFontFile(filePath) {
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := ComCall(9, this, "ptr", filePath, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDWriteFontSetBuilder2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddFont := CallbackCreate(GetMethod(implObj, "AddFont"), flags, 10)
        this.vtbl.AddFontFile := CallbackCreate(GetMethod(implObj, "AddFontFile"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddFont)
        CallbackFree(this.vtbl.AddFontFile)
    }
}
