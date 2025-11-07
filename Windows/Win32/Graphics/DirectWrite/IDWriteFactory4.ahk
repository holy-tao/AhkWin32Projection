#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteColorGlyphRunEnumerator1.ahk
#Include ..\Direct2D\Common\D2D_POINT_2F.ahk
#Include .\IDWriteFactory3.ahk

/**
 * The root factory interface for all DirectWrite objects.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefactory4
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFactory4 extends IDWriteFactory3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFactory4
     * @type {Guid}
     */
    static IID => Guid("{4b0b5bd3-0797-4549-8ac5-fe915cc53856}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 40

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TranslateColorGlyphRun", "ComputeGlyphOrigins", "ComputeGlyphOrigins1"]

    /**
     * 
     * @param {D2D_POINT_2F} baselineOrigin 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription 
     * @param {Integer} desiredGlyphImageFormats 
     * @param {Integer} measuringMode 
     * @param {Pointer<DWRITE_MATRIX>} worldAndDpiTransform 
     * @param {Integer} colorPaletteIndex 
     * @returns {IDWriteColorGlyphRunEnumerator1} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory4-translatecolorglyphrun
     */
    TranslateColorGlyphRun(baselineOrigin, glyphRun, glyphRunDescription, desiredGlyphImageFormats, measuringMode, worldAndDpiTransform, colorPaletteIndex) {
        result := ComCall(40, this, "ptr", baselineOrigin, "ptr", glyphRun, "ptr", glyphRunDescription, "int", desiredGlyphImageFormats, "int", measuringMode, "ptr", worldAndDpiTransform, "uint", colorPaletteIndex, "ptr*", &colorLayers := 0, "HRESULT")
        return IDWriteColorGlyphRunEnumerator1(colorLayers)
    }

    /**
     * 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {D2D_POINT_2F} baselineOrigin 
     * @returns {D2D_POINT_2F} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory4-computeglyphorigins(dwrite_glyph_runconst_dwrite_measuring_mode_d2d1_point_2f_dwrite_matrixconst_d2d1_point_2f)
     */
    ComputeGlyphOrigins(glyphRun, baselineOrigin) {
        glyphOrigins := D2D_POINT_2F()
        result := ComCall(41, this, "ptr", glyphRun, "ptr", baselineOrigin, "ptr", glyphOrigins, "HRESULT")
        return glyphOrigins
    }

    /**
     * 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Integer} measuringMode 
     * @param {D2D_POINT_2F} baselineOrigin 
     * @param {Pointer<DWRITE_MATRIX>} worldAndDpiTransform 
     * @returns {D2D_POINT_2F} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory4-computeglyphorigins(dwrite_glyph_runconst_dwrite_measuring_mode_d2d1_point_2f_dwrite_matrixconst_d2d1_point_2f)
     */
    ComputeGlyphOrigins1(glyphRun, measuringMode, baselineOrigin, worldAndDpiTransform) {
        glyphOrigins := D2D_POINT_2F()
        result := ComCall(42, this, "ptr", glyphRun, "int", measuringMode, "ptr", baselineOrigin, "ptr", worldAndDpiTransform, "ptr", glyphOrigins, "HRESULT")
        return glyphOrigins
    }
}
