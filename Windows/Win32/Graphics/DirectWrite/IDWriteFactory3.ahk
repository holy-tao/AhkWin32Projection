#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFactory2.ahk

/**
 * The root factory interface for all DirectWrite objects.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefactory3
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFactory3 extends IDWriteFactory2{
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
     * 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @param {Integer} renderingMode 
     * @param {Integer} measuringMode 
     * @param {Integer} gridFitMode 
     * @param {Integer} antialiasMode 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {Pointer<IDWriteGlyphRunAnalysis>} glyphRunAnalysis 
     * @returns {HRESULT} 
     */
    CreateGlyphRunAnalysis(glyphRun, transform, renderingMode, measuringMode, gridFitMode, antialiasMode, baselineOriginX, baselineOriginY, glyphRunAnalysis) {
        result := ComCall(31, this, "ptr", glyphRun, "ptr", transform, "int", renderingMode, "int", measuringMode, "int", gridFitMode, "int", antialiasMode, "float", baselineOriginX, "float", baselineOriginY, "ptr", glyphRunAnalysis, "int")
        if(result != 0)
            throw OSError(result)

        return result
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
     * @param {Pointer<IDWriteRenderingParams3>} renderingParams 
     * @returns {HRESULT} 
     */
    CreateCustomRenderingParams(gamma, enhancedContrast, grayscaleEnhancedContrast, clearTypeLevel, pixelGeometry, renderingMode, gridFitMode, renderingParams) {
        result := ComCall(32, this, "float", gamma, "float", enhancedContrast, "float", grayscaleEnhancedContrast, "float", clearTypeLevel, "int", pixelGeometry, "int", renderingMode, "int", gridFitMode, "ptr", renderingParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFile>} fontFile 
     * @param {Integer} faceIndex 
     * @param {Integer} fontSimulations 
     * @param {Pointer<IDWriteFontFaceReference>} fontFaceReference 
     * @returns {HRESULT} 
     */
    CreateFontFaceReference(fontFile, faceIndex, fontSimulations, fontFaceReference) {
        result := ComCall(33, this, "ptr", fontFile, "uint", faceIndex, "int", fontSimulations, "ptr", fontFaceReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} filePath 
     * @param {Pointer<FILETIME>} lastWriteTime 
     * @param {Integer} faceIndex 
     * @param {Integer} fontSimulations 
     * @param {Pointer<IDWriteFontFaceReference>} fontFaceReference 
     * @returns {HRESULT} 
     */
    CreateFontFaceReference(filePath, lastWriteTime, faceIndex, fontSimulations, fontFaceReference) {
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := ComCall(34, this, "ptr", filePath, "ptr", lastWriteTime, "uint", faceIndex, "int", fontSimulations, "ptr", fontFaceReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontSet>} fontSet 
     * @returns {HRESULT} 
     */
    GetSystemFontSet(fontSet) {
        result := ComCall(35, this, "ptr", fontSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontSetBuilder>} fontSetBuilder 
     * @returns {HRESULT} 
     */
    CreateFontSetBuilder(fontSetBuilder) {
        result := ComCall(36, this, "ptr", fontSetBuilder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontSet>} fontSet 
     * @param {Pointer<IDWriteFontCollection1>} fontCollection 
     * @returns {HRESULT} 
     */
    CreateFontCollectionFromFontSet(fontSet, fontCollection) {
        result := ComCall(37, this, "ptr", fontSet, "ptr", fontCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} includeDownloadableFonts 
     * @param {Pointer<IDWriteFontCollection1>} fontCollection 
     * @param {BOOL} checkForUpdates 
     * @returns {HRESULT} 
     */
    GetSystemFontCollection(includeDownloadableFonts, fontCollection, checkForUpdates) {
        result := ComCall(38, this, "int", includeDownloadableFonts, "ptr", fontCollection, "int", checkForUpdates, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontDownloadQueue>} fontDownloadQueue 
     * @returns {HRESULT} 
     */
    GetFontDownloadQueue(fontDownloadQueue) {
        result := ComCall(39, this, "ptr", fontDownloadQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
