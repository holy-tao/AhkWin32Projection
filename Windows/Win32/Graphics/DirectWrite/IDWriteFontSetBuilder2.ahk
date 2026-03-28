#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontSetBuilder1.ahk

/**
 * Contains methods for building a font set. (IDWriteFontSetBuilder2)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontsetbuilder2
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontSetBuilder2 extends IDWriteFontSetBuilder1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontSetBuilder2
     * @type {Guid}
     */
    static IID => Guid("{ee5ba612-b131-463c-8f4f-3189b9401e45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddFont", "AddFontFile"]

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
     * @param {Integer} fontSimulations Type: **[DWRITE_FONT_SIMULATIONS](../dwrite/ne-dwrite-dwrite_font_simulations.md)**
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
     * @param {Pointer<DWRITE_FONT_PROPERTY>} _properties 
     * @param {Integer} propertyCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of properties defined.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontsetbuilder2-addfont
     */
    AddFont(fontFile, fontFaceIndex, fontSimulations, fontAxisValues, fontAxisValueCount, fontAxisRanges, fontAxisRangeCount, _properties, propertyCount) {
        result := ComCall(8, this, "ptr", fontFile, "uint", fontFaceIndex, "int", fontSimulations, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr", fontAxisRanges, "uint", fontAxisRangeCount, "ptr", _properties, "uint", propertyCount, "HRESULT")
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
}
