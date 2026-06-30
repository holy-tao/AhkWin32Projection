#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Direct2D\Common\D2D_POINT_2F.ahk
#Include .\DWRITE_GLYPH_RUN_DESCRIPTION.ahk
#Include .\IDWriteFactory7.ahk
#Include .\IDWriteColorGlyphRunEnumerator1.ahk
#Include .\DWRITE_GLYPH_RUN.ahk
#Include .\DWRITE_MEASURING_MODE.ahk
#Include .\DWRITE_MATRIX.ahk
#Include .\DWRITE_PAINT_FEATURE_LEVEL.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include .\DWRITE_GLYPH_IMAGE_FORMATS.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class IDWriteFactory8 extends IDWriteFactory7 {

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
     * @param {Pointer<DWRITE_GLYPH_RUN>} _glyphRun 
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription 
     * @param {DWRITE_GLYPH_IMAGE_FORMATS} desiredGlyphImageFormats 
     * @param {DWRITE_PAINT_FEATURE_LEVEL} paintFeatureLevel 
     * @param {DWRITE_MEASURING_MODE} measuringMode 
     * @param {Pointer<DWRITE_MATRIX>} worldAndDpiTransform 
     * @param {Integer} colorPaletteIndex 
     * @returns {IDWriteColorGlyphRunEnumerator1} 
     */
    TranslateColorGlyphRun(baselineOrigin, _glyphRun, glyphRunDescription, desiredGlyphImageFormats, paintFeatureLevel, measuringMode, worldAndDpiTransform, colorPaletteIndex) {
        result := ComCall(57, this, "ptr", baselineOrigin, "ptr", _glyphRun, "ptr", glyphRunDescription, "int", desiredGlyphImageFormats, "int", paintFeatureLevel, "int", measuringMode, "ptr", worldAndDpiTransform, "uint", colorPaletteIndex, "ptr*", &colorEnumerator := 0, "HRESULT")
        return IDWriteColorGlyphRunEnumerator1(colorEnumerator)
    }
}
