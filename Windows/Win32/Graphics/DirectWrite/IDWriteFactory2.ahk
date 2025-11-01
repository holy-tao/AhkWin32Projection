#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IDWriteFontFallback>} fontFallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritefactory2-getsystemfontfallback
     */
    GetSystemFontFallback(fontFallback) {
        result := ComCall(26, this, "ptr*", fontFallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFallbackBuilder>} fontFallbackBuilder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefactory2-createfontfallbackbuilder
     */
    CreateFontFallbackBuilder(fontFallbackBuilder) {
        result := ComCall(27, this, "ptr*", fontFallbackBuilder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription 
     * @param {Integer} measuringMode 
     * @param {Pointer<DWRITE_MATRIX>} worldToDeviceTransform 
     * @param {Integer} colorPaletteIndex 
     * @param {Pointer<IDWriteColorGlyphRunEnumerator>} colorLayers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefactory2-translatecolorglyphrun
     */
    TranslateColorGlyphRun(baselineOriginX, baselineOriginY, glyphRun, glyphRunDescription, measuringMode, worldToDeviceTransform, colorPaletteIndex, colorLayers) {
        result := ComCall(28, this, "float", baselineOriginX, "float", baselineOriginY, "ptr", glyphRun, "ptr", glyphRunDescription, "int", measuringMode, "ptr", worldToDeviceTransform, "uint", colorPaletteIndex, "ptr*", colorLayers, "HRESULT")
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
     * @param {Pointer<IDWriteRenderingParams2>} renderingParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritefactory2-createcustomrenderingparams
     */
    CreateCustomRenderingParams(gamma, enhancedContrast, grayscaleEnhancedContrast, clearTypeLevel, pixelGeometry, renderingMode, gridFitMode, renderingParams) {
        result := ComCall(29, this, "float", gamma, "float", enhancedContrast, "float", grayscaleEnhancedContrast, "float", clearTypeLevel, "int", pixelGeometry, "int", renderingMode, "int", gridFitMode, "ptr*", renderingParams, "HRESULT")
        return result
    }

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
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritefactory2-createglyphrunanalysis
     */
    CreateGlyphRunAnalysis(glyphRun, transform, renderingMode, measuringMode, gridFitMode, antialiasMode, baselineOriginX, baselineOriginY, glyphRunAnalysis) {
        result := ComCall(30, this, "ptr", glyphRun, "ptr", transform, "int", renderingMode, "int", measuringMode, "int", gridFitMode, "int", antialiasMode, "float", baselineOriginX, "float", baselineOriginY, "ptr*", glyphRunAnalysis, "HRESULT")
        return result
    }
}
