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
     * Determines an appropriate font to use to render the beginning range of text.
     * @param {IDWriteTextAnalysisSource} analysisSource Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextanalysissource">IDWriteTextAnalysisSource</a>*</b>
     * 
     * The text source implementation holds the text and locale.
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * Starting position to analyze.
     * @param {Integer} textLength Type: <b>UINT32</b>
     * 
     * Length of the text to analyze.
     * @param {IDWriteFontCollection} baseFontCollection Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollection">IDWriteFontCollection</a>*</b>
     * 
     * Default font collection to use.
     * @param {PWSTR} baseFamilyName Type: <b>const wchar_t*</b>
     * 
     * Family name of the base font. If you pass null, no matching     will be done against the family.
     * @param {Integer} baseWeight Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_weight">DWRITE_FONT_WEIGHT</a></b>
     * 
     * The desired weight.
     * @param {Integer} baseStyle Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_style">DWRITE_FONT_STYLE</a></b>
     * 
     * The desired style.
     * @param {Integer} baseStretch Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_stretch">DWRITE_FONT_STRETCH</a></b>
     * 
     * The desired stretch.
     * @param {Pointer<Integer>} mappedLength Type: <b>UINT32*</b>
     * 
     * Length of text mapped to the mapped font. This will always be less than     or equal to the text length and greater than zero (if the text length is non-zero) so     the caller advances at least one character.
     * @param {Pointer<IDWriteFont>} mappedFont Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefont">IDWriteFont</a>**</b>
     * 
     * The font that should be used to render the first <i>mappedLength</i>     characters of the text. If it returns NULL, that means that no font can render the     text, and <i>mappedLength</i> is the number of characters to skip (rendered with a missing
     *          glyph).
     * @param {Pointer<Float>} scale Type: <b>FLOAT*</b>
     * 
     * Scale factor to multiply the em size of the returned font by.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritefontfallback-mapcharacters
     */
    MapCharacters(analysisSource, textPosition, textLength, baseFontCollection, baseFamilyName, baseWeight, baseStyle, baseStretch, mappedLength, mappedFont, scale) {
        baseFamilyName := baseFamilyName is String ? StrPtr(baseFamilyName) : baseFamilyName

        mappedLengthMarshal := mappedLength is VarRef ? "uint*" : "ptr"
        scaleMarshal := scale is VarRef ? "float*" : "ptr"

        result := ComCall(3, this, "ptr", analysisSource, "uint", textPosition, "uint", textLength, "ptr", baseFontCollection, "ptr", baseFamilyName, "int", baseWeight, "int", baseStyle, "int", baseStretch, mappedLengthMarshal, mappedLength, "ptr*", mappedFont, scaleMarshal, scale, "HRESULT")
        return result
    }
}
