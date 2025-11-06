#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontCollection.ahk
#Include .\IDWriteRenderingParams1.ahk
#Include .\IDWriteFactory.ahk

/**
 * The root factory interface for all DirectWrite objects.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nn-dwrite_1-idwritefactory1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFactory1 extends IDWriteFactory{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFactory1
     * @type {Guid}
     */
    static IID => Guid("{30572f99-dac6-41db-a16e-0486307e606a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEudcFontCollection", "CreateCustomRenderingParams"]

    /**
     * 
     * @param {BOOL} checkForUpdates 
     * @returns {IDWriteFontCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefactory1-geteudcfontcollection
     */
    GetEudcFontCollection(checkForUpdates) {
        result := ComCall(24, this, "ptr*", &fontCollection := 0, "int", checkForUpdates, "HRESULT")
        return IDWriteFontCollection(fontCollection)
    }

    /**
     * 
     * @param {Float} gamma 
     * @param {Float} enhancedContrast 
     * @param {Float} enhancedContrastGrayscale 
     * @param {Float} clearTypeLevel 
     * @param {Integer} pixelGeometry 
     * @param {Integer} renderingMode 
     * @returns {IDWriteRenderingParams1} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefactory1-createcustomrenderingparams
     */
    CreateCustomRenderingParams(gamma, enhancedContrast, enhancedContrastGrayscale, clearTypeLevel, pixelGeometry, renderingMode) {
        result := ComCall(25, this, "float", gamma, "float", enhancedContrast, "float", enhancedContrastGrayscale, "float", clearTypeLevel, "int", pixelGeometry, "int", renderingMode, "ptr*", &renderingParams := 0, "HRESULT")
        return IDWriteRenderingParams1(renderingParams)
    }
}
