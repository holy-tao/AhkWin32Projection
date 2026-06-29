#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFontDownloadQueue.ahk" { IDWriteFontDownloadQueue }
#Import ".\DWRITE_RENDERING_MODE1.ahk" { DWRITE_RENDERING_MODE1 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DWRITE_PIXEL_GEOMETRY.ahk" { DWRITE_PIXEL_GEOMETRY }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\DWRITE_TEXT_ANTIALIAS_MODE.ahk" { DWRITE_TEXT_ANTIALIAS_MODE }
#Import ".\IDWriteFontSetBuilder.ahk" { IDWriteFontSetBuilder }
#Import ".\DWRITE_GLYPH_RUN.ahk" { DWRITE_GLYPH_RUN }
#Import ".\IDWriteFactory2.ahk" { IDWriteFactory2 }
#Import ".\IDWriteFontCollection1.ahk" { IDWriteFontCollection1 }
#Import ".\DWRITE_GRID_FIT_MODE.ahk" { DWRITE_GRID_FIT_MODE }
#Import ".\IDWriteFontFile.ahk" { IDWriteFontFile }
#Import ".\DWRITE_FONT_SIMULATIONS.ahk" { DWRITE_FONT_SIMULATIONS }
#Import ".\DWRITE_MEASURING_MODE.ahk" { DWRITE_MEASURING_MODE }
#Import ".\IDWriteFontFaceReference.ahk" { IDWriteFontFaceReference }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDWriteGlyphRunAnalysis.ahk" { IDWriteGlyphRunAnalysis }
#Import ".\IDWriteRenderingParams3.ahk" { IDWriteRenderingParams3 }
#Import ".\DWRITE_MATRIX.ahk" { DWRITE_MATRIX }
#Import ".\IDWriteFontSet.ahk" { IDWriteFontSet }

/**
 * The root factory interface for all DirectWrite objects. (IDWriteFactory3)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefactory3
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFactory3 extends IDWriteFactory2 {
    /**
     * The interface identifier for IDWriteFactory3
     * @type {Guid}
     */
    static IID := Guid("{9a1b41c3-d3bb-466a-87fc-fe67556a3b65}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFactory3 interfaces
    */
    struct Vtbl extends IDWriteFactory2.Vtbl {
        CreateGlyphRunAnalysis          : IntPtr
        CreateCustomRenderingParams     : IntPtr
        CreateFontFaceReference         : IntPtr
        CreateFontFaceReference1        : IntPtr
        GetSystemFontSet                : IntPtr
        CreateFontSetBuilder            : IntPtr
        CreateFontCollectionFromFontSet : IntPtr
        GetSystemFontCollection         : IntPtr
        GetFontDownloadQueue            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFactory3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a glyph-run-analysis object that encapsulates info that DirectWrite uses to render a glyph run.
     * @param {Pointer<DWRITE_GLYPH_RUN>} _glyphRun Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a> structure that contains the properties of the glyph run.
     * @param {Pointer<DWRITE_MATRIX>} transform Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a> structure that describes the optional transform to be applied to glyphs and their positions.
     * @param {DWRITE_RENDERING_MODE1} renderingMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_rendering_mode1">DWRITE_RENDERING_MODE1</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_rendering_mode1">DWRITE_RENDERING_MODE1</a>-typed value that specifies the rendering mode, which must be one of the raster rendering modes (that is, not default and not outline).
     * @param {DWRITE_MEASURING_MODE} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a>-typed value that specifies the measuring method for glyphs in the run. This method uses this value with the other properties to determine the rendering mode.
     * @param {DWRITE_GRID_FIT_MODE} gridFitMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a>-typed value that specifies how to grid-fit glyph outlines. This value must be non-default.
     * @param {DWRITE_TEXT_ANTIALIAS_MODE} antialiasMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_text_antialias_mode">DWRITE_TEXT_ANTIALIAS_MODE</a></b>
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-createglyphrunanalysis
     */
    CreateGlyphRunAnalysis(_glyphRun, transform, renderingMode, measuringMode, gridFitMode, antialiasMode, baselineOriginX, baselineOriginY) {
        result := ComCall(31, this, DWRITE_GLYPH_RUN.Ptr, _glyphRun, DWRITE_MATRIX.Ptr, transform, DWRITE_RENDERING_MODE1, renderingMode, DWRITE_MEASURING_MODE, measuringMode, DWRITE_GRID_FIT_MODE, gridFitMode, DWRITE_TEXT_ANTIALIAS_MODE, antialiasMode, "float", baselineOriginX, "float", baselineOriginY, "ptr*", &glyphRunAnalysis := 0, "HRESULT")
        return IDWriteGlyphRunAnalysis(glyphRunAnalysis)
    }

    /**
     * Creates a rendering parameters object with the specified properties. (IDWriteFactory3.CreateCustomRenderingParams)
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
     * @param {DWRITE_PIXEL_GEOMETRY} pixelGeometry Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_pixel_geometry">DWRITE_PIXEL_GEOMETRY</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_pixel_geometry">DWRITE_PIXEL_GEOMETRY</a>-typed value that specifies the internal structure of a device pixel (that is, the physical arrangement of red, green, and blue color components) that is assumed for purposes of rendering text.
     * @param {DWRITE_RENDERING_MODE1} renderingMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_rendering_mode1">DWRITE_RENDERING_MODE1</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_rendering_mode1">DWRITE_RENDERING_MODE1</a>-typed value that specifies the method (for example, ClearType natural quality) for rendering glyphs. In most cases, specify <b>DWRITE_RENDERING_MODE1_DEFAULT</b> to automatically use an appropriate mode.
     * @param {DWRITE_GRID_FIT_MODE} gridFitMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a>-typed value that specifies how to grid-fit glyph outlines. In most cases, specify <b>DWRITE_GRID_FIT_DEFAULT</b> to automatically choose an appropriate mode.
     * @returns {IDWriteRenderingParams3} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwriterenderingparams3">IDWriteRenderingParams3</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwriterenderingparams3">IDWriteRenderingParams3</a> interface for the newly created rendering parameters object, or <b>NULL</b> in case of failure.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-createcustomrenderingparams
     */
    CreateCustomRenderingParams(gamma, enhancedContrast, grayscaleEnhancedContrast, clearTypeLevel, pixelGeometry, renderingMode, gridFitMode) {
        result := ComCall(32, this, "float", gamma, "float", enhancedContrast, "float", grayscaleEnhancedContrast, "float", clearTypeLevel, DWRITE_PIXEL_GEOMETRY, pixelGeometry, DWRITE_RENDERING_MODE1, renderingMode, DWRITE_GRID_FIT_MODE, gridFitMode, "ptr*", &renderingParams := 0, "HRESULT")
        return IDWriteRenderingParams3(renderingParams)
    }

    /**
     * Creates a reference to a font given a full path. (overload 2/2)
     * @param {IDWriteFontFile} fontFile 
     * @param {Integer} faceIndex Type: <b>UINT32</b>
     * 
     * The zero based index of a font face in cases when the font files contain a collection of font faces.      
     * If the font files contain a single face, this value should be zero.
     * @param {DWRITE_FONT_SIMULATIONS} fontSimulations Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_simulations">DWRITE_FONT_SIMULATIONS</a></b>
     * 
     * Font face simulation flags for algorithmic emboldening and italicization.
     * @returns {IDWriteFontFaceReference} Type: [out] <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference">IDWriteFontFaceReference</a>**</b>
     * 
     * Contains newly created font face reference object, or nullptr in case of failure.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-createfontfacereference(wcharconst_filetimeconst_uint32_dwrite_font_simulations_idwritefontfacereference)
     */
    CreateFontFaceReference(fontFile, faceIndex, fontSimulations) {
        result := ComCall(33, this, "ptr", fontFile, "uint", faceIndex, DWRITE_FONT_SIMULATIONS, fontSimulations, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference(fontFaceReference)
    }

    /**
     * Creates a reference to a font given a full path. (overload 2/2)
     * @param {PWSTR} filePath Type: [in] <b>WCHAR</b>
     * 
     * Absolute file path. Subsequent operations on the constructed object may fail if the user provided filePath doesn't correspond to a valid file on the disk.
     * @param {Pointer<FILETIME>} lastWriteTime Type: [in, optional] <b>FILETIME</b>
     * 
     * Last modified time of the input file path. If the parameter is omitted,      
     * the function will access the font file to obtain its last write time, so the clients are encouraged to specify this value      
     * to avoid extra disk access. Subsequent operations on the constructed object may fail      
     * if the user provided lastWriteTime doesn't match the file on the disk.
     * @param {Integer} faceIndex Type: <b>UINT32</b>
     * 
     * The zero based index of a font face in cases when the font files contain a collection of font faces.      
     * If the font files contain a single face, this value should be zero.
     * @param {DWRITE_FONT_SIMULATIONS} fontSimulations Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_simulations">DWRITE_FONT_SIMULATIONS</a></b>
     * 
     * Font face simulation flags for algorithmic emboldening and italicization.
     * @returns {IDWriteFontFaceReference} Type: [out] <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference">IDWriteFontFaceReference</a>**</b>
     * 
     * Contains newly created font face reference object, or nullptr in case of failure.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-createfontfacereference(wcharconst_filetimeconst_uint32_dwrite_font_simulations_idwritefontfacereference)
     */
    CreateFontFaceReference1(filePath, lastWriteTime, faceIndex, fontSimulations) {
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := ComCall(34, this, "ptr", filePath, FILETIME.Ptr, lastWriteTime, "uint", faceIndex, DWRITE_FONT_SIMULATIONS, fontSimulations, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference(fontFaceReference)
    }

    /**
     * Retrieves the list of system fonts.
     * @returns {IDWriteFontSet} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset">IDWriteFontSet</a>**</b>
     * 
     * Holds the newly created font set object, or NULL in case of failure.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-getsystemfontset
     */
    GetSystemFontSet() {
        result := ComCall(35, this, "ptr*", &fontSet := 0, "HRESULT")
        return IDWriteFontSet(fontSet)
    }

    /**
     * Creates an empty font set builder to add font face references and create a custom font set. (IDWriteFactory3.CreateFontSetBuilder)
     * @returns {IDWriteFontSetBuilder} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontsetbuilder">IDWriteFontSetBuilder</a>**</b>
     * 
     * Holds the newly created font set builder object, or NULL in case of failure.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-createfontsetbuilder
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-createfontcollectionfromfontset
     */
    CreateFontCollectionFromFontSet(fontSet) {
        result := ComCall(37, this, "ptr", fontSet, "ptr*", &_fontCollection := 0, "HRESULT")
        return IDWriteFontCollection1(_fontCollection)
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-getsystemfontcollection
     */
    GetSystemFontCollection(includeDownloadableFonts, checkForUpdates) {
        result := ComCall(38, this, BOOL, includeDownloadableFonts, "ptr*", &_fontCollection := 0, BOOL, checkForUpdates, "HRESULT")
        return IDWriteFontCollection1(_fontCollection)
    }

    /**
     * Gets the font download queue associated with this factory object.
     * @returns {IDWriteFontDownloadQueue} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontdownloadqueue">IDWriteFontDownloadQueue</a>**</b>
     * 
     * Receives a pointer to the font download queue interface.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-getfontdownloadqueue
     */
    GetFontDownloadQueue() {
        result := ComCall(39, this, "ptr*", &fontDownloadQueue := 0, "HRESULT")
        return IDWriteFontDownloadQueue(fontDownloadQueue)
    }

    Query(iid) {
        if (IDWriteFactory3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateGlyphRunAnalysis := CallbackCreate(GetMethod(implObj, "CreateGlyphRunAnalysis"), flags, 10)
        this.vtbl.CreateCustomRenderingParams := CallbackCreate(GetMethod(implObj, "CreateCustomRenderingParams"), flags, 9)
        this.vtbl.CreateFontFaceReference := CallbackCreate(GetMethod(implObj, "CreateFontFaceReference"), flags, 5)
        this.vtbl.CreateFontFaceReference1 := CallbackCreate(GetMethod(implObj, "CreateFontFaceReference1"), flags, 6)
        this.vtbl.GetSystemFontSet := CallbackCreate(GetMethod(implObj, "GetSystemFontSet"), flags, 2)
        this.vtbl.CreateFontSetBuilder := CallbackCreate(GetMethod(implObj, "CreateFontSetBuilder"), flags, 2)
        this.vtbl.CreateFontCollectionFromFontSet := CallbackCreate(GetMethod(implObj, "CreateFontCollectionFromFontSet"), flags, 3)
        this.vtbl.GetSystemFontCollection := CallbackCreate(GetMethod(implObj, "GetSystemFontCollection"), flags, 4)
        this.vtbl.GetFontDownloadQueue := CallbackCreate(GetMethod(implObj, "GetFontDownloadQueue"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateGlyphRunAnalysis)
        CallbackFree(this.vtbl.CreateCustomRenderingParams)
        CallbackFree(this.vtbl.CreateFontFaceReference)
        CallbackFree(this.vtbl.CreateFontFaceReference1)
        CallbackFree(this.vtbl.GetSystemFontSet)
        CallbackFree(this.vtbl.CreateFontSetBuilder)
        CallbackFree(this.vtbl.CreateFontCollectionFromFontSet)
        CallbackFree(this.vtbl.GetSystemFontCollection)
        CallbackFree(this.vtbl.GetFontDownloadQueue)
    }
}
