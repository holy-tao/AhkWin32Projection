#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_FONT_STYLE.ahk" { DWRITE_FONT_STYLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteStringList.ahk" { IDWriteStringList }
#Import ".\IDWriteFontFace.ahk" { IDWriteFontFace }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DWRITE_FONT_PROPERTY.ahk" { DWRITE_FONT_PROPERTY }
#Import ".\IDWriteFontFaceReference.ahk" { IDWriteFontFaceReference }
#Import ".\DWRITE_FONT_PROPERTY_ID.ahk" { DWRITE_FONT_PROPERTY_ID }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DWRITE_FONT_STRETCH.ahk" { DWRITE_FONT_STRETCH }
#Import ".\IDWriteLocalizedStrings.ahk" { IDWriteLocalizedStrings }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DWRITE_FONT_WEIGHT.ahk" { DWRITE_FONT_WEIGHT }

/**
 * Represents a font set. (IDWriteFontSet)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontSet extends IUnknown {
    /**
     * The interface identifier for IDWriteFontSet
     * @type {Guid}
     */
    static IID := Guid("{53585141-d9f8-4095-8321-d73cf6bd116b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontSet interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFontCount               : IntPtr
        GetFontFaceReference       : IntPtr
        FindFontFaceReference      : IntPtr
        FindFontFace               : IntPtr
        GetPropertyValues          : IntPtr
        GetPropertyValues1         : IntPtr
        GetPropertyValues2         : IntPtr
        GetPropertyOccurrenceCount : IntPtr
        GetMatchingFonts           : IntPtr
        GetMatchingFonts1          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontSet.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the number of total fonts in the set.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the number of total fonts in the set.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-getfontcount
     */
    GetFontCount() {
        result := ComCall(3, this, UInt32)
        return result
    }

    /**
     * Gets a reference to the font at the specified index, which may be local or remote.
     * @param {Integer} listIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the font.
     * @returns {IDWriteFontFaceReference} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference">IDWriteFontFaceReference</a>**</b>
     * 
     * Receives a pointer the font face reference object, or nullptr on failure.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-getfontfacereference
     */
    GetFontFaceReference(listIndex) {
        result := ComCall(4, this, "uint", listIndex, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference(fontFaceReference)
    }

    /**
     * Gets the index of the matching font face reference in the font set, with the same file, face index, and simulations. (IDWriteFontSet.FindFontFaceReference)
     * @param {IDWriteFontFaceReference} fontFaceReference Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference">IDWriteFontFaceReference</a>*</b>
     * 
     * Font face object that specifies the physical font.
     * @param {Pointer<Integer>} listIndex Type: <b>UINT32*</b>
     * 
     * Receives the zero-based index of the matching font if the font was found, or UINT_MAX otherwise.
     * @param {Pointer<BOOL>} exists Type: <b>BOOL*</b>
     * 
     * Receives TRUE if the font exists or FALSE otherwise.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-findfontfacereference
     */
    FindFontFaceReference(fontFaceReference, listIndex, exists) {
        listIndexMarshal := listIndex is VarRef ? "uint*" : "ptr"
        existsMarshal := exists is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", fontFaceReference, listIndexMarshal, listIndex, existsMarshal, exists, "HRESULT")
        return result
    }

    /**
     * Gets the index of the matching font face reference in the font set, with the same file, face index, and simulations. (IDWriteFontSet.FindFontFace)
     * @param {IDWriteFontFace} fontFace Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a>*</b>
     * 
     * Font face object that specifies the physical font.
     * @param {Pointer<Integer>} listIndex Type: <b>UINT32*</b>
     * 
     * Receives the zero-based index of the matching font if the font was found, or UINT_MAX otherwise.
     * @param {Pointer<BOOL>} exists Type: <b>BOOL*</b>
     * 
     * Receives TRUE if the font exists or FALSE otherwise.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-findfontface
     */
    FindFontFace(fontFace, listIndex, exists) {
        listIndexMarshal := listIndex is VarRef ? "uint*" : "ptr"
        existsMarshal := exists is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", fontFace, listIndexMarshal, listIndex, existsMarshal, exists, "HRESULT")
        return result
    }

    /**
     * Returns the property values of a specific font item index. (overload 1/3)
     * @param {DWRITE_FONT_PROPERTY_ID} propertyID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dwrite_3/ne-dwrite_3-dwrite_font_property_id">DWRITE_FONT_PROPERTY_ID</a></b>
     * 
     * Font property of interest.
     * @returns {IDWriteStringList} Type: \[out\] <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritelocalizedstrings">IDWriteLocalizedStrings</a>**</b>
     * 
     * Receives a pointer to the newly created localized strings object; or `nullptr` on failure or non-existent property.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-getpropertyvalues(dwrite_font_property_id_wcharconst_idwritestringlist)
     */
    GetPropertyValues(propertyID) {
        result := ComCall(7, this, DWRITE_FONT_PROPERTY_ID, propertyID, "ptr*", &values := 0, "HRESULT")
        return IDWriteStringList(values)
    }

    /**
     * Returns the property values of a specific font item index. (overload 1/3)
     * @param {DWRITE_FONT_PROPERTY_ID} propertyID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dwrite_3/ne-dwrite_3-dwrite_font_property_id">DWRITE_FONT_PROPERTY_ID</a></b>
     * 
     * Font property of interest.
     * @param {PWSTR} preferredLocaleNames Type: **[WCHAR](/windows/win32/winprog/windows-data-types) const \***
     * 
     * The preferred locale names to query as a list of semicolon-delimited names in preferred order. When a particular string (such as font family) has more than one localized name, then the first match is returned. If the first match doesn't exist, then the second match is returned, and so on. For example, "ja-jp;en-us".
     * @returns {IDWriteStringList} Type: \[out\] <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritelocalizedstrings">IDWriteLocalizedStrings</a>**</b>
     * 
     * Receives a pointer to the newly created localized strings object; or `nullptr` on failure or non-existent property.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-getpropertyvalues(dwrite_font_property_id_wcharconst_idwritestringlist)
     */
    GetPropertyValues1(propertyID, preferredLocaleNames) {
        preferredLocaleNames := preferredLocaleNames is String ? StrPtr(preferredLocaleNames) : preferredLocaleNames

        result := ComCall(8, this, DWRITE_FONT_PROPERTY_ID, propertyID, "ptr", preferredLocaleNames, "ptr*", &values := 0, "HRESULT")
        return IDWriteStringList(values)
    }

    /**
     * Returns the property values of a specific font item index. (overload 1/3)
     * @param {Integer} listIndex 
     * @param {DWRITE_FONT_PROPERTY_ID} propertyId 
     * @param {Pointer<BOOL>} exists 
     * @param {Pointer<IDWriteLocalizedStrings>} values Type: \[out\] <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritelocalizedstrings">IDWriteLocalizedStrings</a>**</b>
     * 
     * Receives a pointer to the newly created localized strings object; or `nullptr` on failure or non-existent property.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If this method succeeds, then it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-getpropertyvalues(dwrite_font_property_id_wcharconst_idwritestringlist)
     */
    GetPropertyValues2(listIndex, propertyId, exists, values) {
        existsMarshal := exists is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "uint", listIndex, DWRITE_FONT_PROPERTY_ID, propertyId, existsMarshal, exists, IDWriteLocalizedStrings.Ptr, values, "HRESULT")
        return result
    }

    /**
     * Returns how many times a given property value occurs in the set.
     * @param {Pointer<DWRITE_FONT_PROPERTY>} _property Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_font_property">DWRITE_FONT_PROPERTY</a>*</b>
     * 
     * Font property of interest.
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * Receives how many times the property occurs.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-getpropertyoccurrencecount
     */
    GetPropertyOccurrenceCount(_property) {
        result := ComCall(10, this, DWRITE_FONT_PROPERTY.Ptr, _property, "uint*", &propertyOccurrenceCount := 0, "HRESULT")
        return propertyOccurrenceCount
    }

    /**
     * Returns a subset of fonts filtered by the given properties. (overload 2/2)
     * @remarks
     * If no fonts matched the filter, the subset will be empty (GetFontCount returns 0), but the function does not return an error. The subset will
     * always be equal to or less than the original set. If you only want to filter out remote fonts, you may pass null in properties and zero in propertyCount.
     * @param {PWSTR} familyName 
     * @param {DWRITE_FONT_WEIGHT} fontWeight 
     * @param {DWRITE_FONT_STRETCH} fontStretch 
     * @param {DWRITE_FONT_STYLE} _fontStyle 
     * @returns {IDWriteFontSet} Type: [out] <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset">IDWriteFontSet</a>**</b>
     * 
     * The subset of fonts that match the properties, or nullptr on failure.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-getmatchingfonts(dwrite_font_propertyconst_uint32_idwritefontset)
     */
    GetMatchingFonts(familyName, fontWeight, fontStretch, _fontStyle) {
        familyName := familyName is String ? StrPtr(familyName) : familyName

        result := ComCall(11, this, "ptr", familyName, DWRITE_FONT_WEIGHT, fontWeight, DWRITE_FONT_STRETCH, fontStretch, DWRITE_FONT_STYLE, _fontStyle, "ptr*", &filteredSet := 0, "HRESULT")
        return IDWriteFontSet(filteredSet)
    }

    /**
     * Returns a subset of fonts filtered by the given properties. (overload 2/2)
     * @remarks
     * If no fonts matched the filter, the subset will be empty (GetFontCount returns 0), but the function does not return an error. The subset will
     * always be equal to or less than the original set. If you only want to filter out remote fonts, you may pass null in properties and zero in propertyCount.
     * @param {Pointer<DWRITE_FONT_PROPERTY>} _properties Type: [in] <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_font_property">DWRITE_FONT_PROPERTY</a>*</b>
     * 
     * List of properties to filter using.
     * @param {Integer} propertyCount Type: <b>UINT32</b>
     * 
     * The number of properties to filter.
     * @returns {IDWriteFontSet} Type: [out] <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset">IDWriteFontSet</a>**</b>
     * 
     * The subset of fonts that match the properties, or nullptr on failure.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-getmatchingfonts(dwrite_font_propertyconst_uint32_idwritefontset)
     */
    GetMatchingFonts1(_properties, propertyCount) {
        result := ComCall(12, this, DWRITE_FONT_PROPERTY.Ptr, _properties, "uint", propertyCount, "ptr*", &filteredSet := 0, "HRESULT")
        return IDWriteFontSet(filteredSet)
    }

    Query(iid) {
        if (IDWriteFontSet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFontCount := CallbackCreate(GetMethod(implObj, "GetFontCount"), flags, 1)
        this.vtbl.GetFontFaceReference := CallbackCreate(GetMethod(implObj, "GetFontFaceReference"), flags, 3)
        this.vtbl.FindFontFaceReference := CallbackCreate(GetMethod(implObj, "FindFontFaceReference"), flags, 4)
        this.vtbl.FindFontFace := CallbackCreate(GetMethod(implObj, "FindFontFace"), flags, 4)
        this.vtbl.GetPropertyValues := CallbackCreate(GetMethod(implObj, "GetPropertyValues"), flags, 3)
        this.vtbl.GetPropertyValues1 := CallbackCreate(GetMethod(implObj, "GetPropertyValues1"), flags, 4)
        this.vtbl.GetPropertyValues2 := CallbackCreate(GetMethod(implObj, "GetPropertyValues2"), flags, 5)
        this.vtbl.GetPropertyOccurrenceCount := CallbackCreate(GetMethod(implObj, "GetPropertyOccurrenceCount"), flags, 3)
        this.vtbl.GetMatchingFonts := CallbackCreate(GetMethod(implObj, "GetMatchingFonts"), flags, 6)
        this.vtbl.GetMatchingFonts1 := CallbackCreate(GetMethod(implObj, "GetMatchingFonts1"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFontCount)
        CallbackFree(this.vtbl.GetFontFaceReference)
        CallbackFree(this.vtbl.FindFontFaceReference)
        CallbackFree(this.vtbl.FindFontFace)
        CallbackFree(this.vtbl.GetPropertyValues)
        CallbackFree(this.vtbl.GetPropertyValues1)
        CallbackFree(this.vtbl.GetPropertyValues2)
        CallbackFree(this.vtbl.GetPropertyOccurrenceCount)
        CallbackFree(this.vtbl.GetMatchingFonts)
        CallbackFree(this.vtbl.GetMatchingFonts1)
    }
}
