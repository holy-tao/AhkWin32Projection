#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFace3.ahk

/**
 * Contains font face type, appropriate file references, and face identification data.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontface4
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
     * Gets all the glyph image formats supported by the entire font.
     * @param {Integer} glyphId 
     * @param {Integer} pixelsPerEmFirst 
     * @param {Integer} pixelsPerEmLast 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface4-getglyphimageformats
     */
    GetGlyphImageFormats(glyphId, pixelsPerEmFirst, pixelsPerEmLast) {
        result := ComCall(49, this, "ushort", glyphId, "uint", pixelsPerEmFirst, "uint", pixelsPerEmLast, "int*", &glyphImageFormats := 0, "HRESULT")
        return glyphImageFormats
    }

    /**
     * Gets all the glyph image formats supported by the entire font.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dcommon/ne-dcommon-dwrite_glyph_image_formats">DWRITE_GLYPH_IMAGE_FORMATS</a></b>
     * 
     * Returns all the glyph image formats supported by the entire font.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface4-getglyphimageformats
     */
    GetGlyphImageFormats1() {
        result := ComCall(50, this, "int")
        return result
    }

    /**
     * Gets a pointer to the glyph data based on the desired image format.
     * @param {Integer} glyphId Type: <b>UINT16</b>
     * 
     * The ID of the glyph to retrieve image data for.
     * @param {Integer} pixelsPerEm Type: <b>UINT32</b>
     * 
     * Requested pixels per em.
     * @param {Integer} glyphImageFormat Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_glyph_image_formats">DWRITE_GLYPH_IMAGE_FORMATS</a></b>
     * 
     * Specifies which formats are supported in the font.
     * @param {Pointer<DWRITE_GLYPH_IMAGE_DATA>} glyphData Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_glyph_image_data">DWRITE_GLYPH_IMAGE_DATA</a>*</b>
     * 
     * On return contains data for a glyph.
     * @param {Pointer<Pointer<Void>>} glyphDataContext Type: <b>void**</b>
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface4-getglyphimagedata
     */
    GetGlyphImageData(glyphId, pixelsPerEm, glyphImageFormat, glyphData, glyphDataContext) {
        glyphDataContextMarshal := glyphDataContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(51, this, "ushort", glyphId, "uint", pixelsPerEm, "int", glyphImageFormat, "ptr", glyphData, glyphDataContextMarshal, glyphDataContext, "HRESULT")
        return result
    }

    /**
     * Releases the table data obtained from ReadGlyphData.
     * @param {Pointer<Void>} glyphDataContext Type: <b>void*</b>
     * 
     * Opaque context from ReadGlyphData.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface4-releaseglyphimagedata
     */
    ReleaseGlyphImageData(glyphDataContext) {
        glyphDataContextMarshal := glyphDataContext is VarRef ? "ptr" : "ptr"

        ComCall(52, this, glyphDataContextMarshal, glyphDataContext)
    }
}
