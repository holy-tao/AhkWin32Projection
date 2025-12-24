#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteBitmapRenderTarget.ahk

/**
 * Encapsulates a 32-bit device independent bitmap and device context, which you can use for rendering glyphs.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nn-dwrite_1-idwritebitmaprendertarget1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteBitmapRenderTarget1 extends IDWriteBitmapRenderTarget{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteBitmapRenderTarget1
     * @type {Guid}
     */
    static IID => Guid("{791e8298-3ef3-4230-9880-c9bdecc42064}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTextAntialiasMode", "SetTextAntialiasMode"]

    /**
     * Gets the current text antialiasing mode of the bitmap render target.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_text_antialias_mode">DWRITE_TEXT_ANTIALIAS_MODE</a></b>
     * 
     * Returns a <a href="/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_text_antialias_mode">DWRITE_TEXT_ANTIALIAS_MODE</a>-typed value that specifies the antialiasing mode.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritebitmaprendertarget1-gettextantialiasmode
     */
    GetTextAntialiasMode() {
        result := ComCall(11, this, "int")
        return result
    }

    /**
     * Sets the current text antialiasing mode of the bitmap render target.
     * @param {Integer} antialiasMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_text_antialias_mode">DWRITE_TEXT_ANTIALIAS_MODE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_text_antialias_mode">DWRITE_TEXT_ANTIALIAS_MODE</a>-typed value that specifies the antialiasing mode.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or E_INVALIDARG if the argument is not valid.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritebitmaprendertarget1-settextantialiasmode
     */
    SetTextAntialiasMode(antialiasMode) {
        result := ComCall(12, this, "int", antialiasMode, "HRESULT")
        return result
    }
}
