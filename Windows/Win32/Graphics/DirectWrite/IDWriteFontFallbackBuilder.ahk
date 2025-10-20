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
     * 
     * @param {Pointer<DWRITE_UNICODE_RANGE>} ranges 
     * @param {Integer} rangesCount 
     * @param {Pointer<UInt16>} targetFamilyNames 
     * @param {Integer} targetFamilyNamesCount 
     * @param {Pointer<IDWriteFontCollection>} fontCollection 
     * @param {PWSTR} localeName 
     * @param {PWSTR} baseFamilyName 
     * @param {Float} scale 
     * @returns {HRESULT} 
     */
    AddMapping(ranges, rangesCount, targetFamilyNames, targetFamilyNamesCount, fontCollection, localeName, baseFamilyName, scale) {
        localeName := localeName is String ? StrPtr(localeName) : localeName
        baseFamilyName := baseFamilyName is String ? StrPtr(baseFamilyName) : baseFamilyName

        result := ComCall(3, this, "ptr", ranges, "uint", rangesCount, "ushort*", targetFamilyNames, "uint", targetFamilyNamesCount, "ptr", fontCollection, "ptr", localeName, "ptr", baseFamilyName, "float", scale, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFallback>} fontFallback 
     * @returns {HRESULT} 
     */
    AddMappings(fontFallback) {
        result := ComCall(4, this, "ptr", fontFallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFallback>} fontFallback 
     * @returns {HRESULT} 
     */
    CreateFontFallback(fontFallback) {
        result := ComCall(5, this, "ptr", fontFallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
