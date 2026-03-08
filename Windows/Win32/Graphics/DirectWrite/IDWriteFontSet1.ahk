#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontSet1.ahk
#Include .\IDWriteFontFaceReference1.ahk
#Include .\IDWriteFontResource.ahk
#Include .\IDWriteFontFace5.ahk
#Include .\IDWriteFontSet.ahk

/**
 * Represents a font set. (IDWriteFontSet1)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontSet1 extends IDWriteFontSet{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontSet1
     * @type {Guid}
     */
    static IID => Guid("{7e9fda85-6c92-4053-bc47-7ae3530db4d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMatchingFonts", "GetFirstFontResources", "GetFilteredFonts", "GetFilteredFonts1", "GetFilteredFonts2", "GetFilteredFontIndices", "GetFilteredFontIndices1", "GetFontAxisRanges", "GetFontAxisRanges1", "GetFontFaceReference", "CreateFontResource", "CreateFontFace", "GetFontLocality"]

    /**
     * Retrieves a matching font set based on the requested inputs, ordered so that nearer matches are earlier.
     * @remarks
     * This method can yield distinct items that were not in the original font set, including items with simulation flags (if they would be a closer match to the request), and instances that were not named by the font author. Items from the same font resources are collapsed into one: the closest possible match.
     * @param {Pointer<DWRITE_FONT_PROPERTY>} fontProperty Type: **[DWRITE_FONT_PROPERTY](./ns-dwrite_3-dwrite_font_property.md) const \***
     * 
     * Font property of interest, such as typographic family or weight/stretch/style family.
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues Type: **[DWRITE_FONT_AXIS_VALUE](./ns-dwrite_3-dwrite_font_axis_value.md) const \***
     * 
     * A pointer to an array containing a list of font axis values. The array should be the size (the number of elements) indicated by the *fontAxisValueCount* argument.
     * @param {Integer} fontAxisValueCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of font axis values contained in the *fontAxisValues* array.
     * @returns {IDWriteFontSet1} Type: **[IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md) interface. On successful completion, the function sets the pointer to a prioritized list of fonts that match the properties, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getmatchingfonts
     */
    GetMatchingFonts(fontProperty, fontAxisValues, fontAxisValueCount) {
        result := ComCall(13, this, "ptr", fontProperty, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr*", &matchingFonts := 0, "HRESULT")
        return IDWriteFontSet1(matchingFonts)
    }

    /**
     * Retrieves a new font set that contains only the first occurrence of each font resource from the set.
     * @returns {IDWriteFontSet1} Type: **[IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md) interface. On successful completion, the function sets the pointer to a new font set object consisting of single default instances from font resources, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfirstfontresources
     */
    GetFirstFontResources() {
        result := ComCall(14, this, "ptr*", &filteredFontSet := 0, "HRESULT")
        return IDWriteFontSet1(filteredFontSet)
    }

    /**
     * Retrieves a subset of fonts, filtered by the given indices.
     * @remarks
     * The indices can come in any order, meaning that **GetFilteredFonts** can produce a new set with items removed, duplicated, or reordered from the original. If you pass zero indices, then an empty font set is returned.
     * @param {Pointer<Integer>} indices Type: **[UINT32](/windows/win32/winprog/windows-data-types) const \***
     * 
     * An array of indices to filter by, in the range 0 to [IDwriteFontSet::GetFontCount](./nf-dwrite_3-idwritefontset-getfontcount.md) minus 1.
     * @param {Integer} indexCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of indices.
     * @returns {IDWriteFontSet1} Type: **[IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md) interface. On successful completion, the function sets the pointer to an object representing the subset of fonts indicated by the given indices, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfilteredfonts(uint32const_uint32_idwritefontset1)
     */
    GetFilteredFonts(indices, indexCount) {
        indicesMarshal := indices is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, indicesMarshal, indices, "uint", indexCount, "ptr*", &filteredFontSet := 0, "HRESULT")
        return IDWriteFontSet1(filteredFontSet)
    }

    /**
     * Retrieves a subset of fonts, filtered by the given indices.
     * @remarks
     * The indices can come in any order, meaning that **GetFilteredFonts** can produce a new set with items removed, duplicated, or reordered from the original. If you pass zero indices, then an empty font set is returned.
     * @param {Pointer<DWRITE_FONT_AXIS_RANGE>} fontAxisRanges 
     * @param {Integer} fontAxisRangeCount 
     * @param {BOOL} selectAnyRange 
     * @returns {IDWriteFontSet1} Type: **[IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md) interface. On successful completion, the function sets the pointer to an object representing the subset of fonts indicated by the given indices, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfilteredfonts(uint32const_uint32_idwritefontset1)
     */
    GetFilteredFonts1(fontAxisRanges, fontAxisRangeCount, selectAnyRange) {
        result := ComCall(16, this, "ptr", fontAxisRanges, "uint", fontAxisRangeCount, "int", selectAnyRange, "ptr*", &filteredFontSet := 0, "HRESULT")
        return IDWriteFontSet1(filteredFontSet)
    }

    /**
     * Retrieves a subset of fonts, filtered by the given indices.
     * @remarks
     * The indices can come in any order, meaning that **GetFilteredFonts** can produce a new set with items removed, duplicated, or reordered from the original. If you pass zero indices, then an empty font set is returned.
     * @param {Pointer<DWRITE_FONT_PROPERTY>} properties 
     * @param {Integer} propertyCount 
     * @param {BOOL} selectAnyProperty 
     * @returns {IDWriteFontSet1} Type: **[IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md) interface. On successful completion, the function sets the pointer to an object representing the subset of fonts indicated by the given indices, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfilteredfonts(uint32const_uint32_idwritefontset1)
     */
    GetFilteredFonts2(properties, propertyCount, selectAnyProperty) {
        result := ComCall(17, this, "ptr", properties, "uint", propertyCount, "int", selectAnyProperty, "ptr*", &filteredFontSet := 0, "HRESULT")
        return IDWriteFontSet1(filteredFontSet)
    }

    /**
     * Retrieves all the item indices, filtered by the given properties.
     * @param {Pointer<DWRITE_FONT_AXIS_RANGE>} fontAxisRanges 
     * @param {Integer} fontAxisRangeCount 
     * @param {BOOL} selectAnyRange 
     * @param {Pointer<Integer>} indices Type: **[UINT32](/windows/win32/winprog/windows-data-types)\***
     * 
     * An ascending array of indices, in the range 0 to [IDwriteFontSet::GetFontCount](./nf-dwrite_3-idwritefontset-getfontcount.md) minus 1.
     * @param {Integer} maxIndexCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of indices.
     * @param {Pointer<Integer>} actualIndexCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)\***
     * 
     * The actual number of indices written or needed, in the range 0 to [IDwriteFontSet::GetFontCount](./nf-dwrite_3-idwritefontset-getfontcount.md) minus 1.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * 
     * |Return value|Description|
     * |-|-|
     * |E_NOT_SUFFICIENT_BUFFER|The buffer is too small, with *actualIndexCount* set to the needed size. The *actualIndexCount* will always be <= [IDwriteFontSet::GetFontCount](./nf-dwrite_3-idwritefontset-getfontcount.md).|
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfilteredfontindices
     */
    GetFilteredFontIndices(fontAxisRanges, fontAxisRangeCount, selectAnyRange, indices, maxIndexCount, actualIndexCount) {
        indicesMarshal := indices is VarRef ? "uint*" : "ptr"
        actualIndexCountMarshal := actualIndexCount is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "ptr", fontAxisRanges, "uint", fontAxisRangeCount, "int", selectAnyRange, indicesMarshal, indices, "uint", maxIndexCount, actualIndexCountMarshal, actualIndexCount, "HRESULT")
        return result
    }

    /**
     * Retrieves all the item indices, filtered by the given properties.
     * @param {Pointer<DWRITE_FONT_PROPERTY>} properties Type: **[DWRITE_FONT_PROPERTY](./ns-dwrite_3-dwrite_font_property.md) const \***
     * 
     * List of properties to filter by.
     * @param {Integer} propertyCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of properties to filter.
     * @param {BOOL} selectAnyProperty Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * `true` if **GetFilteredFontIndices** should select any property; `false` if it should select the intersection of them all.
     * @param {Pointer<Integer>} indices Type: **[UINT32](/windows/win32/winprog/windows-data-types)\***
     * 
     * An ascending array of indices, in the range 0 to [IDwriteFontSet::GetFontCount](./nf-dwrite_3-idwritefontset-getfontcount.md) minus 1.
     * @param {Integer} maxIndexCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of indices.
     * @param {Pointer<Integer>} actualIndexCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)\***
     * 
     * The actual number of indices written or needed, in the range 0 to [IDwriteFontSet::GetFontCount](./nf-dwrite_3-idwritefontset-getfontcount.md) minus 1.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * 
     * |Return value|Description|
     * |-|-|
     * |E_NOT_SUFFICIENT_BUFFER|The buffer is too small, with *actualIndexCount* set to the needed size. The *actualIndexCount* will always be <= [IDwriteFontSet::GetFontCount](./nf-dwrite_3-idwritefontset-getfontcount.md).|
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfilteredfontindices
     */
    GetFilteredFontIndices1(properties, propertyCount, selectAnyProperty, indices, maxIndexCount, actualIndexCount) {
        indicesMarshal := indices is VarRef ? "uint*" : "ptr"
        actualIndexCountMarshal := actualIndexCount is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "ptr", properties, "uint", propertyCount, "int", selectAnyProperty, indicesMarshal, indices, "uint", maxIndexCount, actualIndexCountMarshal, actualIndexCount, "HRESULT")
        return result
    }

    /**
     * Retrieves all axis ranges in the font set; the union of all contained items.
     * @param {Integer} listIndex 
     * @param {Pointer<DWRITE_FONT_AXIS_RANGE>} fontAxisRanges Type: **[DWRITE_FONT_AXIS_RANGE](./ns-dwrite_3-dwrite_font_axis_range.md)\***
     * 
     * List of axis value ranges to retrieve.
     * @param {Integer} maxFontAxisRangeCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of axis value ranges to retrieve.
     * @param {Pointer<Integer>} actualFontAxisRangeCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)\***
     * 
     * The actual number of axis ranges written or needed.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * 
     * |Return value|Description|
     * |-|-|
     * |E_NOT_SUFFICIENT_BUFFER|The buffer is too small, with *actualFontAxisRangeCount* set to the needed size.|
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfontaxisranges
     */
    GetFontAxisRanges(listIndex, fontAxisRanges, maxFontAxisRangeCount, actualFontAxisRangeCount) {
        actualFontAxisRangeCountMarshal := actualFontAxisRangeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "uint", listIndex, "ptr", fontAxisRanges, "uint", maxFontAxisRangeCount, actualFontAxisRangeCountMarshal, actualFontAxisRangeCount, "HRESULT")
        return result
    }

    /**
     * Retrieves all axis ranges in the font set; the union of all contained items.
     * @param {Pointer<DWRITE_FONT_AXIS_RANGE>} fontAxisRanges Type: **[DWRITE_FONT_AXIS_RANGE](./ns-dwrite_3-dwrite_font_axis_range.md)\***
     * 
     * List of axis value ranges to retrieve.
     * @param {Integer} maxFontAxisRangeCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of axis value ranges to retrieve.
     * @param {Pointer<Integer>} actualFontAxisRangeCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)\***
     * 
     * The actual number of axis ranges written or needed.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * 
     * |Return value|Description|
     * |-|-|
     * |E_NOT_SUFFICIENT_BUFFER|The buffer is too small, with *actualFontAxisRangeCount* set to the needed size.|
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfontaxisranges
     */
    GetFontAxisRanges1(fontAxisRanges, maxFontAxisRangeCount, actualFontAxisRangeCount) {
        actualFontAxisRangeCountMarshal := actualFontAxisRangeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "ptr", fontAxisRanges, "uint", maxFontAxisRangeCount, actualFontAxisRangeCountMarshal, actualFontAxisRangeCount, "HRESULT")
        return result
    }

    /**
     * Retrieves the font face reference of a single item.
     * @param {Integer} listIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Zero-based index of the font item in the set.
     * @returns {IDWriteFontFaceReference1} Type: **[IDWriteFontFaceReference1](./nn-dwrite_3-idwritefontfacereference1.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontFaceReference1](./nn-dwrite_3-idwritefontfacereference1.md) interface. On successful completion, the function sets the pointer to the font face reference.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfontfacereference
     */
    GetFontFaceReference(listIndex) {
        result := ComCall(22, this, "uint", listIndex, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference1(fontFaceReference)
    }

    /**
     * Creates the font resource of a single item.
     * @param {Integer} listIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Zero-based index of the font item in the set.
     * @returns {IDWriteFontResource} Type: **[IDWriteFontResource](./nn-dwrite_3-idwritefontresource.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontResource](./nn-dwrite_3-idwritefontresource.md) interface. On successful completion, the function sets the pointer to a newly created font resource object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-createfontresource
     */
    CreateFontResource(listIndex) {
        result := ComCall(23, this, "uint", listIndex, "ptr*", &fontResource := 0, "HRESULT")
        return IDWriteFontResource(fontResource)
    }

    /**
     * Creates a font face for a single item (rather than going through the font face reference).
     * @param {Integer} listIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Zero-based index of the font item in the set.
     * @returns {IDWriteFontFace5} Type: **[IDWriteFontFace5](./nn-dwrite_3-idwritefontface5.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontFace5](./nn-dwrite_3-idwritefontface5.md) interface. On successful completion, the function sets the pointer to a newly created font face object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-createfontface
     */
    CreateFontFace(listIndex) {
        result := ComCall(24, this, "uint", listIndex, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace5(fontFace)
    }

    /**
     * Retrieves the locality of a single item.
     * @remarks
     * The locality enumeration. For fully local files, the result will always be **DWRITE_LOCALITY_LOCAL**. For downloadable files, the result depends on how much of the file has been downloaded.
     * @param {Integer} listIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Zero-based index of the font item in the set.
     * @returns {Integer} Type: **[DWRITE_LOCALITY](./ne-dwrite_3-dwrite_locality.md)**
     * 
     * A value indicating the locality.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfontlocality
     */
    GetFontLocality(listIndex) {
        result := ComCall(25, this, "uint", listIndex, "int")
        return result
    }
}
