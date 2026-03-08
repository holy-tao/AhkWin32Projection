#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFaceReference1.ahk
#Include .\IDWriteFontResource.ahk
#Include .\IDWriteFontSet1.ahk
#Include .\IDWriteFontCollection2.ahk
#Include .\IDWriteFontSetBuilder2.ahk
#Include .\IDWriteTextFormat3.ahk
#Include .\IDWriteFactory5.ahk

/**
 * This interface represents a factory object from which all DirectWrite objects are created. **IDWriteFactory6** adds new facilities for working with fonts and font resources.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefactory6
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFactory6 extends IDWriteFactory5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFactory6
     * @type {Guid}
     */
    static IID => Guid("{f3744d80-21f7-42eb-b35d-995bc72fc223}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 48

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFontFaceReference", "CreateFontResource", "GetSystemFontSet", "GetSystemFontCollection", "CreateFontCollectionFromFontSet", "CreateFontSetBuilder", "CreateTextFormat"]

    /**
     * Creates a reference to a specific font instance within a file.
     * @param {IDWriteFontFile} fontFile Type: **[IDWriteFontFile](../dwrite/nn-dwrite-idwritefontfile.md)\***
     * 
     * A user-provided font file representing the font face.
     * @param {Integer} faceIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The zero-based index of a font face in cases when the font file contains a collection of font faces. If the font file contains a single face, then set this value to zero.
     * @param {Integer} fontSimulations Type: **[DWRITE_FONT_SIMULATIONS](../dwrite/ne-dwrite-dwrite_font_simulations.md)**
     * 
     * Font face simulation flags for algorithmic emboldening and italicization.
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues Type: **[DWRITE_FONT_AXIS_VALUE](./ns-dwrite_3-dwrite_font_axis_value.md) const \***
     * 
     * A pointer to an array containing a list of font axis values. The array should be the size (the number of elements) indicated by the *fontAxisValueCount* argument.
     * @param {Integer} fontAxisValueCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of font axis values contained in the *fontAxisValues* array.
     * @returns {IDWriteFontFaceReference1} Type: **[IDWriteFontFaceReference1](./nn-dwrite_3-idwritefontfacereference1.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontFaceReference1](./nn-dwrite_3-idwritefontfacereference1.md) interface. On successful completion, the function sets the pointer to a newly created font face reference object, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory6-createfontfacereference
     */
    CreateFontFaceReference(fontFile, faceIndex, fontSimulations, fontAxisValues, fontAxisValueCount) {
        result := ComCall(48, this, "ptr", fontFile, "uint", faceIndex, "int", fontSimulations, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference1(fontFaceReference)
    }

    /**
     * Creates a font resource, given a font file and a face index.
     * @param {IDWriteFontFile} fontFile Type: **[IDWriteFontFile](../dwrite/nn-dwrite-idwritefontfile.md)\***
     * 
     * A user-provided font file representing the font face.
     * @param {Integer} faceIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The zero-based index of a font face in cases when the font file contains a collection of font faces. If the font file contains a single face, then set this value to zero.
     * @returns {IDWriteFontResource} Type: **[IDWriteFontResource](./nn-dwrite_3-idwritefontresource.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontResource](./nn-dwrite_3-idwritefontresource.md) interface. On successful completion, the function sets the pointer to a newly created font resource object, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory6-createfontresource
     */
    CreateFontResource(fontFile, faceIndex) {
        result := ComCall(49, this, "ptr", fontFile, "uint", faceIndex, "ptr*", &fontResource := 0, "HRESULT")
        return IDWriteFontResource(fontResource)
    }

    /**
     * Retrieves the set of system fonts. (IDWriteFactory6::GetSystemFontSet)
     * @param {BOOL} includeDownloadableFonts Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * `true` if you want to include downloadable fonts. `false` if you only want locally installed fonts.
     * @returns {IDWriteFontSet1} Type: **[IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md) interface. On successful completion, the function sets the pointer to the font set object, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory6-getsystemfontset
     */
    GetSystemFontSet(includeDownloadableFonts) {
        result := ComCall(50, this, "int", includeDownloadableFonts, "ptr*", &fontSet := 0, "HRESULT")
        return IDWriteFontSet1(fontSet)
    }

    /**
     * Retrieves a collection of fonts, grouped into families. (IDWriteFactory6::GetSystemFontCollection)
     * @param {BOOL} includeDownloadableFonts Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * `true` if you want to include downloadable fonts. `false` if you only want locally installed fonts.
     * @param {Integer} fontFamilyModel Type: **[DWRITE_FONT_FAMILY_MODEL](./ne-dwrite_3-dwrite_font_family_model.md)**
     * 
     * How to group families in the collection.
     * @returns {IDWriteFontCollection2} Type: **[IDWriteFontCollection2](./nn-dwrite_3-idwritefontcollection2.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontCollection2](./nn-dwrite_3-idwritefontcollection2.md) interface. On successful completion, the function sets the pointer to a newly created font collection object, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory6-getsystemfontcollection
     */
    GetSystemFontCollection(includeDownloadableFonts, fontFamilyModel) {
        result := ComCall(51, this, "int", includeDownloadableFonts, "int", fontFamilyModel, "ptr*", &fontCollection := 0, "HRESULT")
        return IDWriteFontCollection2(fontCollection)
    }

    /**
     * From a font set, create a collection of fonts grouped into families.
     * @param {IDWriteFontSet} fontSet Type: **[IDWriteFontSet](./nn-dwrite_3-idwritefontset.md)\***
     * 
     * A set of fonts to use to build the collection.
     * @param {Integer} fontFamilyModel Type: **[DWRITE_FONT_FAMILY_MODEL](./ne-dwrite_3-dwrite_font_family_model.md)**
     * 
     * How to group families in the collection.
     * @returns {IDWriteFontCollection2} Type: **[IDWriteFontCollection2](./nn-dwrite_3-idwritefontcollection2.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontCollection2](./nn-dwrite_3-idwritefontcollection2.md) interface. On successful completion, the function sets the pointer to a newly created font collection object, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory6-createfontcollectionfromfontset
     */
    CreateFontCollectionFromFontSet(fontSet, fontFamilyModel) {
        result := ComCall(52, this, "ptr", fontSet, "int", fontFamilyModel, "ptr*", &fontCollection := 0, "HRESULT")
        return IDWriteFontCollection2(fontCollection)
    }

    /**
     * Creates an empty font set builder, ready to add font instances to, and create a custom font set.
     * @returns {IDWriteFontSetBuilder2} Type: **[IDWriteFontSetBuilder2](./nn-dwrite_3-idwritefontsetbuilder2.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontSetBuilder2](./nn-dwrite_3-idwritefontsetbuilder2.md) interface. On successful completion, the function sets the pointer to a newly created font set builder object, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory6-createfontsetbuilder
     */
    CreateFontSetBuilder() {
        result := ComCall(53, this, "ptr*", &fontSetBuilder := 0, "HRESULT")
        return IDWriteFontSetBuilder2(fontSetBuilder)
    }

    /**
     * Creates a text format object used for text layout.I
     * @remarks
     * If *fontCollection* is `nullptr`, then the system font collection is used, grouped by typographic family name ([DWRITE_FONT_FAMILY_MODEL_TYPOGRAPHIC](./ne-dwrite_3-dwrite_font_family_model.md)) without downloadable fonts.
     * @param {PWSTR} fontFamilyName Type: **[WCHAR](/windows/win32/winprog/windows-data-types) const \***
     * 
     * Name of the font family from the collection.
     * @param {IDWriteFontCollection} fontCollection Type: **[IDWriteFontCollection](../dwrite/nn-dwrite-idwritefontcollection.md)\***
     * 
     * Font collection. Use `nullptr` to indicate the system font collection.
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues Type: **[DWRITE_FONT_AXIS_VALUE](./ns-dwrite_3-dwrite_font_axis_value.md) const \***
     * 
     * A pointer to an array containing a list of font axis values. The array should be the size (the number of elements) indicated by the *fontAxisValueCount* argument.
     * @param {Integer} fontAxisValueCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of font axis values contained in the *fontAxisValues* array.
     * @param {Float} fontSize Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * Logical size of the font in DIP units.
     * @param {PWSTR} localeName Type: **[WCHAR](/windows/win32/winprog/windows-data-types) const \***
     * 
     * Locale name (for example, "ja-JP", "en-US", "ar-EG").
     * @returns {IDWriteTextFormat3} Type: **[IDWriteTextFormat3](./nn-dwrite_3-idwritetextformat3.md)\*\***
     * 
     * The address of a pointer to an [IDWriteTextFormat3](./nn-dwrite_3-idwritetextformat3.md) interface. On successful completion, the function sets the pointer to a newly created text format object, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory6-createtextformat
     */
    CreateTextFormat(fontFamilyName, fontCollection, fontAxisValues, fontAxisValueCount, fontSize, localeName) {
        fontFamilyName := fontFamilyName is String ? StrPtr(fontFamilyName) : fontFamilyName
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(54, this, "ptr", fontFamilyName, "ptr", fontCollection, "ptr", fontAxisValues, "uint", fontAxisValueCount, "float", fontSize, "ptr", localeName, "ptr*", &textFormat := 0, "HRESULT")
        return IDWriteTextFormat3(textFormat)
    }
}
