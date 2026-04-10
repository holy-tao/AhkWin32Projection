#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFace6.ahk
#Include .\IDWritePaintReader.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class IDWriteFontFace7 extends IDWriteFontFace6 {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFace7
     * @type {Guid}
     */
    static IID => Guid("{3945b85b-bc95-40f7-b72c-8b73bfc7e13b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 60

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPaintFeatureLevel", "CreatePaintReader"]

    /**
     * 
     * @param {DWRITE_GLYPH_IMAGE_FORMATS} glyphImageFormat 
     * @returns {DWRITE_PAINT_FEATURE_LEVEL} 
     */
    GetPaintFeatureLevel(glyphImageFormat) {
        result := ComCall(60, this, "int", glyphImageFormat, "int")
        return result
    }

    /**
     * 
     * @param {DWRITE_GLYPH_IMAGE_FORMATS} glyphImageFormat 
     * @param {DWRITE_PAINT_FEATURE_LEVEL} paintFeatureLevel 
     * @returns {IDWritePaintReader} 
     */
    CreatePaintReader(glyphImageFormat, paintFeatureLevel) {
        result := ComCall(61, this, "int", glyphImageFormat, "int", paintFeatureLevel, "ptr*", &paintReader := 0, "HRESULT")
        return IDWritePaintReader(paintReader)
    }
}
