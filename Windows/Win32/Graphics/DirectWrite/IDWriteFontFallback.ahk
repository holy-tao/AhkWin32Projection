#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allows you to access fallback fonts from the font list.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nn-dwrite_2-idwritefontfallback
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
     * @param {IDWriteTextAnalysisSource} analysisSource 
     * @param {Integer} textPosition Type: **UINT32**
     * 
     * Starting position to analyze.
     * @param {Integer} textLength Type: **UINT32**
     * 
     * Length of the text to analyze.
     * @param {IDWriteFontCollection} baseFontCollection Type: **[**IDWriteFontCollection**](/windows/win32/api/dwrite/nn-dwrite-idwritefontcollection)\***
     * 
     * Default font collection to use.
     * @param {PWSTR} baseFamilyName Type: **const wchar\_t\***
     * 
     * Family name of the base font. If you pass null, no matching will be done against the family.
     * @param {Integer} baseWeight Type: **[**DWRITE\_FONT\_WEIGHT**](/windows/win32/api/dwrite/ne-dwrite-dwrite_font_weight)**
     * 
     * The desired weight.
     * @param {Integer} baseStyle Type: **[**DWRITE\_FONT\_STYLE**](/windows/win32/api/dwrite/ne-dwrite-dwrite_font_style)**
     * 
     * The desired style.
     * @param {Integer} baseStretch Type: **[**DWRITE\_FONT\_STRETCH**](/windows/win32/api/dwrite/ne-dwrite-dwrite_font_stretch)**
     * 
     * The desired stretch.
     * @param {Pointer<Integer>} mappedLength Type: **UINT32\***
     * 
     * Length of text mapped to the mapped font. This will always be less than or equal to the text length and greater than zero (if the text length is non-zero) so the caller advances at least one character.
     * @param {Pointer<IDWriteFont>} mappedFont Type: **[**IDWriteFont**](/windows/win32/api/dwrite/nn-dwrite-idwritefont)\*\***
     * 
     * The font that should be used to render the first *mappedLength* characters of the text. If it returns NULL, that means that no font can render the text, and *mappedLength* is the number of characters to skip (rendered with a missing glyph).
     * @param {Pointer<Float>} scale Type: **FLOAT\***
     * 
     * Scale factor to multiply the em size of the returned font by.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
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
