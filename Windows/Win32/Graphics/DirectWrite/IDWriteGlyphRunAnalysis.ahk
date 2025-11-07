#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains low-level information used to render a glyph run.
 * @remarks
 * 
  * The alpha texture can be a   bi-level alpha  texture or a ClearType alpha texture.  
  * 
  * A bi-level alpha texture contains one byte per pixel, therefore the size of the buffer for a bi-level texture will be the area of the texture bounds, in bytes. Each byte in a bi-level alpha texture created by <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriteglyphrunanalysis-createalphatexture">CreateAlphaTexture</a> is either set to DWRITE_ALPHA_MAX (that is, 255) or zero.
  * 
  * A ClearType alpha texture contains three bytes per pixel, therefore the size of the buffer for a ClearType alpha texture is three times the area of the texture bounds, in bytes.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwriteglyphrunanalysis
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteGlyphRunAnalysis extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteGlyphRunAnalysis
     * @type {Guid}
     */
    static IID => Guid("{7d97dbf7-e085-42d4-81e3-6a883bded118}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAlphaTextureBounds", "CreateAlphaTexture", "GetAlphaBlendParams"]

    /**
     * 
     * @param {Integer} textureType 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriteglyphrunanalysis-getalphatexturebounds
     */
    GetAlphaTextureBounds(textureType) {
        textureBounds := RECT()
        result := ComCall(3, this, "int", textureType, "ptr", textureBounds, "HRESULT")
        return textureBounds
    }

    /**
     * 
     * @param {Integer} textureType 
     * @param {Pointer<RECT>} textureBounds 
     * @param {Pointer} alphaValues 
     * @param {Integer} bufferSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriteglyphrunanalysis-createalphatexture
     */
    CreateAlphaTexture(textureType, textureBounds, alphaValues, bufferSize) {
        result := ComCall(4, this, "int", textureType, "ptr", textureBounds, "ptr", alphaValues, "uint", bufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteRenderingParams} renderingParams 
     * @param {Pointer<Float>} blendGamma 
     * @param {Pointer<Float>} blendEnhancedContrast 
     * @param {Pointer<Float>} blendClearTypeLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriteglyphrunanalysis-getalphablendparams
     */
    GetAlphaBlendParams(renderingParams, blendGamma, blendEnhancedContrast, blendClearTypeLevel) {
        blendGammaMarshal := blendGamma is VarRef ? "float*" : "ptr"
        blendEnhancedContrastMarshal := blendEnhancedContrast is VarRef ? "float*" : "ptr"
        blendClearTypeLevelMarshal := blendClearTypeLevel is VarRef ? "float*" : "ptr"

        result := ComCall(5, this, "ptr", renderingParams, blendGammaMarshal, blendGamma, blendEnhancedContrastMarshal, blendEnhancedContrast, blendClearTypeLevelMarshal, blendClearTypeLevel, "HRESULT")
        return result
    }
}
