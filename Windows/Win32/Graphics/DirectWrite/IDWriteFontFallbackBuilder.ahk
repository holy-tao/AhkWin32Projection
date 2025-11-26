#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFallback.ahk
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
     * Appends a single mapping to the list. Call this once for each additional mapping.
     * @param {Pointer<DWRITE_UNICODE_RANGE>} ranges Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_unicode_range">DWRITE_UNICODE_RANGE</a>*</b>
     * 
     * Unicode ranges that apply to this mapping.
     * @param {Integer} rangesCount Type: <b>UINT32</b>
     * 
     * Number of Unicode ranges.
     * @param {Pointer<Pointer<Integer>>} targetFamilyNames Type: <b>const WCHAR**</b>
     * 
     * List of target family name strings.
     * @param {Integer} targetFamilyNamesCount Type: <b>UINT32</b>
     * 
     * Number of target family names.
     * @param {IDWriteFontCollection} fontCollection Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollection">IDWriteFontCollection</a></b>
     * 
     * Optional explicit font collection for this mapping.
     * @param {PWSTR} localeName Type: <b>const WCHAR*</b>
     * 
     * Locale of the context.
     * @param {PWSTR} baseFamilyName Type: <b>const WCHAR*</b>
     * 
     * Base family name to match against, if applicable.
     * @param {Float} scale Type: <b>FLOAT</b>
     * 
     * Scale factor to multiply the result target font by.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritefontfallbackbuilder-addmapping
     */
    AddMapping(ranges, rangesCount, targetFamilyNames, targetFamilyNamesCount, fontCollection, localeName, baseFamilyName, scale) {
        localeName := localeName is String ? StrPtr(localeName) : localeName
        baseFamilyName := baseFamilyName is String ? StrPtr(baseFamilyName) : baseFamilyName

        targetFamilyNamesMarshal := targetFamilyNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", ranges, "uint", rangesCount, targetFamilyNamesMarshal, targetFamilyNames, "uint", targetFamilyNamesCount, "ptr", fontCollection, "ptr", localeName, "ptr", baseFamilyName, "float", scale, "HRESULT")
        return result
    }

    /**
     * Add all the mappings from an existing font fallback object.
     * @param {IDWriteFontFallback} fontFallback Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/nn-dwrite_2-idwritefontfallback">IDWriteFontFallback</a>*</b>
     * 
     * An existing font fallback object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritefontfallbackbuilder-addmappings
     */
    AddMappings(fontFallback) {
        result := ComCall(4, this, "ptr", fontFallback, "HRESULT")
        return result
    }

    /**
     * Creates the finalized fallback object from the mappings added.
     * @returns {IDWriteFontFallback} Contains an address of a pointer to the created fallback list.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritefontfallbackbuilder-createfontfallback
     */
    CreateFontFallback() {
        result := ComCall(5, this, "ptr*", &fontFallback := 0, "HRESULT")
        return IDWriteFontFallback(fontFallback)
    }
}
