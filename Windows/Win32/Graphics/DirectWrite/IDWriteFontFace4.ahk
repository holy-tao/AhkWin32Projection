#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFace3.ahk

/**
 * Contains font face type, appropriate file references, and face identification data. (IDWriteFontFace4)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontface4
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFace4 extends IDWriteFontFace3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFace4
     * @type {Guid}
     */
    static IID => Guid("{27f2a904-4eb8-441d-9678-0563f53e3e2f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 49

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGlyphImageFormats", "GetGlyphImageFormats1", "GetGlyphImageData", "ReleaseGlyphImageData"]

    /**
     * Gets all the glyph image formats supported by the entire font. (IDWriteFontFace4.GetGlyphImageFormats)
     * @param {Integer} glyphId 
     * @param {Integer} pixelsPerEmFirst 
     * @param {Integer} pixelsPerEmLast 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface4-getglyphimageformats
     */
    GetGlyphImageFormats(glyphId, pixelsPerEmFirst, pixelsPerEmLast) {
        result := ComCall(49, this, "ushort", glyphId, "uint", pixelsPerEmFirst, "uint", pixelsPerEmLast, "int*", &glyphImageFormats := 0, "HRESULT")
        return glyphImageFormats
    }

    /**
     * Gets all the glyph image formats supported by the entire font. (IDWriteFontFace4.GetGlyphImageFormats)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_glyph_image_formats">DWRITE_GLYPH_IMAGE_FORMATS</a></b>
     * 
     * Returns all the glyph image formats supported by the entire font.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface4-getglyphimageformats
     */
    GetGlyphImageFormats1() {
        result := ComCall(50, this, "int")
        return result
    }

    /**
     * Gets a pointer to the glyph data based on the desired image format.
     * @remarks
     * The glyphDataContext must be released via <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface4-releaseglyphimagedata">ReleaseGlyphImageData</a> when done if the data is not empty,
     *      similar to <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfilestream-readfilefragment">IDWriteFontFileStream::ReadFileFragment</a> 
     *        and <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfilestream-releasefilefragment">IDWriteFontFileStream::ReleaseFileFragment</a>.
     *      The data pointer is valid so long as the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a> exists and <b>ReleaseGlyphImageData</b> has not
     *      been called.
     *      
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_glyph_image_data">DWRITE_GLYPH_IMAGE_DATA::uniqueDataId</a> is valuable for caching purposes so that if the same
     *      resource is returned more than once, an existing resource can be quickly retrieved rather than
     *      needing to reparse or decompress the data.
     *      
     * 
     * The function only returns SVG or raster data - requesting TrueType/CFF/COLR data returns
     *      DWRITE_E_INVALIDARG. Those must be drawn via DrawGlyphRun or queried using GetGlyphOutline instead.
     *      Exactly one format may be requested or else the function returns DWRITE_E_INVALIDARG.
     *      If the glyph does not have that format, the call is not an error, but the function returns empty data.
     * @param {Integer} glyphId Type: <b>UINT16</b>
     * 
     * The ID of the glyph to retrieve image data for.
     * @param {Integer} pixelsPerEm Type: <b>UINT32</b>
     * 
     * Requested pixels per em.
     * @param {Integer} glyphImageFormat Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_glyph_image_formats">DWRITE_GLYPH_IMAGE_FORMATS</a></b>
     * 
     * Specifies which formats are supported in the font.
     * @param {Pointer<DWRITE_GLYPH_IMAGE_DATA>} _glyphData 
     * @param {Pointer<Pointer<Void>>} glyphDataContext Type: <b>void**</b>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface4-getglyphimagedata
     */
    GetGlyphImageData(glyphId, pixelsPerEm, glyphImageFormat, _glyphData, glyphDataContext) {
        glyphDataContextMarshal := glyphDataContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(51, this, "ushort", glyphId, "uint", pixelsPerEm, "int", glyphImageFormat, "ptr", _glyphData, glyphDataContextMarshal, glyphDataContext, "HRESULT")
        return result
    }

    /**
     * Releases the table data obtained from ReadGlyphData.
     * @param {Pointer<Void>} glyphDataContext Type: <b>void*</b>
     * 
     * Opaque context from ReadGlyphData.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface4-releaseglyphimagedata
     */
    ReleaseGlyphImageData(glyphDataContext) {
        glyphDataContextMarshal := glyphDataContext is VarRef ? "ptr" : "ptr"

        ComCall(52, this, glyphDataContextMarshal, glyphDataContext)
    }
}
