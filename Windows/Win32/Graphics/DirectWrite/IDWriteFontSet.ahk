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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-getfontcount
     */
    GetFontCount() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @returns {IDWriteFontFaceReference} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-getfontfacereference
     */
    GetFontFaceReference(listIndex) {
        result := ComCall(4, this, "uint", listIndex, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference(fontFaceReference)
    }

    /**
     * 
     * @param {IDWriteFontFaceReference} fontFaceReference 
     * @param {Pointer<Integer>} listIndex 
     * @param {Pointer<BOOL>} exists 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-findfontfacereference
     */
    FindFontFaceReference(fontFaceReference, listIndex, exists) {
        listIndexMarshal := listIndex is VarRef ? "uint*" : "ptr"
        existsMarshal := exists is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", fontFaceReference, listIndexMarshal, listIndex, existsMarshal, exists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteFontFace} fontFace 
     * @param {Pointer<Integer>} listIndex 
     * @param {Pointer<BOOL>} exists 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-findfontface
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
     * 
     * @param {Pointer<DWRITE_FONT_PROPERTY>} property 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset-getpropertyoccurrencecount
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
