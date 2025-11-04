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
     * 
     * @param {Integer} glyphId 
     * @param {Integer} pixelsPerEmFirst 
     * @param {Integer} pixelsPerEmLast 
     * @param {Pointer<Integer>} glyphImageFormats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface4-getglyphimageformats
     */
    GetGlyphImageFormats(glyphId, pixelsPerEmFirst, pixelsPerEmLast, glyphImageFormats) {
        glyphImageFormatsMarshal := glyphImageFormats is VarRef ? "int*" : "ptr"

        result := ComCall(49, this, "ushort", glyphId, "uint", pixelsPerEmFirst, "uint", pixelsPerEmLast, glyphImageFormatsMarshal, glyphImageFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface4-getglyphimageformats
     */
    GetGlyphImageFormats1() {
        result := ComCall(50, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} glyphId 
     * @param {Integer} pixelsPerEm 
     * @param {Integer} glyphImageFormat 
     * @param {Pointer<DWRITE_GLYPH_IMAGE_DATA>} glyphData 
     * @param {Pointer<Pointer<Void>>} glyphDataContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface4-getglyphimagedata
     */
    GetGlyphImageData(glyphId, pixelsPerEm, glyphImageFormat, glyphData, glyphDataContext) {
        glyphDataContextMarshal := glyphDataContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(51, this, "ushort", glyphId, "uint", pixelsPerEm, "int", glyphImageFormat, "ptr", glyphData, glyphDataContextMarshal, glyphDataContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} glyphDataContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface4-releaseglyphimagedata
     */
    ReleaseGlyphImageData(glyphDataContext) {
        glyphDataContextMarshal := glyphDataContext is VarRef ? "ptr" : "ptr"

        ComCall(52, this, glyphDataContextMarshal, glyphDataContext)
    }
}
