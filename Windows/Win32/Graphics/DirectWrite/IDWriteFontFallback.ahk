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

    static sizeof => A_PtrSize
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
     * @param {Integer} baseWeight 
     * @param {Integer} baseStyle 
     * @param {Integer} baseStretch 
     * @param {Pointer<Integer>} mappedLength 
     * @param {Pointer<IDWriteFont>} mappedFont 
     * @param {Pointer<Float>} scale 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritefontfallback-mapcharacters
     */
    MapCharacters(analysisSource, textPosition, textLength, baseFontCollection, baseFamilyName, baseWeight, baseStyle, baseStretch, mappedLength, mappedFont, scale) {
        baseFamilyName := baseFamilyName is String ? StrPtr(baseFamilyName) : baseFamilyName

        mappedLengthMarshal := mappedLength is VarRef ? "uint*" : "ptr"
        scaleMarshal := scale is VarRef ? "float*" : "ptr"

        result := ComCall(3, this, "ptr", analysisSource, "uint", textPosition, "uint", textLength, "ptr", baseFontCollection, "ptr", baseFamilyName, "int", baseWeight, "int", baseStyle, "int", baseStretch, mappedLengthMarshal, mappedLength, "ptr*", mappedFont, scaleMarshal, scale, "HRESULT")
        return result
    }
}
