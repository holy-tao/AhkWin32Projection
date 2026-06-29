#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_GLYPH_IMAGE_DATA.ahk" { DWRITE_GLYPH_IMAGE_DATA }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteFontFace3.ahk" { IDWriteFontFace3 }
#Import ".\DWRITE_GLYPH_IMAGE_FORMATS.ahk" { DWRITE_GLYPH_IMAGE_FORMATS }

/**
 * Contains font face type, appropriate file references, and face identification data. (IDWriteFontFace4)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontface4
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontFace4 extends IDWriteFontFace3 {
    /**
     * The interface identifier for IDWriteFontFace4
     * @type {Guid}
     */
    static IID := Guid("{27f2a904-4eb8-441d-9678-0563f53e3e2f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontFace4 interfaces
    */
    struct Vtbl extends IDWriteFontFace3.Vtbl {
        GetGlyphImageFormats  : IntPtr
        GetGlyphImageFormats1 : IntPtr
        GetGlyphImageData     : IntPtr
        ReleaseGlyphImageData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontFace4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets all the glyph image formats supported by the entire font. (IDWriteFontFace4.GetGlyphImageFormats)
     * @param {Integer} glyphId 
     * @param {Integer} pixelsPerEmFirst 
     * @param {Integer} pixelsPerEmLast 
     * @returns {DWRITE_GLYPH_IMAGE_FORMATS} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface4-getglyphimageformats
     */
    GetGlyphImageFormats(glyphId, pixelsPerEmFirst, pixelsPerEmLast) {
        result := ComCall(49, this, "ushort", glyphId, "uint", pixelsPerEmFirst, "uint", pixelsPerEmLast, "int*", &glyphImageFormats := 0, "HRESULT")
        return glyphImageFormats
    }

    /**
     * Gets all the glyph image formats supported by the entire font. (IDWriteFontFace4.GetGlyphImageFormats)
     * @returns {DWRITE_GLYPH_IMAGE_FORMATS} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_glyph_image_formats">DWRITE_GLYPH_IMAGE_FORMATS</a></b>
     * 
     * Returns all the glyph image formats supported by the entire font.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface4-getglyphimageformats
     */
    GetGlyphImageFormats1() {
        result := ComCall(50, this, DWRITE_GLYPH_IMAGE_FORMATS)
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
     * @param {DWRITE_GLYPH_IMAGE_FORMATS} glyphImageFormat Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_glyph_image_formats">DWRITE_GLYPH_IMAGE_FORMATS</a></b>
     * 
     * Specifies which formats are supported in the font.
     * @param {Pointer<DWRITE_GLYPH_IMAGE_DATA>} _glyphData Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_glyph_image_data">DWRITE_GLYPH_IMAGE_DATA</a>*</b>
     * 
     * On return contains data for a glyph.
     * @param {Pointer<Pointer<Void>>} glyphDataContext Type: <b>void**</b>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface4-getglyphimagedata
     */
    GetGlyphImageData(glyphId, pixelsPerEm, glyphImageFormat, _glyphData, glyphDataContext) {
        glyphDataContextMarshal := glyphDataContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(51, this, "ushort", glyphId, "uint", pixelsPerEm, DWRITE_GLYPH_IMAGE_FORMATS, glyphImageFormat, DWRITE_GLYPH_IMAGE_DATA.Ptr, _glyphData, glyphDataContextMarshal, glyphDataContext, "HRESULT")
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

    Query(iid) {
        if (IDWriteFontFace4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGlyphImageFormats := CallbackCreate(GetMethod(implObj, "GetGlyphImageFormats"), flags, 5)
        this.vtbl.GetGlyphImageFormats1 := CallbackCreate(GetMethod(implObj, "GetGlyphImageFormats1"), flags, 1)
        this.vtbl.GetGlyphImageData := CallbackCreate(GetMethod(implObj, "GetGlyphImageData"), flags, 6)
        this.vtbl.ReleaseGlyphImageData := CallbackCreate(GetMethod(implObj, "ReleaseGlyphImageData"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGlyphImageFormats)
        CallbackFree(this.vtbl.GetGlyphImageFormats1)
        CallbackFree(this.vtbl.GetGlyphImageData)
        CallbackFree(this.vtbl.ReleaseGlyphImageData)
    }
}
