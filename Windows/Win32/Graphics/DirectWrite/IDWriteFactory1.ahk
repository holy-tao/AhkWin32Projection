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
     * Gets a font collection representing the set of EUDC (end-user defined characters) fonts.
     * @param {BOOL} checkForUpdates Type: <b>BOOL</b>
     * 
     * Whether to check for updates.
     * @returns {IDWriteFontCollection} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollection">IDWriteFontCollection</a>**</b>
     * 
     * The font collection to fill.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefactory1-geteudcfontcollection
     */
    GetEudcFontCollection(checkForUpdates) {
        result := ComCall(24, this, "ptr*", &fontCollection := 0, "int", checkForUpdates, "HRESULT")
        return IDWriteFontCollection(fontCollection)
    }

    /**
     * Creates a rendering parameters object with the specified properties.
     * @param {Float} gamma Type: <b>FLOAT</b>
     * 
     * The gamma level to be set for the new rendering parameters object.
     * @param {Float} enhancedContrast Type: <b>FLOAT</b>
     * 
     * The enhanced contrast level to be set for the new rendering parameters object.
     * @param {Float} enhancedContrastGrayscale Type: <b>FLOAT</b>
     * 
     * The amount of contrast enhancement to use for grayscale antialiasing, zero or greater.
     * @param {Float} clearTypeLevel Type: <b>FLOAT</b>
     * 
     * The ClearType level to be set for the new rendering parameters object.
     * @param {Integer} pixelGeometry Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_pixel_geometry">DWRITE_PIXEL_GEOMETRY</a></b>
     * 
     * Represents the internal structure of a device pixel (that is, the physical arrangement of red, green, and blue color components) that is assumed for purposes of rendering text.
     * @param {Integer} renderingMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_rendering_mode">DWRITE_RENDERING_MODE</a></b>
     * 
     * A value that represents the method (for example, ClearType natural quality) for rendering glyphs.
     * @returns {IDWriteRenderingParams1} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nn-dwrite_1-idwriterenderingparams1">IDWriteRenderingParams1</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to the newly created rendering parameters object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefactory1-createcustomrenderingparams
     */
    CreateCustomRenderingParams(gamma, enhancedContrast, enhancedContrastGrayscale, clearTypeLevel, pixelGeometry, renderingMode) {
        result := ComCall(25, this, "float", gamma, "float", enhancedContrast, "float", enhancedContrastGrayscale, "float", clearTypeLevel, "int", pixelGeometry, "int", renderingMode, "ptr*", &renderingParams := 0, "HRESULT")
        return IDWriteRenderingParams1(renderingParams)
    }
}
