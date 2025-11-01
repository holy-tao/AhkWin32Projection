#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFace2.ahk

/**
 * Contains font face type, appropriate file references, and face identification data.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontface3
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFace3 extends IDWriteFontFace2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFace3
     * @type {Guid}
     */
    static IID => Guid("{d37d7598-09be-4222-a236-2081341cc1f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 35

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontFaceReference", "GetPanose", "GetWeight", "GetStretch", "GetStyle", "GetFamilyNames", "GetFaceNames", "GetInformationalStrings", "HasCharacter", "GetRecommendedRenderingMode", "IsCharacterLocal", "IsGlyphLocal", "AreCharactersLocal", "AreGlyphsLocal"]

    /**
     * 
     * @param {Pointer<IDWriteFontFaceReference>} fontFaceReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface3-getfontfacereference
     */
    GetFontFaceReference(fontFaceReference) {
        result := ComCall(35, this, "ptr*", fontFaceReference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_PANOSE>} panose 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface3-getpanose
     */
    GetPanose(panose) {
        ComCall(36, this, "ptr", panose)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface3-getweight
     */
    GetWeight() {
        result := ComCall(37, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface3-getstretch
     */
    GetStretch() {
        result := ComCall(38, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface3-getstyle
     */
    GetStyle() {
        result := ComCall(39, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteLocalizedStrings>} names 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface3-getfamilynames
     */
    GetFamilyNames(names) {
        result := ComCall(40, this, "ptr*", names, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteLocalizedStrings>} names 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface3-getfacenames
     */
    GetFaceNames(names) {
        result := ComCall(41, this, "ptr*", names, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} informationalStringID 
     * @param {Pointer<IDWriteLocalizedStrings>} informationalStrings 
     * @param {Pointer<BOOL>} exists 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface3-getinformationalstrings
     */
    GetInformationalStrings(informationalStringID, informationalStrings, exists) {
        result := ComCall(42, this, "int", informationalStringID, "ptr*", informationalStrings, "ptr", exists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} unicodeValue 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface3-hascharacter
     */
    HasCharacter(unicodeValue) {
        result := ComCall(43, this, "uint", unicodeValue, "int")
        return result
    }

    /**
     * 
     * @param {Float} fontEmSize 
     * @param {Float} dpiX 
     * @param {Float} dpiY 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @param {BOOL} isSideways 
     * @param {Integer} outlineThreshold 
     * @param {Integer} measuringMode 
     * @param {IDWriteRenderingParams} renderingParams 
     * @param {Pointer<Integer>} renderingMode 
     * @param {Pointer<Integer>} gridFitMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface3-getrecommendedrenderingmode
     */
    GetRecommendedRenderingMode(fontEmSize, dpiX, dpiY, transform, isSideways, outlineThreshold, measuringMode, renderingParams, renderingMode, gridFitMode) {
        result := ComCall(44, this, "float", fontEmSize, "float", dpiX, "float", dpiY, "ptr", transform, "int", isSideways, "int", outlineThreshold, "int", measuringMode, "ptr", renderingParams, "int*", renderingMode, "int*", gridFitMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} unicodeValue 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface3-ischaracterlocal
     */
    IsCharacterLocal(unicodeValue) {
        result := ComCall(45, this, "uint", unicodeValue, "int")
        return result
    }

    /**
     * 
     * @param {Integer} glyphId 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface3-isglyphlocal
     */
    IsGlyphLocal(glyphId) {
        result := ComCall(46, this, "ushort", glyphId, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} characters 
     * @param {Integer} characterCount 
     * @param {BOOL} enqueueIfNotLocal 
     * @param {Pointer<BOOL>} isLocal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface3-arecharacterslocal
     */
    AreCharactersLocal(characters, characterCount, enqueueIfNotLocal, isLocal) {
        characters := characters is String ? StrPtr(characters) : characters

        result := ComCall(47, this, "ptr", characters, "uint", characterCount, "int", enqueueIfNotLocal, "ptr", isLocal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} glyphIndices 
     * @param {Integer} glyphCount 
     * @param {BOOL} enqueueIfNotLocal 
     * @param {Pointer<BOOL>} isLocal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface3-areglyphslocal
     */
    AreGlyphsLocal(glyphIndices, glyphCount, enqueueIfNotLocal, isLocal) {
        result := ComCall(48, this, "ushort*", glyphIndices, "uint", glyphCount, "int", enqueueIfNotLocal, "ptr", isLocal, "HRESULT")
        return result
    }
}
