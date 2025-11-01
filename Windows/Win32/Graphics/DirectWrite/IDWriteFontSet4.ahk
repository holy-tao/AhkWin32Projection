#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontSet3.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset4
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontSet4 extends IDWriteFontSet3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontSet4
     * @type {Guid}
     */
    static IID => Guid("{eec175fc-bea9-4c86-8b53-ccbdd7df0c82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConvertWeightStretchStyleToFontAxisValues", "GetMatchingFonts"]

    /**
     * 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} inputAxisValues 
     * @param {Integer} inputAxisCount 
     * @param {Integer} fontWeight 
     * @param {Integer} fontStretch 
     * @param {Integer} fontStyle 
     * @param {Float} fontSize 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} outputAxisValues 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset4-convertweightstretchstyletofontaxisvalues
     */
    ConvertWeightStretchStyleToFontAxisValues(inputAxisValues, inputAxisCount, fontWeight, fontStretch, fontStyle, fontSize, outputAxisValues) {
        result := ComCall(30, this, "ptr", inputAxisValues, "uint", inputAxisCount, "int", fontWeight, "int", fontStretch, "int", fontStyle, "float", fontSize, "ptr", outputAxisValues, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} familyName 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @param {Integer} allowedSimulations 
     * @param {Pointer<IDWriteFontSet4>} matchingFonts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset4-getmatchingfonts
     */
    GetMatchingFonts(familyName, fontAxisValues, fontAxisValueCount, allowedSimulations, matchingFonts) {
        familyName := familyName is String ? StrPtr(familyName) : familyName

        result := ComCall(31, this, "ptr", familyName, "ptr", fontAxisValues, "uint", fontAxisValueCount, "int", allowedSimulations, "ptr*", matchingFonts, "HRESULT")
        return result
    }
}
