#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteTextAnalysisSink.ahk

/**
 * The interface you implement to receive the output of the text analyzers.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nn-dwrite_1-idwritetextanalysissink1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextAnalysisSink1 extends IDWriteTextAnalysisSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteTextAnalysisSink1
     * @type {Guid}
     */
    static IID => Guid("{b0d941a0-85e7-4d8b-9fd3-5ced9934482a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetGlyphOrientation"]

    /**
     * 
     * @param {Integer} textPosition 
     * @param {Integer} textLength 
     * @param {Integer} glyphOrientationAngle 
     * @param {Integer} adjustedBidiLevel 
     * @param {BOOL} isSideways 
     * @param {BOOL} isRightToLeft 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritetextanalysissink1-setglyphorientation
     */
    SetGlyphOrientation(textPosition, textLength, glyphOrientationAngle, adjustedBidiLevel, isSideways, isRightToLeft) {
        result := ComCall(7, this, "uint", textPosition, "uint", textLength, "int", glyphOrientationAngle, "char", adjustedBidiLevel, "int", isSideways, "int", isRightToLeft, "HRESULT")
        return result
    }
}
