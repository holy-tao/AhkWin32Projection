#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFallback.ahk
#Include .\IDWriteFontFallbackBuilder.ahk
#Include .\IDWriteColorGlyphRunEnumerator.ahk
#Include .\IDWriteRenderingParams2.ahk
#Include .\IDWriteGlyphRunAnalysis.ahk
#Include .\IDWriteFactory1.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritefactory2
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFactory2 extends IDWriteFactory1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFactory2
     * @type {Guid}
     */
    static IID => Guid("{0439fc60-ca44-4994-8dee-3a9af7b732ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSystemFontFallback", "CreateFontFallbackBuilder", "TranslateColorGlyphRun", "CreateCustomRenderingParams", "CreateGlyphRunAnalysis"]

    /**
     * Creates a font fallback object from the system font fallback list.
     * @returns {IDWriteFontFallback} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/nn-dwrite_2-idwritefontfallback">IDWriteFontFallback</a>**</b>
     * 
     * Contains an address of a pointer to the newly created font fallback object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritefactory2-getsystemfontfallback
     */
    GetSystemFontFallback() {
        result := ComCall(26, this, "ptr*", &fontFallback := 0, "HRESULT")
        return IDWriteFontFallback(fontFallback)
    }

    /**
     * Creates a font fallback builder object.
     * @returns {IDWriteFontFallbackBuilder} Type: <b><a href="https://docs.microsoft.com/windows/win32/DirectWrite/idwritefontfallbackbuilder">IDWriteFontFallbackBuilder</a>**</b>
     * 
     * Contains an address of a pointer to the newly created font fallback builder object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritefactory2-createfontfallbackbuilder
     */
    CreateFontFallbackBuilder() {
        result := ComCall(27, this, "ptr*", &fontFallbackBuilder := 0, "HRESULT")
        return IDWriteFontFallbackBuilder(fontFallbackBuilder)
    }

    /**
     * This method is called on a glyph run to translate it in to multiple color glyph runs.
     * @param {Float} baselineOriginX Type: <b>FLOAT</b>
     * 
     * The horizontal baseline origin of the original glyph run.
     * @param {Float} baselineOriginY Type: <b>FLOAT</b>
     * 
     * The vertical baseline origin of the original glyph run.
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a>*</b>
     * 
     * Original glyph run containing monochrome glyph IDs.
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run_description">DWRITE_GLYPH_RUN_DESCRIPTION</a>*</b>
     * 
     * Optional glyph run description.
     * @param {Integer} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * Measuring mode used to compute glyph positions if the run contains color glyphs.
     * @param {Pointer<DWRITE_MATRIX>} worldToDeviceTransform Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a>*</b>
     * 
     * World transform multiplied by any DPI scaling. This is needed to compute glyph positions if the run contains color glyphs and the 
     *             measuring mode is not <a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE_NATURAL</a>. 
     *             If this parameter is <b>NULL</b>, and identity transform is assumed.
     * @param {Integer} colorPaletteIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the color palette to use. Valid indices are less than the number of palettes in the font, as 
     *             returned by <a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontface2-getcolorpalettecount">IDWriteFontFace2::GetColorPaletteCount</a>.
     * @returns {IDWriteColorGlyphRunEnumerator} Type: <b><a href="https://docs.microsoft.com/windows/win32/DirectWrite/idwritecolorglyphrunenumerator">IDWriteColorGlyphRunEnumerator</a>**</b>
     * 
     * If the original glyph run contains color glyphs, this parameter receives a pointer to 
     *             an <a href="https://docs.microsoft.com/windows/win32/DirectWrite/idwritecolorglyphrunenumerator">IDWriteColorGlyphRunEnumerator</a> interface. 
     *             The client uses the returned interface to get information about glyph runs and associated colors to render instead of the original glyph run. 
     *             If the original glyph run does not contain color glyphs, this method returns <b>DWRITE_E_NOCOLOR</b> and the output pointer is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritefactory2-translatecolorglyphrun
     */
    TranslateColorGlyphRun(baselineOriginX, baselineOriginY, glyphRun, glyphRunDescription, measuringMode, worldToDeviceTransform, colorPaletteIndex) {
        result := ComCall(28, this, "float", baselineOriginX, "float", baselineOriginY, "ptr", glyphRun, "ptr", glyphRunDescription, "int", measuringMode, "ptr", worldToDeviceTransform, "uint", colorPaletteIndex, "ptr*", &colorLayers := 0, "HRESULT")
        return IDWriteColorGlyphRunEnumerator(colorLayers)
    }

    /**
     * Creates a rendering parameters object with the specified properties.
     * @param {Float} gamma Type: <b>FLOAT</b>
     * 
     * The gamma value used for gamma correction, which must be greater than zero and cannot exceed 256.
     * @param {Float} enhancedContrast Type: <b>FLOAT</b>
     * 
     * The amount of contrast enhancement, zero or greater.
     * @param {Float} grayscaleEnhancedContrast Type: <b>FLOAT</b>
     * 
     * The amount of contrast enhancement, zero or greater.
     * @param {Float} clearTypeLevel Type: <b>FLOAT</b>
     * 
     * The degree of ClearType level, from 0.0f (no ClearType) to 1.0f (full ClearType).
     * @param {Integer} pixelGeometry Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_pixel_geometry">DWRITE_PIXEL_GEOMETRY</a></b>
     * 
     * The geometry of a device pixel.
     * @param {Integer} renderingMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_rendering_mode">DWRITE_RENDERING_MODE</a></b>
     * 
     * Method of rendering glyphs. In most cases, this should be DWRITE_RENDERING_MODE_DEFAULT to automatically use an appropriate mode.
     * @param {Integer} gridFitMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a></b>
     * 
     * How to grid fit glyph outlines. In most cases, this should be DWRITE_GRID_FIT_DEFAULT to automatically choose an appropriate mode.
     * @returns {IDWriteRenderingParams2} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/nn-dwrite_2-idwriterenderingparams2">IDWriteRenderingParams2</a>**</b>
     * 
     * Holds the newly created rendering parameters object, or NULL in case of failure.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritefactory2-createcustomrenderingparams
     */
    CreateCustomRenderingParams(gamma, enhancedContrast, grayscaleEnhancedContrast, clearTypeLevel, pixelGeometry, renderingMode, gridFitMode) {
        result := ComCall(29, this, "float", gamma, "float", enhancedContrast, "float", grayscaleEnhancedContrast, "float", clearTypeLevel, "int", pixelGeometry, "int", renderingMode, "int", gridFitMode, "ptr*", &renderingParams := 0, "HRESULT")
        return IDWriteRenderingParams2(renderingParams)
    }

    /**
     * Creates a glyph run analysis object, which encapsulates information used to render a glyph run.
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a>*</b>
     * 
     * Structure specifying the properties of the glyph run.
     * @param {Pointer<DWRITE_MATRIX>} transform Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a>*</b>
     * 
     * Optional transform applied to the glyphs and their positions. This transform is applied after the
     *           scaling specified by the emSize and pixelsPerDip.
     * @param {Integer} renderingMode Type: <b>DWRITE_RENDERING_MODE</b>
     * 
     * Specifies the rendering mode, which must be one of the raster rendering modes (i.e., not default
     *           and not outline).
     * @param {Integer} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * Specifies the method to measure glyphs.
     * @param {Integer} gridFitMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a></b>
     * 
     * How to grid-fit glyph outlines. This must be non-default.
     * @param {Integer} antialiasMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_text_antialias_mode">DWRITE_TEXT_ANTIALIAS_MODE</a></b>
     * 
     * Specifies the antialias mode.
     * @param {Float} baselineOriginX Type: <b>FLOAT</b>
     * 
     * Horizontal position of the baseline origin, in DIPs.
     * @param {Float} baselineOriginY Type: <b>FLOAT</b>
     * 
     * Vertical position of the baseline origin, in DIPs.
     * @returns {IDWriteGlyphRunAnalysis} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriteglyphrunanalysis">IDWriteGlyphRunAnalysis</a>**</b>
     * 
     * Receives a pointer to the newly created object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritefactory2-createglyphrunanalysis
     */
    CreateGlyphRunAnalysis(glyphRun, transform, renderingMode, measuringMode, gridFitMode, antialiasMode, baselineOriginX, baselineOriginY) {
        result := ComCall(30, this, "ptr", glyphRun, "ptr", transform, "int", renderingMode, "int", measuringMode, "int", gridFitMode, "int", antialiasMode, "float", baselineOriginX, "float", baselineOriginY, "ptr*", &glyphRunAnalysis := 0, "HRESULT")
        return IDWriteGlyphRunAnalysis(glyphRunAnalysis)
    }
}
