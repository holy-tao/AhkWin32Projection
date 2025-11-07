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
     * 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @param {Integer} renderingMode 
     * @param {Integer} measuringMode 
     * @param {Integer} gridFitMode 
     * @param {Integer} antialiasMode 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @returns {IDWriteGlyphRunAnalysis} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-createglyphrunanalysis
     */
    CreateGlyphRunAnalysis(glyphRun, transform, renderingMode, measuringMode, gridFitMode, antialiasMode, baselineOriginX, baselineOriginY) {
        result := ComCall(31, this, "ptr", glyphRun, "ptr", transform, "int", renderingMode, "int", measuringMode, "int", gridFitMode, "int", antialiasMode, "float", baselineOriginX, "float", baselineOriginY, "ptr*", &glyphRunAnalysis := 0, "HRESULT")
        return IDWriteGlyphRunAnalysis(glyphRunAnalysis)
    }

    /**
     * 
     * @param {Float} gamma 
     * @param {Float} enhancedContrast 
     * @param {Float} grayscaleEnhancedContrast 
     * @param {Float} clearTypeLevel 
     * @param {Integer} pixelGeometry 
     * @param {Integer} renderingMode 
     * @param {Integer} gridFitMode 
     * @returns {IDWriteRenderingParams3} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-createcustomrenderingparams
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
     * 
     * @returns {IDWriteFontSet} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-getsystemfontset
     */
    GetSystemFontSet() {
        result := ComCall(35, this, "ptr*", &fontSet := 0, "HRESULT")
        return IDWriteFontSet(fontSet)
    }

    /**
     * 
     * @returns {IDWriteFontSetBuilder} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-createfontsetbuilder
     */
    CreateFontSetBuilder() {
        result := ComCall(36, this, "ptr*", &fontSetBuilder := 0, "HRESULT")
        return IDWriteFontSetBuilder(fontSetBuilder)
    }

    /**
     * 
     * @param {IDWriteFontSet} fontSet 
     * @returns {IDWriteFontCollection1} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-createfontcollectionfromfontset
     */
    CreateFontCollectionFromFontSet(fontSet) {
        result := ComCall(37, this, "ptr", fontSet, "ptr*", &fontCollection := 0, "HRESULT")
        return IDWriteFontCollection1(fontCollection)
    }

    /**
     * 
     * @param {BOOL} includeDownloadableFonts 
     * @param {BOOL} checkForUpdates 
     * @returns {IDWriteFontCollection1} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-getsystemfontcollection
     */
    GetSystemFontCollection(includeDownloadableFonts, checkForUpdates) {
        result := ComCall(38, this, "int", includeDownloadableFonts, "ptr*", &fontCollection := 0, "int", checkForUpdates, "HRESULT")
        return IDWriteFontCollection1(fontCollection)
    }

    /**
     * 
     * @returns {IDWriteFontDownloadQueue} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory3-getfontdownloadqueue
     */
    GetFontDownloadQueue() {
        result := ComCall(39, this, "ptr*", &fontDownloadQueue := 0, "HRESULT")
        return IDWriteFontDownloadQueue(fontDownloadQueue)
    }
}
