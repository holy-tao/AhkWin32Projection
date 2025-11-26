#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteGlyphRunAnalysis.ahk
#Include .\IDWriteRenderingParams3.ahk
#Include .\IDWriteFontFaceReference.ahk
#Include .\IDWriteFontSet.ahk
#Include .\IDWriteFontSetBuilder.ahk
#Include .\IDWriteFontCollection1.ahk
#Include .\IDWriteFontDownloadQueue.ahk
#Include .\IDWriteFactory2.ahk

/**
 * The root factory interface for all DirectWrite objects.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefactory3
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFactory3 extends IDWriteFactory2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFactory3
     * @type {Guid}
     */
    static IID => Guid("{9a1b41c3-d3bb-466a-87fc-fe67556a3b65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 31

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateGlyphRunAnalysis", "CreateCustomRenderingParams", "CreateFontFaceReference", "CreateFontFaceReference1", "GetSystemFontSet", "CreateFontSetBuilder", "CreateFontCollectionFromFontSet", "GetSystemFontCollection", "GetFontDownloadQueue"]

    /**
     * Creates a glyph-run-analysis object that encapsulates info that DirectWrite uses to render a glyph run.
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a> structure that contains the properties of the glyph run.
     * @param {Pointer<DWRITE_MATRIX>} transform Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a> structure that describes the optional transform to be applied to glyphs and their positions.
     * @param {Integer} renderingMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_rendering_mode1">DWRITE_RENDERING_MODE1</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_rendering_mode1">DWRITE_RENDERING_MODE1</a>-typed value that specifies the rendering mode, which must be one of the raster rendering modes (that is, not default and not outline).
     * @param {Integer} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a>-typed value that specifies the measuring method for glyphs in the run. This method uses this value with the other properties to determine the rendering mode.
     * @param {Integer} gridFitMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a>-typed value that specifies how to grid-fit glyph outlines. This value must be non-default.
     * @param {Integer} antialiasMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_text_antialias_mode">DWRITE_TEXT_ANTIALIAS_MODE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_text_antialias_mode">DWRITE_TEXT_ANTIALIAS_MODE</a>-typed value that specifies the type of antialiasing to use for text when the rendering mode calls for antialiasing.
     * @param {Float} baselineOriginX Type: <b>FLOAT</b>
     * 
     * The horizontal position of the baseline origin, in DIPs, relative to the upper-left corner of the DIB.
     * @param {Float} baselineOriginY Type: <b>FLOAT</b>
     * 
     * The vertical position of the baseline origin, in DIPs, relative to the upper-left corner of the DIB.
     * @returns {IDWriteGlyphRunAnalysis} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriteglyphrunanalysis">IDWriteGlyphRunAnalysis</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriteglyphrunanalysis">IDWriteGlyphRunAnalysis</a> interface for the newly created glyph-run-analysis object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefactory3-createglyphrunanalysis
     */
    CreateGlyphRunAnalysis(glyphRun, transform, renderingMode, measuringMode, gridFitMode, antialiasMode, baselineOriginX, baselineOriginY) {
        result := ComCall(31, this, "ptr", glyphRun, "ptr", transform, "int", renderingMode, "int", measuringMode, "int", gridFitMode, "int", antialiasMode, "float", baselineOriginX, "float", baselineOriginY, "ptr*", &glyphRunAnalysis := 0, "HRESULT")
        return IDWriteGlyphRunAnalysis(glyphRunAnalysis)
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
     * The amount of contrast enhancement to use for grayscale antialiasing, zero or greater.
     * @param {Float} clearTypeLevel Type: <b>FLOAT</b>
     * 
     * The degree of ClearType level, from 0.0f (no ClearType) to 1.0f (full ClearType).
     * @param {Integer} pixelGeometry Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_pixel_geometry">DWRITE_PIXEL_GEOMETRY</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_pixel_geometry">DWRITE_PIXEL_GEOMETRY</a>-typed value that specifies the internal structure of a device pixel (that is, the physical arrangement of red, green, and blue color components) that is assumed for purposes of rendering text.
     * @param {Integer} renderingMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_rendering_mode1">DWRITE_RENDERING_MODE1</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_rendering_mode1">DWRITE_RENDERING_MODE1</a>-typed value that specifies the method (for example, ClearType natural quality) for rendering glyphs. In most cases, specify <b>DWRITE_RENDERING_MODE1_DEFAULT</b> to automatically use an appropriate mode.
     * @param {Integer} gridFitMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a>-typed value that specifies how to grid-fit glyph outlines. In most cases, specify <b>DWRITE_GRID_FIT_DEFAULT</b> to automatically choose an appropriate mode.
     * @returns {IDWriteRenderingParams3} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwriterenderingparams3">IDWriteRenderingParams3</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwriterenderingparams3">IDWriteRenderingParams3</a> interface for the newly created rendering parameters object, or <b>NULL</b> in case of failure.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefactory3-createcustomrenderingparams
     */
    CreateCustomRenderingParams(gamma, enhancedContrast, grayscaleEnhancedContrast, clearTypeLevel, pixelGeometry, renderingMode, gridFitMode) {
        result := ComCall(32, this, "float", gamma, "float", enhancedContrast, "float", grayscaleEnhancedContrast, "float", clearTypeLevel, "int", pixelGeometry, "int", renderingMode, "int", gridFitMode, "ptr*", &renderingParams := 0, "HRESULT")
        return IDWriteRenderingParams3(renderingParams)
    }

    /**
     * 
     * @param {IDWriteFontFile} fontFile 
     * @param {Integer} faceIndex 
     * @param {Integer} fontSimulations 
     * @returns {IDWriteFontFaceReference} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-createfontfacereference(wcharconst_filetimeconst_uint32_dwrite_font_simulations_idwritefontfacereference)
     */
    CreateFontFaceReference(fontFile, faceIndex, fontSimulations) {
        result := ComCall(33, this, "ptr", fontFile, "uint", faceIndex, "int", fontSimulations, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference(fontFaceReference)
    }

    /**
     * 
     * @param {PWSTR} filePath 
     * @param {Pointer<FILETIME>} lastWriteTime 
     * @param {Integer} faceIndex 
     * @param {Integer} fontSimulations 
     * @returns {IDWriteFontFaceReference} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-createfontfacereference(wcharconst_filetimeconst_uint32_dwrite_font_simulations_idwritefontfacereference)
     */
    CreateFontFaceReference1(filePath, lastWriteTime, faceIndex, fontSimulations) {
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := ComCall(34, this, "ptr", filePath, "ptr", lastWriteTime, "uint", faceIndex, "int", fontSimulations, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference(fontFaceReference)
    }

    /**
     * Retrieves the list of system fonts.
     * @returns {IDWriteFontSet} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset">IDWriteFontSet</a>**</b>
     * 
     * Holds the newly created font set object, or NULL in case of failure.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefactory3-getsystemfontset
     */
    GetSystemFontSet() {
        result := ComCall(35, this, "ptr*", &fontSet := 0, "HRESULT")
        return IDWriteFontSet(fontSet)
    }

    /**
     * Creates an empty font set builder to add font face references and create a custom font set.
     * @returns {IDWriteFontSetBuilder} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontsetbuilder">IDWriteFontSetBuilder</a>**</b>
     * 
     * Holds the newly created font set builder object, or NULL in case of failure.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefactory3-createfontsetbuilder
     */
    CreateFontSetBuilder() {
        result := ComCall(36, this, "ptr*", &fontSetBuilder := 0, "HRESULT")
        return IDWriteFontSetBuilder(fontSetBuilder)
    }

    /**
     * Create a weight/width/slope tree from a set of fonts.
     * @param {IDWriteFontSet} fontSet Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset">IDWriteFontSet</a>*</b>
     * 
     * A set of fonts to use to build the collection.
     * @returns {IDWriteFontCollection1} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontcollection1">IDWriteFontCollection1</a>**</b>
     * 
     * Holds the newly created font collection object, or NULL in case of failure.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefactory3-createfontcollectionfromfontset
     */
    CreateFontCollectionFromFontSet(fontSet) {
        result := ComCall(37, this, "ptr", fontSet, "ptr*", &fontCollection := 0, "HRESULT")
        return IDWriteFontCollection1(fontCollection)
    }

    /**
     * Retrieves a weight/width/slope tree of system fonts.
     * @param {BOOL} includeDownloadableFonts Type: <b>BOOL</b>
     * 
     * Indicates whether to include cloud fonts or only locally installed fonts.
     * @param {BOOL} checkForUpdates Type: <b>BOOL</b>
     * 
     * If this parameter is TRUE, the function performs an immediate check for changes       
     *            to the set of system fonts. If this parameter is FALSE, the function will still detect changes if the font      
     *            cache service is running, but there may be some latency. For example, an application might specify TRUE if      
     *            it has just installed a font and wants to be sure the font collection contains that font.
     * @returns {IDWriteFontCollection1} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontcollection1">IDWriteFontCollection1</a>**</b>
     * 
     * Holds the newly created font collection object, or NULL in case of failure.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefactory3-getsystemfontcollection
     */
    GetSystemFontCollection(includeDownloadableFonts, checkForUpdates) {
        result := ComCall(38, this, "int", includeDownloadableFonts, "ptr*", &fontCollection := 0, "int", checkForUpdates, "HRESULT")
        return IDWriteFontCollection1(fontCollection)
    }

    /**
     * Gets the font download queue associated with this factory object.
     * @returns {IDWriteFontDownloadQueue} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontdownloadqueue">IDWriteFontDownloadQueue</a>**</b>
     * 
     * Receives a pointer to the font download queue interface.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefactory3-getfontdownloadqueue
     */
    GetFontDownloadQueue() {
        result := ComCall(39, this, "ptr*", &fontDownloadQueue := 0, "HRESULT")
        return IDWriteFontDownloadQueue(fontDownloadQueue)
    }
}
