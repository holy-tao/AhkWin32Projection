#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteColorGlyphRunEnumerator1.ahk
#Include .\IDWriteFactory7.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFactory8 extends IDWriteFactory7{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFactory8
     * @type {Guid}
     */
    static IID => Guid("{ee0a7fb5-def4-4c23-a454-c9c7dc878398}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 57

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TranslateColorGlyphRun"]

    /**
     * 
     * @param {D2D_POINT_2F} baselineOrigin 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription 
     * @param {Integer} desiredGlyphImageFormats 
     * @param {Integer} paintFeatureLevel 
     * @param {Integer} measuringMode 
     * @param {Pointer<DWRITE_MATRIX>} worldAndDpiTransform 
     * @param {Integer} colorPaletteIndex 
     * @returns {IDWriteColorGlyphRunEnumerator1} 
     */
    TranslateColorGlyphRun(baselineOrigin, glyphRun, glyphRunDescription, desiredGlyphImageFormats, paintFeatureLevel, measuringMode, worldAndDpiTransform, colorPaletteIndex) {
        result := ComCall(57, this, "ptr", baselineOrigin, "ptr", glyphRun, "ptr", glyphRunDescription, "int", desiredGlyphImageFormats, "int", paintFeatureLevel, "int", measuringMode, "ptr", worldAndDpiTransform, "uint", colorPaletteIndex, "ptr*", &colorEnumerator := 0, "HRESULT")
        return IDWriteColorGlyphRunEnumerator1(colorEnumerator)
    }
}
