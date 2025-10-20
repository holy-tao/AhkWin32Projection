#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allows you to access fallback fonts from the font list.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nn-dwrite_2-idwritefontfallback
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFallback extends IUnknown{
    /**
     * The interface identifier for IDWriteFontFallback
     * @type {Guid}
     */
    static IID => Guid("{efa008f9-f7a1-48bf-b05c-f224713cc0ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDWriteTextAnalysisSource>} analysisSource 
     * @param {Integer} textPosition 
     * @param {Integer} textLength 
     * @param {Pointer<IDWriteFontCollection>} baseFontCollection 
     * @param {PWSTR} baseFamilyName 
     * @param {Integer} baseWeight 
     * @param {Integer} baseStyle 
     * @param {Integer} baseStretch 
     * @param {Pointer<UInt32>} mappedLength 
     * @param {Pointer<IDWriteFont>} mappedFont 
     * @param {Pointer<Single>} scale 
     * @returns {HRESULT} 
     */
    MapCharacters(analysisSource, textPosition, textLength, baseFontCollection, baseFamilyName, baseWeight, baseStyle, baseStretch, mappedLength, mappedFont, scale) {
        baseFamilyName := baseFamilyName is String ? StrPtr(baseFamilyName) : baseFamilyName

        result := ComCall(3, this, "ptr", analysisSource, "uint", textPosition, "uint", textLength, "ptr", baseFontCollection, "ptr", baseFamilyName, "int", baseWeight, "int", baseStyle, "int", baseStretch, "uint*", mappedLength, "ptr", mappedFont, "float*", scale, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
