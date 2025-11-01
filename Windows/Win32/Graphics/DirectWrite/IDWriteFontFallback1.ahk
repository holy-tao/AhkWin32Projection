#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFallback.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfallback1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFallback1 extends IDWriteFontFallback{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MapCharacters"]

    /**
     * 
     * @param {IDWriteTextAnalysisSource} analysisSource 
     * @param {Integer} textPosition 
     * @param {Integer} textLength 
     * @param {IDWriteFontCollection} baseFontCollection 
     * @param {PWSTR} baseFamilyName 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @param {Pointer<Integer>} mappedLength 
     * @param {Pointer<Float>} scale 
     * @param {Pointer<IDWriteFontFace5>} mappedFontFace 
     * @returns {HRESULT} 
     */
    MapCharacters(analysisSource, textPosition, textLength, baseFontCollection, baseFamilyName, fontAxisValues, fontAxisValueCount, mappedLength, scale, mappedFontFace) {
        baseFamilyName := baseFamilyName is String ? StrPtr(baseFamilyName) : baseFamilyName

        mappedLengthMarshal := mappedLength is VarRef ? "uint*" : "ptr"
        scaleMarshal := scale is VarRef ? "float*" : "ptr"

        result := ComCall(4, this, "ptr", analysisSource, "uint", textPosition, "uint", textLength, "ptr", baseFontCollection, "ptr", baseFamilyName, "ptr", fontAxisValues, "uint", fontAxisValueCount, mappedLengthMarshal, mappedLength, scaleMarshal, scale, "ptr*", mappedFontFace, "HRESULT")
        return result
    }
}
