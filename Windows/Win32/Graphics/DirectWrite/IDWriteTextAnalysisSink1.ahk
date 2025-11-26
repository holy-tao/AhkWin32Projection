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
     * The text analyzer calls back to this to report the actual orientation of each character for shaping and drawing.
     * @param {Integer} textPosition Type: <b>UINT32 </b>
     * 
     * The starting position to report from.
     * @param {Integer} textLength Type: <b>UINT32 </b>
     * 
     * Number of UTF-16 units of the reported range.
     * @param {Integer} glyphOrientationAngle Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_glyph_orientation_angle">DWRITE_GLYPH_ORIENTATION_ANGLE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_glyph_orientation_angle">DWRITE_GLYPH_ORIENTATION_ANGLE</a>-typed value that specifies the angle of the glyphs within the text
     *     range (pass to <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritetextanalyzer1-getglyphorientationtransform">IDWriteTextAnalyzer1::GetGlyphOrientationTransform</a> to get the world
     *     relative transform).
     * @param {Integer} adjustedBidiLevel Type: <b>UINT8</b>
     * 
     * The adjusted bidi level to be used by
     *     the client layout for reordering runs. This will differ from the
     *     resolved bidi level retrieved from the source for cases such as
     *     Arabic stacked top-to-bottom, where the glyphs are still shaped
     *     as RTL, but the runs are TTB along with any CJK or Latin.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * Whether the glyphs are rotated on their side,
     *     which is the default case for CJK and the case stacked Latin
     * @param {BOOL} isRightToLeft Type: <b>BOOL</b>
     * 
     * Whether the script should be shaped as
     *     right-to-left. For Arabic stacked top-to-bottom, even when the
     *     adjusted bidi level is coerced to an even level, this will still
     *     be true.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns a successful code or an error code to abort analysis.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritetextanalysissink1-setglyphorientation
     */
    SetGlyphOrientation(textPosition, textLength, glyphOrientationAngle, adjustedBidiLevel, isSideways, isRightToLeft) {
        result := ComCall(7, this, "uint", textPosition, "uint", textLength, "int", glyphOrientationAngle, "char", adjustedBidiLevel, "int", isSideways, "int", isRightToLeft, "HRESULT")
        return result
    }
}
