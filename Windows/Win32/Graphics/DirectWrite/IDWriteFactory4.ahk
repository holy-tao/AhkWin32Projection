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
     * Translates a glyph run to a sequence of color glyph runs, which can be rendered to produce a color representation of the original &quot;base&quot; run.
     * @param {D2D_POINT_2F} baselineOrigin Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * Horizontal and vertical origin of the base glyph run in pre-transform coordinates.
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a></b>
     * 
     * Pointer to the original "base" glyph run.
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run_description">DWRITE_GLYPH_RUN_DESCRIPTION</a></b>
     * 
     * Optional glyph run description.
     * @param {Integer} desiredGlyphImageFormats Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_glyph_image_formats">DWRITE_GLYPH_IMAGE_FORMATS</a></b>
     * 
     * Which data formats the runs should be split into.
     * @param {Integer} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * Measuring mode, needed to compute the origins of each glyph.
     * @param {Pointer<DWRITE_MATRIX>} worldAndDpiTransform Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a></b>
     * 
     * Matrix converting from the client's coordinate space to device coordinates (pixels), i.e., the world transform multiplied by any DPI scaling.
     * @param {Integer} colorPaletteIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the color palette to use.
     *           Valid indices are less than the number of palettes in the font, as returned
     *           by <a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontface2-getcolorpalettecount">IDWriteFontFace2::GetColorPaletteCount</a>.
     * @returns {IDWriteColorGlyphRunEnumerator1} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritecolorglyphrunenumerator1">IDWriteColorGlyphRunEnumerator1</a>**</b>
     * 
     * If the function succeeds, receives a pointer to an enumerator object that can be used to obtain the color glyph runs.
     *           If the base run has no color glyphs, then the output pointer is NULL and the method returns DWRITE_E_NOCOLOR.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefactory4-translatecolorglyphrun
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
