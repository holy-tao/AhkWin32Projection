#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFont.ahk
#Include ..\Gdi\LOGFONTW.ahk
#Include .\IDWriteFontFace.ahk
#Include .\IDWriteBitmapRenderTarget.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides interoperability with GDI, such as methods to convert a font face to a LOGFONT structure, or to convert a GDI font description into a font face. It is also used to create bitmap render target objects.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritegdiinterop
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteGdiInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteGdiInterop
     * @type {Guid}
     */
    static IID => Guid("{1edd9491-9853-4299-898f-6432983b6f3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFontFromLOGFONT", "ConvertFontToLOGFONT", "ConvertFontFaceToLOGFONT", "CreateFontFaceFromHdc", "CreateBitmapRenderTarget"]

    /**
     * Creates a font object that matches the properties specified by the LOGFONT structure.
     * @param {Pointer<LOGFONTW>} logFont Type: <b>const LOGFONTW*</b>
     * 
     * A structure containing a GDI-compatible font description.
     * @returns {IDWriteFont} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefont">IDWriteFont</a>**</b>
     * 
     * When this method returns, contains an address of a  pointer to a newly created <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefont">IDWriteFont</a>  object if successful; otherwise, <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritegdiinterop-createfontfromlogfont
     */
    CreateFontFromLOGFONT(logFont) {
        result := ComCall(3, this, "ptr", logFont, "ptr*", &font := 0, "HRESULT")
        return IDWriteFont(font)
    }

    /**
     * Initializes a LOGFONT structure based on the GDI-compatible properties of the specified font.
     * @param {IDWriteFont} font Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefont">IDWriteFont</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefont">IDWriteFont</a> object to be converted into a GDI-compatible <b>LOGFONT</b> structure.
     * @param {Pointer<LOGFONTW>} logFont Type: <b>LOGFONTW*</b>
     * 
     * When this method returns, contains a structure that receives a GDI-compatible font description.
     * @param {Pointer<BOOL>} isSystemFont Type: <b>BOOL*</b>
     * 
     * When this method returns, contains <b>TRUE</b> if the specified font object is part of the system font collection; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritegdiinterop-convertfonttologfont
     */
    ConvertFontToLOGFONT(font, logFont, isSystemFont) {
        isSystemFontMarshal := isSystemFont is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", font, "ptr", logFont, isSystemFontMarshal, isSystemFont, "HRESULT")
        return result
    }

    /**
     * Initializes a LOGFONT structure based on the GDI-compatible properties of the specified font.
     * @param {IDWriteFontFace} font Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a> object to be converted into a GDI-compatible LOGFONT structure.
     * @returns {LOGFONTW} Type: <b>LOGFONTW*</b>
     * 
     * When this method returns, contains a pointer to a structure that receives a GDI-compatible font description.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritegdiinterop-convertfontfacetologfont
     */
    ConvertFontFaceToLOGFONT(font) {
        logFont := LOGFONTW()
        result := ComCall(5, this, "ptr", font, "ptr", logFont, "HRESULT")
        return logFont
    }

    /**
     * Creates an IDWriteFontFace object that corresponds to the currently selected HFONT of the specified HDC.
     * @param {HDC} hdc Type: <b>HDC</b>
     * 
     * A handle to a device context into which a font has been selected. It is assumed that the client
     *      has already performed font mapping and that the font selected into the device context is the actual font to be used 
     *      for rendering glyphs.
     * @returns {IDWriteFontFace} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a>**</b>
     * 
     * Contains an address of a pointer to  the newly created font face object, or <b>NULL</b> in case of failure. The font face returned is guaranteed to reference the same physical typeface that would be used for drawing glyphs (but not necessarily characters) using ExtTextOut.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritegdiinterop-createfontfacefromhdc
     */
    CreateFontFaceFromHdc(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(6, this, "ptr", hdc, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace(fontFace)
    }

    /**
     * Creates an object that encapsulates a bitmap and memory DC (device context) which can be used for rendering glyphs.
     * @param {HDC} hdc Type: <b>HDC</b>
     * 
     * A handle to the optional device context used to create a compatible memory DC (device context).
     * @param {Integer} width Type: <b>UINT32</b>
     * 
     * The width of the bitmap render target.
     * @param {Integer} height Type: <b>UINT32</b>
     * 
     * The height of the bitmap render target.
     * @returns {IDWriteBitmapRenderTarget} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritebitmaprendertarget">IDWriteBitmapRenderTarget</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to the newly created <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritebitmaprendertarget">IDWriteBitmapRenderTarget</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritegdiinterop-createbitmaprendertarget
     */
    CreateBitmapRenderTarget(hdc, width, height) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(7, this, "ptr", hdc, "uint", width, "uint", height, "ptr*", &renderTarget := 0, "HRESULT")
        return IDWriteBitmapRenderTarget(renderTarget)
    }
}
