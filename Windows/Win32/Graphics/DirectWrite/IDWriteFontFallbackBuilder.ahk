#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allows you to create Unicode font fallback mappings and create a font fall back object from those mappings.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nn-dwrite_2-idwritefontfallbackbuilder
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFallbackBuilder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFallbackBuilder
     * @type {Guid}
     */
    static IID => Guid("{fd882d06-8aba-4fb8-b849-8be8b73e14de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddMapping", "AddMappings", "CreateFontFallback"]

    /**
     * 
     * @param {Pointer<DWRITE_UNICODE_RANGE>} ranges 
     * @param {Integer} rangesCount 
     * @param {Pointer<Pointer<Integer>>} targetFamilyNames 
     * @param {Integer} targetFamilyNamesCount 
     * @param {IDWriteFontCollection} fontCollection 
     * @param {PWSTR} localeName 
     * @param {PWSTR} baseFamilyName 
     * @param {Float} scale 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritefontfallbackbuilder-addmapping
     */
    AddMapping(ranges, rangesCount, targetFamilyNames, targetFamilyNamesCount, fontCollection, localeName, baseFamilyName, scale) {
        localeName := localeName is String ? StrPtr(localeName) : localeName
        baseFamilyName := baseFamilyName is String ? StrPtr(baseFamilyName) : baseFamilyName

        targetFamilyNamesMarshal := targetFamilyNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", ranges, "uint", rangesCount, targetFamilyNamesMarshal, targetFamilyNames, "uint", targetFamilyNamesCount, "ptr", fontCollection, "ptr", localeName, "ptr", baseFamilyName, "float", scale, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteFontFallback} fontFallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontfallbackbuilder-addmappings
     */
    AddMappings(fontFallback) {
        result := ComCall(4, this, "ptr", fontFallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFallback>} fontFallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontfallbackbuilder-createfontfallback
     */
    CreateFontFallback(fontFallback) {
        result := ComCall(5, this, "ptr*", fontFallback, "HRESULT")
        return result
    }
}
