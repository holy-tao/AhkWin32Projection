#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFaceReference.ahk
#Include .\IDWriteStringList.ahk
#Include .\IDWriteFontSet.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a font set.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontset
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontSet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontSet
     * @type {Guid}
     */
    static IID => Guid("{53585141-d9f8-4095-8321-d73cf6bd116b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontCount", "GetFontFaceReference", "FindFontFaceReference", "FindFontFace", "GetPropertyValues", "GetPropertyValues1", "GetPropertyValues2", "GetPropertyOccurrenceCount", "GetMatchingFonts", "GetMatchingFonts1"]

    /**
     * Get the number of total fonts in the set.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the number of total fonts in the set.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontset-getfontcount
     */
    GetFontCount() {
        result := ComCall(3, this, "uint")
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
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontset-getfontfacereference
     */
    GetFontFaceReference(listIndex) {
        result := ComCall(4, this, "uint", listIndex, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference(fontFaceReference)
    }

    /**
     * Gets the index of the matching font face reference in the font set, with the same file, face index, and simulations.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontset-findfontfacereference
     */
    FindFontFaceReference(fontFaceReference, listIndex, exists) {
        listIndexMarshal := listIndex is VarRef ? "uint*" : "ptr"
        existsMarshal := exists is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", fontFaceReference, listIndexMarshal, listIndex, existsMarshal, exists, "HRESULT")
        return result
    }

    /**
     * Gets the index of the matching font face reference in the font set, with the same file, face index, and simulations.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontset-findfontface
     */
    FindFontFace(fontFace, listIndex, exists) {
        listIndexMarshal := listIndex is VarRef ? "uint*" : "ptr"
        existsMarshal := exists is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", fontFace, listIndexMarshal, listIndex, existsMarshal, exists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} propertyID 
     * @returns {IDWriteStringList} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-getpropertyvalues(dwrite_font_property_id_wcharconst_idwritestringlist)
     */
    GetPropertyValues(propertyID) {
        result := ComCall(7, this, "int", propertyID, "ptr*", &values := 0, "HRESULT")
        return IDWriteStringList(values)
    }

    /**
     * 
     * @param {Integer} propertyID 
     * @param {PWSTR} preferredLocaleNames 
     * @returns {IDWriteStringList} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-getpropertyvalues(dwrite_font_property_id_wcharconst_idwritestringlist)
     */
    GetPropertyValues1(propertyID, preferredLocaleNames) {
        preferredLocaleNames := preferredLocaleNames is String ? StrPtr(preferredLocaleNames) : preferredLocaleNames

        result := ComCall(8, this, "int", propertyID, "ptr", preferredLocaleNames, "ptr*", &values := 0, "HRESULT")
        return IDWriteStringList(values)
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @param {Integer} propertyId 
     * @param {Pointer<BOOL>} exists 
     * @param {Pointer<IDWriteLocalizedStrings>} values 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-getpropertyvalues(dwrite_font_property_id_wcharconst_idwritestringlist)
     */
    GetPropertyValues2(listIndex, propertyId, exists, values) {
        existsMarshal := exists is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "uint", listIndex, "int", propertyId, existsMarshal, exists, "ptr*", values, "HRESULT")
        return result
    }

    /**
     * Returns how many times a given property value occurs in the set.
     * @param {Pointer<DWRITE_FONT_PROPERTY>} property Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_font_property">DWRITE_FONT_PROPERTY</a>*</b>
     * 
     * Font property of interest.
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * Receives how many times the property occurs.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontset-getpropertyoccurrencecount
     */
    GetPropertyOccurrenceCount(property) {
        result := ComCall(10, this, "ptr", property, "uint*", &propertyOccurrenceCount := 0, "HRESULT")
        return propertyOccurrenceCount
    }

    /**
     * 
     * @param {PWSTR} familyName 
     * @param {Integer} fontWeight 
     * @param {Integer} fontStretch 
     * @param {Integer} fontStyle 
     * @returns {IDWriteFontSet} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-getmatchingfonts(dwrite_font_propertyconst_uint32_idwritefontset)
     */
    GetMatchingFonts(familyName, fontWeight, fontStretch, fontStyle) {
        familyName := familyName is String ? StrPtr(familyName) : familyName

        result := ComCall(11, this, "ptr", familyName, "int", fontWeight, "int", fontStretch, "int", fontStyle, "ptr*", &filteredSet := 0, "HRESULT")
        return IDWriteFontSet(filteredSet)
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_PROPERTY>} properties 
     * @param {Integer} propertyCount 
     * @returns {IDWriteFontSet} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-getmatchingfonts(dwrite_font_propertyconst_uint32_idwritefontset)
     */
    GetMatchingFonts1(properties, propertyCount) {
        result := ComCall(12, this, "ptr", properties, "uint", propertyCount, "ptr*", &filteredSet := 0, "HRESULT")
        return IDWriteFontSet(filteredSet)
    }
}
