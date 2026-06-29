#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFontSetBuilder2.ahk" { IDWriteFontSetBuilder2 }
#Import ".\IDWriteFontResource.ahk" { IDWriteFontResource }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDWriteFontSet1.ahk" { IDWriteFontSet1 }
#Import ".\DWRITE_FONT_SIMULATIONS.ahk" { DWRITE_FONT_SIMULATIONS }
#Import ".\IDWriteFontCollection2.ahk" { IDWriteFontCollection2 }
#Import ".\IDWriteFontFile.ahk" { IDWriteFontFile }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DWRITE_FONT_AXIS_VALUE.ahk" { DWRITE_FONT_AXIS_VALUE }
#Import ".\IDWriteFactory5.ahk" { IDWriteFactory5 }
#Import ".\IDWriteTextFormat3.ahk" { IDWriteTextFormat3 }
#Import ".\IDWriteFontFaceReference1.ahk" { IDWriteFontFaceReference1 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IDWriteFontSet.ahk" { IDWriteFontSet }
#Import ".\IDWriteFontCollection.ahk" { IDWriteFontCollection }
#Import ".\DWRITE_FONT_FAMILY_MODEL.ahk" { DWRITE_FONT_FAMILY_MODEL }

/**
 * This interface represents a factory object from which all DirectWrite objects are created. **IDWriteFactory6** adds new facilities for working with fonts and font resources.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefactory6
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFactory6 extends IDWriteFactory5 {
    /**
     * The interface identifier for IDWriteFactory6
     * @type {Guid}
     */
    static IID := Guid("{f3744d80-21f7-42eb-b35d-995bc72fc223}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFactory6 interfaces
    */
    struct Vtbl extends IDWriteFactory5.Vtbl {
        CreateFontFaceReference         : IntPtr
        CreateFontResource              : IntPtr
        GetSystemFontSet                : IntPtr
        GetSystemFontCollection         : IntPtr
        CreateFontCollectionFromFontSet : IntPtr
        CreateFontSetBuilder            : IntPtr
        CreateTextFormat                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFactory6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a reference to a specific font instance within a file.
     * @param {IDWriteFontFile} fontFile Type: **[IDWriteFontFile](../dwrite/nn-dwrite-idwritefontfile.md)\***
     * 
     * A user-provided font file representing the font face.
     * @param {Integer} faceIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The zero-based index of a font face in cases when the font file contains a collection of font faces. If the font file contains a single face, then set this value to zero.
     * @param {DWRITE_FONT_SIMULATIONS} fontSimulations Type: **[DWRITE_FONT_SIMULATIONS](../dwrite/ne-dwrite-dwrite_font_simulations.md)**
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
        result := ComCall(48, this, "ptr", fontFile, "uint", faceIndex, DWRITE_FONT_SIMULATIONS, fontSimulations, DWRITE_FONT_AXIS_VALUE.Ptr, fontAxisValues, "uint", fontAxisValueCount, "ptr*", &fontFaceReference := 0, "HRESULT")
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
        result := ComCall(50, this, BOOL, includeDownloadableFonts, "ptr*", &fontSet := 0, "HRESULT")
        return IDWriteFontSet1(fontSet)
    }

    /**
     * Retrieves a collection of fonts, grouped into families. (IDWriteFactory6::GetSystemFontCollection)
     * @param {BOOL} includeDownloadableFonts Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * `true` if you want to include downloadable fonts. `false` if you only want locally installed fonts.
     * @param {DWRITE_FONT_FAMILY_MODEL} fontFamilyModel Type: **[DWRITE_FONT_FAMILY_MODEL](./ne-dwrite_3-dwrite_font_family_model.md)**
     * 
     * How to group families in the collection.
     * @returns {IDWriteFontCollection2} Type: **[IDWriteFontCollection2](./nn-dwrite_3-idwritefontcollection2.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontCollection2](./nn-dwrite_3-idwritefontcollection2.md) interface. On successful completion, the function sets the pointer to a newly created font collection object, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory6-getsystemfontcollection
     */
    GetSystemFontCollection(includeDownloadableFonts, fontFamilyModel) {
        result := ComCall(51, this, BOOL, includeDownloadableFonts, DWRITE_FONT_FAMILY_MODEL, fontFamilyModel, "ptr*", &_fontCollection := 0, "HRESULT")
        return IDWriteFontCollection2(_fontCollection)
    }

    /**
     * From a font set, create a collection of fonts grouped into families.
     * @param {IDWriteFontSet} fontSet Type: **[IDWriteFontSet](./nn-dwrite_3-idwritefontset.md)\***
     * 
     * A set of fonts to use to build the collection.
     * @param {DWRITE_FONT_FAMILY_MODEL} fontFamilyModel Type: **[DWRITE_FONT_FAMILY_MODEL](./ne-dwrite_3-dwrite_font_family_model.md)**
     * 
     * How to group families in the collection.
     * @returns {IDWriteFontCollection2} Type: **[IDWriteFontCollection2](./nn-dwrite_3-idwritefontcollection2.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontCollection2](./nn-dwrite_3-idwritefontcollection2.md) interface. On successful completion, the function sets the pointer to a newly created font collection object, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory6-createfontcollectionfromfontset
     */
    CreateFontCollectionFromFontSet(fontSet, fontFamilyModel) {
        result := ComCall(52, this, "ptr", fontSet, DWRITE_FONT_FAMILY_MODEL, fontFamilyModel, "ptr*", &_fontCollection := 0, "HRESULT")
        return IDWriteFontCollection2(_fontCollection)
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
     * @param {IDWriteFontCollection} _fontCollection Type: **[IDWriteFontCollection](../dwrite/nn-dwrite-idwritefontcollection.md)\***
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
    CreateTextFormat(fontFamilyName, _fontCollection, fontAxisValues, fontAxisValueCount, fontSize, localeName) {
        fontFamilyName := fontFamilyName is String ? StrPtr(fontFamilyName) : fontFamilyName
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(54, this, "ptr", fontFamilyName, "ptr", _fontCollection, DWRITE_FONT_AXIS_VALUE.Ptr, fontAxisValues, "uint", fontAxisValueCount, "float", fontSize, "ptr", localeName, "ptr*", &textFormat := 0, "HRESULT")
        return IDWriteTextFormat3(textFormat)
    }

    Query(iid) {
        if (IDWriteFactory6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateFontFaceReference := CallbackCreate(GetMethod(implObj, "CreateFontFaceReference"), flags, 7)
        this.vtbl.CreateFontResource := CallbackCreate(GetMethod(implObj, "CreateFontResource"), flags, 4)
        this.vtbl.GetSystemFontSet := CallbackCreate(GetMethod(implObj, "GetSystemFontSet"), flags, 3)
        this.vtbl.GetSystemFontCollection := CallbackCreate(GetMethod(implObj, "GetSystemFontCollection"), flags, 4)
        this.vtbl.CreateFontCollectionFromFontSet := CallbackCreate(GetMethod(implObj, "CreateFontCollectionFromFontSet"), flags, 4)
        this.vtbl.CreateFontSetBuilder := CallbackCreate(GetMethod(implObj, "CreateFontSetBuilder"), flags, 2)
        this.vtbl.CreateTextFormat := CallbackCreate(GetMethod(implObj, "CreateTextFormat"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateFontFaceReference)
        CallbackFree(this.vtbl.CreateFontResource)
        CallbackFree(this.vtbl.GetSystemFontSet)
        CallbackFree(this.vtbl.GetSystemFontCollection)
        CallbackFree(this.vtbl.CreateFontCollectionFromFontSet)
        CallbackFree(this.vtbl.CreateFontSetBuilder)
        CallbackFree(this.vtbl.CreateTextFormat)
    }
}
