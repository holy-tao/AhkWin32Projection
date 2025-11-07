#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontCollection.ahk
#Include .\IDWriteFontFile.ahk
#Include .\IDWriteFontFace.ahk
#Include .\IDWriteRenderingParams.ahk
#Include .\IDWriteTextFormat.ahk
#Include .\IDWriteTypography.ahk
#Include .\IDWriteGdiInterop.ahk
#Include .\IDWriteTextLayout.ahk
#Include .\IDWriteInlineObject.ahk
#Include .\IDWriteTextAnalyzer.ahk
#Include .\IDWriteNumberSubstitution.ahk
#Include .\IDWriteGlyphRunAnalysis.ahk
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
     * @param {BOOL} checkForUpdates 
     * @returns {IDWriteFontCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-getsystemfontcollection
     */
    GetSystemFontCollection(checkForUpdates) {
        result := ComCall(3, this, "ptr*", &fontCollection := 0, "int", checkForUpdates, "HRESULT")
        return IDWriteFontCollection(fontCollection)
    }

    /**
     * 
     * @param {IDWriteFontCollectionLoader} collectionLoader 
     * @param {Pointer} collectionKey 
     * @param {Integer} collectionKeySize 
     * @returns {IDWriteFontCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createcustomfontcollection
     */
    CreateCustomFontCollection(collectionLoader, collectionKey, collectionKeySize) {
        result := ComCall(4, this, "ptr", collectionLoader, "ptr", collectionKey, "uint", collectionKeySize, "ptr*", &fontCollection := 0, "HRESULT")
        return IDWriteFontCollection(fontCollection)
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
     * @returns {IDWriteFontFile} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createfontfilereference
     */
    CreateFontFileReference(filePath, lastWriteTime) {
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := ComCall(7, this, "ptr", filePath, "ptr", lastWriteTime, "ptr*", &fontFile := 0, "HRESULT")
        return IDWriteFontFile(fontFile)
    }

    /**
     * 
     * @param {Pointer} fontFileReferenceKey 
     * @param {Integer} fontFileReferenceKeySize 
     * @param {IDWriteFontFileLoader} fontFileLoader 
     * @returns {IDWriteFontFile} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createcustomfontfilereference
     */
    CreateCustomFontFileReference(fontFileReferenceKey, fontFileReferenceKeySize, fontFileLoader) {
        result := ComCall(8, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "ptr", fontFileLoader, "ptr*", &fontFile := 0, "HRESULT")
        return IDWriteFontFile(fontFile)
    }

    /**
     * 
     * @param {Integer} fontFaceType 
     * @param {Integer} numberOfFiles 
     * @param {Pointer<IDWriteFontFile>} fontFiles 
     * @param {Integer} faceIndex 
     * @param {Integer} fontFaceSimulationFlags 
     * @returns {IDWriteFontFace} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createfontface
     */
    CreateFontFace(fontFaceType, numberOfFiles, fontFiles, faceIndex, fontFaceSimulationFlags) {
        result := ComCall(9, this, "int", fontFaceType, "uint", numberOfFiles, "ptr*", fontFiles, "uint", faceIndex, "int", fontFaceSimulationFlags, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace(fontFace)
    }

    /**
     * 
     * @returns {IDWriteRenderingParams} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createrenderingparams
     */
    CreateRenderingParams() {
        result := ComCall(10, this, "ptr*", &renderingParams := 0, "HRESULT")
        return IDWriteRenderingParams(renderingParams)
    }

    /**
     * 
     * @param {HMONITOR} monitor 
     * @returns {IDWriteRenderingParams} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createmonitorrenderingparams
     */
    CreateMonitorRenderingParams(monitor) {
        monitor := monitor is Win32Handle ? NumGet(monitor, "ptr") : monitor

        result := ComCall(11, this, "ptr", monitor, "ptr*", &renderingParams := 0, "HRESULT")
        return IDWriteRenderingParams(renderingParams)
    }

    /**
     * 
     * @param {Float} gamma 
     * @param {Float} enhancedContrast 
     * @param {Float} clearTypeLevel 
     * @param {Integer} pixelGeometry 
     * @param {Integer} renderingMode 
     * @returns {IDWriteRenderingParams} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createcustomrenderingparams
     */
    CreateCustomRenderingParams(gamma, enhancedContrast, clearTypeLevel, pixelGeometry, renderingMode) {
        result := ComCall(12, this, "float", gamma, "float", enhancedContrast, "float", clearTypeLevel, "int", pixelGeometry, "int", renderingMode, "ptr*", &renderingParams := 0, "HRESULT")
        return IDWriteRenderingParams(renderingParams)
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
     * @returns {IDWriteTextFormat} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createtextformat
     */
    CreateTextFormat(fontFamilyName, fontCollection, fontWeight, fontStyle, fontStretch, fontSize, localeName) {
        fontFamilyName := fontFamilyName is String ? StrPtr(fontFamilyName) : fontFamilyName
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(15, this, "ptr", fontFamilyName, "ptr", fontCollection, "int", fontWeight, "int", fontStyle, "int", fontStretch, "float", fontSize, "ptr", localeName, "ptr*", &textFormat := 0, "HRESULT")
        return IDWriteTextFormat(textFormat)
    }

    /**
     * 
     * @returns {IDWriteTypography} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createtypography
     */
    CreateTypography() {
        result := ComCall(16, this, "ptr*", &typography := 0, "HRESULT")
        return IDWriteTypography(typography)
    }

    /**
     * 
     * @returns {IDWriteGdiInterop} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-getgdiinterop
     */
    GetGdiInterop() {
        result := ComCall(17, this, "ptr*", &gdiInterop := 0, "HRESULT")
        return IDWriteGdiInterop(gdiInterop)
    }

    /**
     * 
     * @param {PWSTR} string 
     * @param {Integer} stringLength 
     * @param {IDWriteTextFormat} textFormat 
     * @param {Float} maxWidth 
     * @param {Float} maxHeight 
     * @returns {IDWriteTextLayout} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createtextlayout
     */
    CreateTextLayout(string, stringLength, textFormat, maxWidth, maxHeight) {
        string := string is String ? StrPtr(string) : string

        result := ComCall(18, this, "ptr", string, "uint", stringLength, "ptr", textFormat, "float", maxWidth, "float", maxHeight, "ptr*", &textLayout := 0, "HRESULT")
        return IDWriteTextLayout(textLayout)
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
     * @returns {IDWriteTextLayout} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-creategdicompatibletextlayout
     */
    CreateGdiCompatibleTextLayout(string, stringLength, textFormat, layoutWidth, layoutHeight, pixelsPerDip, transform, useGdiNatural) {
        string := string is String ? StrPtr(string) : string

        result := ComCall(19, this, "ptr", string, "uint", stringLength, "ptr", textFormat, "float", layoutWidth, "float", layoutHeight, "float", pixelsPerDip, "ptr", transform, "int", useGdiNatural, "ptr*", &textLayout := 0, "HRESULT")
        return IDWriteTextLayout(textLayout)
    }

    /**
     * 
     * @param {IDWriteTextFormat} textFormat 
     * @returns {IDWriteInlineObject} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createellipsistrimmingsign
     */
    CreateEllipsisTrimmingSign(textFormat) {
        result := ComCall(20, this, "ptr", textFormat, "ptr*", &trimmingSign := 0, "HRESULT")
        return IDWriteInlineObject(trimmingSign)
    }

    /**
     * 
     * @returns {IDWriteTextAnalyzer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createtextanalyzer
     */
    CreateTextAnalyzer() {
        result := ComCall(21, this, "ptr*", &textAnalyzer := 0, "HRESULT")
        return IDWriteTextAnalyzer(textAnalyzer)
    }

    /**
     * 
     * @param {Integer} substitutionMethod 
     * @param {PWSTR} localeName 
     * @param {BOOL} ignoreUserOverride 
     * @returns {IDWriteNumberSubstitution} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createnumbersubstitution
     */
    CreateNumberSubstitution(substitutionMethod, localeName, ignoreUserOverride) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(22, this, "int", substitutionMethod, "ptr", localeName, "int", ignoreUserOverride, "ptr*", &numberSubstitution := 0, "HRESULT")
        return IDWriteNumberSubstitution(numberSubstitution)
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
     * @returns {IDWriteGlyphRunAnalysis} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createglyphrunanalysis
     */
    CreateGlyphRunAnalysis(glyphRun, pixelsPerDip, transform, renderingMode, measuringMode, baselineOriginX, baselineOriginY) {
        result := ComCall(23, this, "ptr", glyphRun, "float", pixelsPerDip, "ptr", transform, "int", renderingMode, "int", measuringMode, "float", baselineOriginX, "float", baselineOriginY, "ptr*", &glyphRunAnalysis := 0, "HRESULT")
        return IDWriteGlyphRunAnalysis(glyphRunAnalysis)
    }
}
