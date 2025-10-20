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
     * 
     * @param {Integer} glyphId 
     * @param {Integer} pixelsPerEmFirst 
     * @param {Integer} pixelsPerEmLast 
     * @param {Pointer<Int32>} glyphImageFormats 
     * @returns {HRESULT} 
     */
    GetGlyphImageFormats(glyphId, pixelsPerEmFirst, pixelsPerEmLast, glyphImageFormats) {
        result := ComCall(49, this, "ushort", glyphId, "uint", pixelsPerEmFirst, "uint", pixelsPerEmLast, "int*", glyphImageFormats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetGlyphImageFormats() {
        result := ComCall(50, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} glyphId 
     * @param {Integer} pixelsPerEm 
     * @param {Integer} glyphImageFormat 
     * @param {Pointer<DWRITE_GLYPH_IMAGE_DATA>} glyphData 
     * @param {Pointer<Void>} glyphDataContext 
     * @returns {HRESULT} 
     */
    GetGlyphImageData(glyphId, pixelsPerEm, glyphImageFormat, glyphData, glyphDataContext) {
        result := ComCall(51, this, "ushort", glyphId, "uint", pixelsPerEm, "int", glyphImageFormat, "ptr", glyphData, "ptr", glyphDataContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} glyphDataContext 
     * @returns {String} Nothing - always returns an empty string
     */
    ReleaseGlyphImageData(glyphDataContext) {
        ComCall(52, this, "ptr", glyphDataContext)
        return result
    }
}
