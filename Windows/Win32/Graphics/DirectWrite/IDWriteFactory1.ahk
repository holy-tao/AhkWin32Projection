#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IDWriteFontCollection>} fontCollection 
     * @param {BOOL} checkForUpdates 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefactory1-geteudcfontcollection
     */
    GetEudcFontCollection(fontCollection, checkForUpdates) {
        result := ComCall(24, this, "ptr*", fontCollection, "int", checkForUpdates, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} gamma 
     * @param {Float} enhancedContrast 
     * @param {Float} enhancedContrastGrayscale 
     * @param {Float} clearTypeLevel 
     * @param {Integer} pixelGeometry 
     * @param {Integer} renderingMode 
     * @param {Pointer<IDWriteRenderingParams1>} renderingParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefactory1-createcustomrenderingparams
     */
    CreateCustomRenderingParams(gamma, enhancedContrast, enhancedContrastGrayscale, clearTypeLevel, pixelGeometry, renderingMode, renderingParams) {
        result := ComCall(25, this, "float", gamma, "float", enhancedContrast, "float", enhancedContrastGrayscale, "float", clearTypeLevel, "int", pixelGeometry, "int", renderingMode, "ptr*", renderingParams, "HRESULT")
        return result
    }
}
