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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSystemFontCollection", "CreateCustomFontCollection", "RegisterFontCollectionLoader", "UnregisterFontCollectionLoader", "CreateFontFileReference", "CreateCustomFontFileReference", "CreateFontFace", "CreateRenderingParams", "CreateMonitorRenderingParams", "CreateCustomRenderingParams", "RegisterFontFileLoader", "UnregisterFontFileLoader", "CreateTextFormat", "CreateTypography", "GetGdiInterop", "CreateTextLayout", "CreateGdiCompatibleTextLayout", "CreateEllipsisTrimmingSign", "CreateTextAnalyzer", "CreateNumberSubstitution", "CreateGlyphRunAnalysis"]

    /**
     * 
     * @param {Pointer<IDWriteFontCollection>} fontCollection 
     * @param {BOOL} checkForUpdates 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-getsystemfontcollection
     */
    GetSystemFontCollection(fontCollection, checkForUpdates) {
        result := ComCall(3, this, "ptr*", fontCollection, "int", checkForUpdates, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteFontCollectionLoader} collectionLoader 
     * @param {Pointer} collectionKey 
     * @param {Integer} collectionKeySize 
     * @param {Pointer<IDWriteFontCollection>} fontCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createcustomfontcollection
     */
    CreateCustomFontCollection(collectionLoader, collectionKey, collectionKeySize, fontCollection) {
        result := ComCall(4, this, "ptr", collectionLoader, "ptr", collectionKey, "uint", collectionKeySize, "ptr*", fontCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteFontCollectionLoader} fontCollectionLoader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-registerfontcollectionloader
     */
    RegisterFontCollectionLoader(fontCollectionLoader) {
        result := ComCall(5, this, "ptr", fontCollectionLoader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteFontCollectionLoader} fontCollectionLoader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-unregisterfontcollectionloader
     */
    UnregisterFontCollectionLoader(fontCollectionLoader) {
        result := ComCall(6, this, "ptr", fontCollectionLoader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} filePath 
     * @param {Pointer<FILETIME>} lastWriteTime 
     * @param {Pointer<IDWriteFontFile>} fontFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createfontfilereference
     */
    CreateFontFileReference(filePath, lastWriteTime, fontFile) {
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := ComCall(7, this, "ptr", filePath, "ptr", lastWriteTime, "ptr*", fontFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} fontFileReferenceKey 
     * @param {Integer} fontFileReferenceKeySize 
     * @param {IDWriteFontFileLoader} fontFileLoader 
     * @param {Pointer<IDWriteFontFile>} fontFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createcustomfontfilereference
     */
    CreateCustomFontFileReference(fontFileReferenceKey, fontFileReferenceKeySize, fontFileLoader, fontFile) {
        result := ComCall(8, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "ptr", fontFileLoader, "ptr*", fontFile, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createfontface
     */
    CreateFontFace(fontFaceType, numberOfFiles, fontFiles, faceIndex, fontFaceSimulationFlags, fontFace) {
        result := ComCall(9, this, "int", fontFaceType, "uint", numberOfFiles, "ptr*", fontFiles, "uint", faceIndex, "int", fontFaceSimulationFlags, "ptr*", fontFace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteRenderingParams>} renderingParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createrenderingparams
     */
    CreateRenderingParams(renderingParams) {
        result := ComCall(10, this, "ptr*", renderingParams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HMONITOR} monitor 
     * @param {Pointer<IDWriteRenderingParams>} renderingParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createmonitorrenderingparams
     */
    CreateMonitorRenderingParams(monitor, renderingParams) {
        monitor := monitor is Win32Handle ? NumGet(monitor, "ptr") : monitor

        result := ComCall(11, this, "ptr", monitor, "ptr*", renderingParams, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createcustomrenderingparams
     */
    CreateCustomRenderingParams(gamma, enhancedContrast, clearTypeLevel, pixelGeometry, renderingMode, renderingParams) {
        result := ComCall(12, this, "float", gamma, "float", enhancedContrast, "float", clearTypeLevel, "int", pixelGeometry, "int", renderingMode, "ptr*", renderingParams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteFontFileLoader} fontFileLoader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-registerfontfileloader
     */
    RegisterFontFileLoader(fontFileLoader) {
        result := ComCall(13, this, "ptr", fontFileLoader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteFontFileLoader} fontFileLoader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-unregisterfontfileloader
     */
    UnregisterFontFileLoader(fontFileLoader) {
        result := ComCall(14, this, "ptr", fontFileLoader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} fontFamilyName 
     * @param {IDWriteFontCollection} fontCollection 
     * @param {Integer} fontWeight 
     * @param {Integer} fontStyle 
     * @param {Integer} fontStretch 
     * @param {Float} fontSize 
     * @param {PWSTR} localeName 
     * @param {Pointer<IDWriteTextFormat>} textFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createtextformat
     */
    CreateTextFormat(fontFamilyName, fontCollection, fontWeight, fontStyle, fontStretch, fontSize, localeName, textFormat) {
        fontFamilyName := fontFamilyName is String ? StrPtr(fontFamilyName) : fontFamilyName
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(15, this, "ptr", fontFamilyName, "ptr", fontCollection, "int", fontWeight, "int", fontStyle, "int", fontStretch, "float", fontSize, "ptr", localeName, "ptr*", textFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteTypography>} typography 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createtypography
     */
    CreateTypography(typography) {
        result := ComCall(16, this, "ptr*", typography, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteGdiInterop>} gdiInterop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-getgdiinterop
     */
    GetGdiInterop(gdiInterop) {
        result := ComCall(17, this, "ptr*", gdiInterop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} string 
     * @param {Integer} stringLength 
     * @param {IDWriteTextFormat} textFormat 
     * @param {Float} maxWidth 
     * @param {Float} maxHeight 
     * @param {Pointer<IDWriteTextLayout>} textLayout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createtextlayout
     */
    CreateTextLayout(string, stringLength, textFormat, maxWidth, maxHeight, textLayout) {
        string := string is String ? StrPtr(string) : string

        result := ComCall(18, this, "ptr", string, "uint", stringLength, "ptr", textFormat, "float", maxWidth, "float", maxHeight, "ptr*", textLayout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} string 
     * @param {Integer} stringLength 
     * @param {IDWriteTextFormat} textFormat 
     * @param {Float} layoutWidth 
     * @param {Float} layoutHeight 
     * @param {Float} pixelsPerDip 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @param {BOOL} useGdiNatural 
     * @param {Pointer<IDWriteTextLayout>} textLayout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-creategdicompatibletextlayout
     */
    CreateGdiCompatibleTextLayout(string, stringLength, textFormat, layoutWidth, layoutHeight, pixelsPerDip, transform, useGdiNatural, textLayout) {
        string := string is String ? StrPtr(string) : string

        result := ComCall(19, this, "ptr", string, "uint", stringLength, "ptr", textFormat, "float", layoutWidth, "float", layoutHeight, "float", pixelsPerDip, "ptr", transform, "int", useGdiNatural, "ptr*", textLayout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteTextFormat} textFormat 
     * @param {Pointer<IDWriteInlineObject>} trimmingSign 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createellipsistrimmingsign
     */
    CreateEllipsisTrimmingSign(textFormat, trimmingSign) {
        result := ComCall(20, this, "ptr", textFormat, "ptr*", trimmingSign, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteTextAnalyzer>} textAnalyzer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createtextanalyzer
     */
    CreateTextAnalyzer(textAnalyzer) {
        result := ComCall(21, this, "ptr*", textAnalyzer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} substitutionMethod 
     * @param {PWSTR} localeName 
     * @param {BOOL} ignoreUserOverride 
     * @param {Pointer<IDWriteNumberSubstitution>} numberSubstitution 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createnumbersubstitution
     */
    CreateNumberSubstitution(substitutionMethod, localeName, ignoreUserOverride, numberSubstitution) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(22, this, "int", substitutionMethod, "ptr", localeName, "int", ignoreUserOverride, "ptr*", numberSubstitution, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createglyphrunanalysis
     */
    CreateGlyphRunAnalysis(glyphRun, pixelsPerDip, transform, renderingMode, measuringMode, baselineOriginX, baselineOriginY, glyphRunAnalysis) {
        result := ComCall(23, this, "ptr", glyphRun, "float", pixelsPerDip, "ptr", transform, "int", renderingMode, "int", measuringMode, "float", baselineOriginX, "float", baselineOriginY, "ptr*", glyphRunAnalysis, "HRESULT")
        return result
    }
}
