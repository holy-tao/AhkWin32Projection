#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides interoperability with GDI, such as methods to convert a font face to a LOGFONT structure, or to convert a GDI font description into a font face. It is also used to create bitmap render target objects.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritegdiinterop
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteGdiInterop extends IUnknown{
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
     * 
     * @param {Pointer<LOGFONTW>} logFont 
     * @param {Pointer<IDWriteFont>} font 
     * @returns {HRESULT} 
     */
    CreateFontFromLOGFONT(logFont, font) {
        result := ComCall(3, this, "ptr", logFont, "ptr", font, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFont>} font 
     * @param {Pointer<LOGFONTW>} logFont 
     * @param {Pointer<BOOL>} isSystemFont 
     * @returns {HRESULT} 
     */
    ConvertFontToLOGFONT(font, logFont, isSystemFont) {
        result := ComCall(4, this, "ptr", font, "ptr", logFont, "ptr", isSystemFont, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFace>} font 
     * @param {Pointer<LOGFONTW>} logFont 
     * @returns {HRESULT} 
     */
    ConvertFontFaceToLOGFONT(font, logFont) {
        result := ComCall(5, this, "ptr", font, "ptr", logFont, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HDC} hdc 
     * @param {Pointer<IDWriteFontFace>} fontFace 
     * @returns {HRESULT} 
     */
    CreateFontFaceFromHdc(hdc, fontFace) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(6, this, "ptr", hdc, "ptr", fontFace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HDC} hdc 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Pointer<IDWriteBitmapRenderTarget>} renderTarget 
     * @returns {HRESULT} 
     */
    CreateBitmapRenderTarget(hdc, width, height, renderTarget) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(7, this, "ptr", hdc, "uint", width, "uint", height, "ptr", renderTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
