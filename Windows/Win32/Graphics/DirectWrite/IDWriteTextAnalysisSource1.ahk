#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteTextAnalysisSource.ahk

/**
 * The interface you implement to provide needed information to the text analyzer, like the text and associated text properties.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nn-dwrite_1-idwritetextanalysissource1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextAnalysisSource1 extends IDWriteTextAnalysisSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteTextAnalysisSource1
     * @type {Guid}
     */
    static IID => Guid("{639cfad8-0fb4-4b21-a58a-067920120009}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVerticalGlyphOrientation"]

    /**
     * Used by the text analyzer to obtain the desired glyph orientation and resolved bidi level.
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * The text position.
     * @param {Pointer<Integer>} textLength Type: <b>UINT32*</b>
     * 
     * A pointer to the text length.
     * @param {Pointer<Integer>} glyphOrientation Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_vertical_glyph_orientation">DWRITE_VERTICAL_GLYPH_ORIENTATION</a>*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_vertical_glyph_orientation">DWRITE_VERTICAL_GLYPH_ORIENTATION</a>-typed value that specifies the desired kind of glyph orientation for the text.
     * @param {Pointer<Integer>} bidiLevel Type: <b>UINT8*</b>
     * 
     * A pointer to the resolved bidi level.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returning an error will abort the
     *     analysis.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritetextanalysissource1-getverticalglyphorientation
     */
    GetVerticalGlyphOrientation(textPosition, textLength, glyphOrientation, bidiLevel) {
        textLengthMarshal := textLength is VarRef ? "uint*" : "ptr"
        glyphOrientationMarshal := glyphOrientation is VarRef ? "int*" : "ptr"
        bidiLevelMarshal := bidiLevel is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "uint", textPosition, textLengthMarshal, textLength, glyphOrientationMarshal, glyphOrientation, bidiLevelMarshal, bidiLevel, "HRESULT")
        return result
    }
}
