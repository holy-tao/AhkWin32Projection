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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritebitmaprendertarget1-gettextantialiasmode
     */
    GetTextAntialiasMode() {
        result := ComCall(11, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} antialiasMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritebitmaprendertarget1-settextantialiasmode
     */
    SetTextAntialiasMode(antialiasMode) {
        result := ComCall(12, this, "int", antialiasMode, "HRESULT")
        return result
    }
}
