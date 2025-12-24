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
     * Gets the bounding rectangle of the physical pixels affected by the glyph run.
     * @param {Integer} textureType Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_texture_type">DWRITE_TEXTURE_TYPE</a></b>
     * 
     * Specifies the type of texture requested. If a bi-level texture is requested, the
     *      bounding rectangle includes only bi-level glyphs. Otherwise, the bounding rectangle includes only antialiased
     *      glyphs.
     * @returns {RECT} Type: <b>RECT*</b>
     * 
     * When this method returns, contains the bounding rectangle of the physical pixels affected by the glyph run, or an empty rectangle if there are no glyphs
     *      of the specified texture type.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwriteglyphrunanalysis-getalphatexturebounds
     */
    GetAlphaTextureBounds(textureType) {
        textureBounds := RECT()
        result := ComCall(3, this, "int", textureType, "ptr", textureBounds, "HRESULT")
        return textureBounds
    }

    /**
     * Creates an alpha texture of the specified type for glyphs within a specified bounding rectangle.
     * @param {Integer} textureType Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_texture_type">DWRITE_TEXTURE_TYPE</a></b>
     * 
     * A value that specifies the type of texture requested. This can be <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_texture_type">DWRITE_TEXTURE_BILEVEL_1x1</a> or <b>DWRITE_TEXTURE_CLEARTYPE_3x1</b>. If a bi-level texture is requested, the
     *      texture contains only bi-level glyphs. Otherwise, the texture contains only antialiased glyphs.
     * @param {Pointer<RECT>} textureBounds Type: <b>const RECT*</b>
     * 
     * The bounding rectangle of the texture, which can be different than
     *      the bounding rectangle returned by <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriteglyphrunanalysis-getalphatexturebounds">GetAlphaTextureBounds</a>.
     * @param {Pointer} alphaValues Type: <b>BYTE*</b>
     * 
     * When this method returns, contains  the array of alpha values from the texture. The buffer allocated for this array must be at least the size of <i>bufferSize</i>.
     * @param {Integer} bufferSize Type: <b>UINT32</b>
     * 
     * The size of the <i>alphaValues</i> array, in bytes. The minimum size depends on the dimensions of the
     *      rectangle and the type of texture requested.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwriteglyphrunanalysis-createalphatexture
     */
    CreateAlphaTexture(textureType, textureBounds, alphaValues, bufferSize) {
        result := ComCall(4, this, "int", textureType, "ptr", textureBounds, "ptr", alphaValues, "uint", bufferSize, "HRESULT")
        return result
    }

    /**
     * Gets alpha blending properties required for ClearType blending.
     * @param {IDWriteRenderingParams} renderingParams Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a>*</b>
     * 
     * An object that specifies the ClearType level and enhanced contrast, gamma, pixel geometry, and rendering mode. In most cases, the values returned by the output
     *      parameters of this method are based on the properties of this object, unless a GDI-compatible rendering mode
     *      was specified.
     * @param {Pointer<Float>} blendGamma Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains  the gamma value to use for gamma correction.
     * @param {Pointer<Float>} blendEnhancedContrast Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains the enhanced contrast value to be used for blending.
     * @param {Pointer<Float>} blendClearTypeLevel Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains  the ClearType level used in the alpha blending.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwriteglyphrunanalysis-getalphablendparams
     */
    GetAlphaBlendParams(renderingParams, blendGamma, blendEnhancedContrast, blendClearTypeLevel) {
        blendGammaMarshal := blendGamma is VarRef ? "float*" : "ptr"
        blendEnhancedContrastMarshal := blendEnhancedContrast is VarRef ? "float*" : "ptr"
        blendClearTypeLevelMarshal := blendClearTypeLevel is VarRef ? "float*" : "ptr"

        result := ComCall(5, this, "ptr", renderingParams, blendGammaMarshal, blendGamma, blendEnhancedContrastMarshal, blendEnhancedContrast, blendClearTypeLevelMarshal, blendClearTypeLevel, "HRESULT")
        return result
    }
}
