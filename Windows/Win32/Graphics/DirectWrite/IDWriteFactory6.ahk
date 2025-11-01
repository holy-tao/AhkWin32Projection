#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFactory5.ahk

/**
 * This interface represents a factory object from which all DirectWrite objects are created. **IDWriteFactory6** adds new facilities for working with fonts and font resources.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefactory6
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
     * 
     * @param {IDWriteFontFile} fontFile 
     * @param {Integer} faceIndex 
     * @param {Integer} fontSimulations 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @param {Pointer<IDWriteFontFaceReference1>} fontFaceReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory6-createfontfacereference
     */
    CreateFontFaceReference(fontFile, faceIndex, fontSimulations, fontAxisValues, fontAxisValueCount, fontFaceReference) {
        result := ComCall(48, this, "ptr", fontFile, "uint", faceIndex, "int", fontSimulations, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr*", fontFaceReference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteFontFile} fontFile 
     * @param {Integer} faceIndex 
     * @param {Pointer<IDWriteFontResource>} fontResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory6-createfontresource
     */
    CreateFontResource(fontFile, faceIndex, fontResource) {
        result := ComCall(49, this, "ptr", fontFile, "uint", faceIndex, "ptr*", fontResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} includeDownloadableFonts 
     * @param {Pointer<IDWriteFontSet1>} fontSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory6-getsystemfontset
     */
    GetSystemFontSet(includeDownloadableFonts, fontSet) {
        result := ComCall(50, this, "int", includeDownloadableFonts, "ptr*", fontSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} includeDownloadableFonts 
     * @param {Integer} fontFamilyModel 
     * @param {Pointer<IDWriteFontCollection2>} fontCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory6-getsystemfontcollection
     */
    GetSystemFontCollection(includeDownloadableFonts, fontFamilyModel, fontCollection) {
        result := ComCall(51, this, "int", includeDownloadableFonts, "int", fontFamilyModel, "ptr*", fontCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteFontSet} fontSet 
     * @param {Integer} fontFamilyModel 
     * @param {Pointer<IDWriteFontCollection2>} fontCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory6-createfontcollectionfromfontset
     */
    CreateFontCollectionFromFontSet(fontSet, fontFamilyModel, fontCollection) {
        result := ComCall(52, this, "ptr", fontSet, "int", fontFamilyModel, "ptr*", fontCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontSetBuilder2>} fontSetBuilder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory6-createfontsetbuilder
     */
    CreateFontSetBuilder(fontSetBuilder) {
        result := ComCall(53, this, "ptr*", fontSetBuilder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} fontFamilyName 
     * @param {IDWriteFontCollection} fontCollection 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @param {Float} fontSize 
     * @param {PWSTR} localeName 
     * @param {Pointer<IDWriteTextFormat3>} textFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory6-createtextformat
     */
    CreateTextFormat(fontFamilyName, fontCollection, fontAxisValues, fontAxisValueCount, fontSize, localeName, textFormat) {
        fontFamilyName := fontFamilyName is String ? StrPtr(fontFamilyName) : fontFamilyName
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(54, this, "ptr", fontFamilyName, "ptr", fontCollection, "ptr", fontAxisValues, "uint", fontAxisValueCount, "float", fontSize, "ptr", localeName, "ptr*", textFormat, "HRESULT")
        return result
    }
}
