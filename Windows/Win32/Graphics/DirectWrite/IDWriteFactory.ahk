#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to create all subsequent DirectWrite objects. This interface is the root factory interface for all DirectWrite objects.
 * @remarks
 * 
  * Create an <b>IDWriteFactory</b> object by using the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-dwritecreatefactory">DWriteCreateFactory</a> function.  
  * 
  * 
  * ```cpp
  * 
  * if (SUCCEEDED(hr))
  * {
  *     hr = DWriteCreateFactory(
  *         DWRITE_FACTORY_TYPE_SHARED,
  *         __uuidof(IDWriteFactory),
  *         reinterpret_cast<IUnknown**>(&pDWriteFactory_)
  *         );
  * }
  * 
  * 
  * ```
  * 
  * 
  * An <b>IDWriteFactory</b> object holds state information, such as font loader registration and cached font data.  This state can be shared or isolated.  Shared is recommended for most applications because it saves memory.  However, isolated can be useful in situations where you want to have a separate state for some objects.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritefactory
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFactory extends IUnknown{
    /**
     * The interface identifier for IDWriteFactory
     * @type {Guid}
     */
    static IID => Guid("{b859ee5a-d838-4b5b-a2e8-1adc7d93db48}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDWriteFontCollection>} fontCollection 
     * @param {BOOL} checkForUpdates 
     * @returns {HRESULT} 
     */
    GetSystemFontCollection(fontCollection, checkForUpdates) {
        result := ComCall(3, this, "ptr", fontCollection, "int", checkForUpdates, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontCollectionLoader>} collectionLoader 
     * @param {Pointer} collectionKey 
     * @param {Integer} collectionKeySize 
     * @param {Pointer<IDWriteFontCollection>} fontCollection 
     * @returns {HRESULT} 
     */
    CreateCustomFontCollection(collectionLoader, collectionKey, collectionKeySize, fontCollection) {
        result := ComCall(4, this, "ptr", collectionLoader, "ptr", collectionKey, "uint", collectionKeySize, "ptr", fontCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontCollectionLoader>} fontCollectionLoader 
     * @returns {HRESULT} 
     */
    RegisterFontCollectionLoader(fontCollectionLoader) {
        result := ComCall(5, this, "ptr", fontCollectionLoader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontCollectionLoader>} fontCollectionLoader 
     * @returns {HRESULT} 
     */
    UnregisterFontCollectionLoader(fontCollectionLoader) {
        result := ComCall(6, this, "ptr", fontCollectionLoader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} filePath 
     * @param {Pointer<FILETIME>} lastWriteTime 
     * @param {Pointer<IDWriteFontFile>} fontFile 
     * @returns {HRESULT} 
     */
    CreateFontFileReference(filePath, lastWriteTime, fontFile) {
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := ComCall(7, this, "ptr", filePath, "ptr", lastWriteTime, "ptr", fontFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} fontFileReferenceKey 
     * @param {Integer} fontFileReferenceKeySize 
     * @param {Pointer<IDWriteFontFileLoader>} fontFileLoader 
     * @param {Pointer<IDWriteFontFile>} fontFile 
     * @returns {HRESULT} 
     */
    CreateCustomFontFileReference(fontFileReferenceKey, fontFileReferenceKeySize, fontFileLoader, fontFile) {
        result := ComCall(8, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "ptr", fontFileLoader, "ptr", fontFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fontFaceType 
     * @param {Integer} numberOfFiles 
     * @param {Pointer<IDWriteFontFile>} fontFiles 
     * @param {Integer} faceIndex 
     * @param {Integer} fontFaceSimulationFlags 
     * @param {Pointer<IDWriteFontFace>} fontFace 
     * @returns {HRESULT} 
     */
    CreateFontFace(fontFaceType, numberOfFiles, fontFiles, faceIndex, fontFaceSimulationFlags, fontFace) {
        result := ComCall(9, this, "int", fontFaceType, "uint", numberOfFiles, "ptr", fontFiles, "uint", faceIndex, "int", fontFaceSimulationFlags, "ptr", fontFace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteRenderingParams>} renderingParams 
     * @returns {HRESULT} 
     */
    CreateRenderingParams(renderingParams) {
        result := ComCall(10, this, "ptr", renderingParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HMONITOR} monitor 
     * @param {Pointer<IDWriteRenderingParams>} renderingParams 
     * @returns {HRESULT} 
     */
    CreateMonitorRenderingParams(monitor, renderingParams) {
        monitor := monitor is Win32Handle ? NumGet(monitor, "ptr") : monitor

        result := ComCall(11, this, "ptr", monitor, "ptr", renderingParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} gamma 
     * @param {Float} enhancedContrast 
     * @param {Float} clearTypeLevel 
     * @param {Integer} pixelGeometry 
     * @param {Integer} renderingMode 
     * @param {Pointer<IDWriteRenderingParams>} renderingParams 
     * @returns {HRESULT} 
     */
    CreateCustomRenderingParams(gamma, enhancedContrast, clearTypeLevel, pixelGeometry, renderingMode, renderingParams) {
        result := ComCall(12, this, "float", gamma, "float", enhancedContrast, "float", clearTypeLevel, "int", pixelGeometry, "int", renderingMode, "ptr", renderingParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFileLoader>} fontFileLoader 
     * @returns {HRESULT} 
     */
    RegisterFontFileLoader(fontFileLoader) {
        result := ComCall(13, this, "ptr", fontFileLoader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFileLoader>} fontFileLoader 
     * @returns {HRESULT} 
     */
    UnregisterFontFileLoader(fontFileLoader) {
        result := ComCall(14, this, "ptr", fontFileLoader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} fontFamilyName 
     * @param {Pointer<IDWriteFontCollection>} fontCollection 
     * @param {Integer} fontWeight 
     * @param {Integer} fontStyle 
     * @param {Integer} fontStretch 
     * @param {Float} fontSize 
     * @param {PWSTR} localeName 
     * @param {Pointer<IDWriteTextFormat>} textFormat 
     * @returns {HRESULT} 
     */
    CreateTextFormat(fontFamilyName, fontCollection, fontWeight, fontStyle, fontStretch, fontSize, localeName, textFormat) {
        fontFamilyName := fontFamilyName is String ? StrPtr(fontFamilyName) : fontFamilyName
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(15, this, "ptr", fontFamilyName, "ptr", fontCollection, "int", fontWeight, "int", fontStyle, "int", fontStretch, "float", fontSize, "ptr", localeName, "ptr", textFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteTypography>} typography 
     * @returns {HRESULT} 
     */
    CreateTypography(typography) {
        result := ComCall(16, this, "ptr", typography, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteGdiInterop>} gdiInterop 
     * @returns {HRESULT} 
     */
    GetGdiInterop(gdiInterop) {
        result := ComCall(17, this, "ptr", gdiInterop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} string 
     * @param {Integer} stringLength 
     * @param {Pointer<IDWriteTextFormat>} textFormat 
     * @param {Float} maxWidth 
     * @param {Float} maxHeight 
     * @param {Pointer<IDWriteTextLayout>} textLayout 
     * @returns {HRESULT} 
     */
    CreateTextLayout(string, stringLength, textFormat, maxWidth, maxHeight, textLayout) {
        string := string is String ? StrPtr(string) : string

        result := ComCall(18, this, "ptr", string, "uint", stringLength, "ptr", textFormat, "float", maxWidth, "float", maxHeight, "ptr", textLayout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} string 
     * @param {Integer} stringLength 
     * @param {Pointer<IDWriteTextFormat>} textFormat 
     * @param {Float} layoutWidth 
     * @param {Float} layoutHeight 
     * @param {Float} pixelsPerDip 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @param {BOOL} useGdiNatural 
     * @param {Pointer<IDWriteTextLayout>} textLayout 
     * @returns {HRESULT} 
     */
    CreateGdiCompatibleTextLayout(string, stringLength, textFormat, layoutWidth, layoutHeight, pixelsPerDip, transform, useGdiNatural, textLayout) {
        string := string is String ? StrPtr(string) : string

        result := ComCall(19, this, "ptr", string, "uint", stringLength, "ptr", textFormat, "float", layoutWidth, "float", layoutHeight, "float", pixelsPerDip, "ptr", transform, "int", useGdiNatural, "ptr", textLayout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteTextFormat>} textFormat 
     * @param {Pointer<IDWriteInlineObject>} trimmingSign 
     * @returns {HRESULT} 
     */
    CreateEllipsisTrimmingSign(textFormat, trimmingSign) {
        result := ComCall(20, this, "ptr", textFormat, "ptr", trimmingSign, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteTextAnalyzer>} textAnalyzer 
     * @returns {HRESULT} 
     */
    CreateTextAnalyzer(textAnalyzer) {
        result := ComCall(21, this, "ptr", textAnalyzer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} substitutionMethod 
     * @param {PWSTR} localeName 
     * @param {BOOL} ignoreUserOverride 
     * @param {Pointer<IDWriteNumberSubstitution>} numberSubstitution 
     * @returns {HRESULT} 
     */
    CreateNumberSubstitution(substitutionMethod, localeName, ignoreUserOverride, numberSubstitution) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(22, this, "int", substitutionMethod, "ptr", localeName, "int", ignoreUserOverride, "ptr", numberSubstitution, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Float} pixelsPerDip 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @param {Integer} renderingMode 
     * @param {Integer} measuringMode 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {Pointer<IDWriteGlyphRunAnalysis>} glyphRunAnalysis 
     * @returns {HRESULT} 
     */
    CreateGlyphRunAnalysis(glyphRun, pixelsPerDip, transform, renderingMode, measuringMode, baselineOriginX, baselineOriginY, glyphRunAnalysis) {
        result := ComCall(23, this, "ptr", glyphRun, "float", pixelsPerDip, "ptr", transform, "int", renderingMode, "int", measuringMode, "float", baselineOriginX, "float", baselineOriginY, "ptr", glyphRunAnalysis, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
