#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFallback.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFallback1 extends IDWriteFontFallback{
    /**
     * The interface identifier for IDWriteFontFallback1
     * @type {Guid}
     */
    static IID => Guid("{2397599d-dd0d-4681-bd6a-f4f31eaade77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer<IDWriteTextAnalysisSource>} analysisSource 
     * @param {Integer} textPosition 
     * @param {Integer} textLength 
     * @param {Pointer<IDWriteFontCollection>} baseFontCollection 
     * @param {PWSTR} baseFamilyName 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @param {Pointer<UInt32>} mappedLength 
     * @param {Pointer<Single>} scale 
     * @param {Pointer<IDWriteFontFace5>} mappedFontFace 
     * @returns {HRESULT} 
     */
    MapCharacters(analysisSource, textPosition, textLength, baseFontCollection, baseFamilyName, fontAxisValues, fontAxisValueCount, mappedLength, scale, mappedFontFace) {
        baseFamilyName := baseFamilyName is String ? StrPtr(baseFamilyName) : baseFamilyName

        result := ComCall(4, this, "ptr", analysisSource, "uint", textPosition, "uint", textLength, "ptr", baseFontCollection, "ptr", baseFamilyName, "ptr", fontAxisValues, "uint", fontAxisValueCount, "uint*", mappedLength, "float*", scale, "ptr", mappedFontFace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
