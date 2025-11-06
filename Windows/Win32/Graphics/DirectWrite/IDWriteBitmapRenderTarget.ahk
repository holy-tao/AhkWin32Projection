#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\Gdi\HDC.ahk
#Include .\DWRITE_MATRIX.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Encapsulates a 32-bit device independent bitmap and device context, which can be used for rendering glyphs.
 * @remarks
 * 
  * You create an <b>IDWriteBitmapRenderTarget</b> by using the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritegdiinterop-createbitmaprendertarget">IDWriteGdiInterop::CreateBitmapRenderTarget</a> method, as shown in the following code.
  * 
  * 
  * ```cpp
  * if (SUCCEEDED(hr))
  * {
  *     hr = g_pGdiInterop->CreateBitmapRenderTarget(hdc, r.right, r.bottom, &g_pBitmapRenderTarget);
  * }
  * 
  * ```
  * 
  * 
  * 
  * <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritegdiinterop-createbitmaprendertarget">IDWriteGdiInterop::CreateBitmapRenderTarget</a> takes a handle to a DC and the desired width and height.  In the above example, the width and height given are the size of the window rect.
  * 
  * <h3><a id="Rendering"></a><a id="rendering"></a><a id="RENDERING"></a>Rendering</h3>
  * One way to use a  <b>IDWriteBitmapRenderTarget</b>, for rendering to a bitmap, is to implement a custom renderer interface derived from the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextrenderer">IDWriteTextRenderer</a> interface.  In your implementation of  the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextrenderer-drawglyphrun">DrawGlyphRun</a> method of your custom renderer, call the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritebitmaprendertarget-drawglyphrun">IDWriteBitmapRenderTarget::DrawGlyphRun</a> method to draw the glyphs as shown in the following code.
  * 
  * 
  * ```cpp
  * STDMETHODIMP GdiTextRenderer::DrawGlyphRun(
  *     __maybenull void* clientDrawingContext,
  *     FLOAT baselineOriginX,
  *     FLOAT baselineOriginY,
  *     DWRITE_MEASURING_MODE measuringMode,
  *     __in DWRITE_GLYPH_RUN const* glyphRun,
  *     __in DWRITE_GLYPH_RUN_DESCRIPTION const* glyphRunDescription,
  *     IUnknown* clientDrawingEffect
  *     )
  * {
  *     HRESULT hr = S_OK;
  * 
  *     // Pass on the drawing call to the render target to do the real work.
  *     RECT dirtyRect = {0};
  * 
  *     hr = pRenderTarget_->DrawGlyphRun(
  *         baselineOriginX,
  *         baselineOriginY,
  *         measuringMode,
  *         glyphRun,
  *         pRenderingParams_,
  *         RGB(0,200,255),
  *         &dirtyRect
  *         );
  *     
  * 
  *     return hr;
  * }
  * 
  * ```
  * 
  * 
  * The <b>IDWriteBitmapRenderTarget</b> encapsulates and renders to a bitmap in memory.  The  <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritebitmaprendertarget-getmemorydc">GetMemoryDC</a> function returns a handle to the device context of this bitmap.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritebitmaprendertarget
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteBitmapRenderTarget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteBitmapRenderTarget
     * @type {Guid}
     */
    static IID => Guid("{5e5a32a3-8dff-4773-9ff6-0696eab77267}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DrawGlyphRun", "GetMemoryDC", "GetPixelsPerDip", "SetPixelsPerDip", "GetCurrentTransform", "SetCurrentTransform", "GetSize", "Resize"]

    /**
     * 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {Integer} measuringMode 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {IDWriteRenderingParams} renderingParams 
     * @param {COLORREF} textColor 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritebitmaprendertarget-drawglyphrun
     */
    DrawGlyphRun(baselineOriginX, baselineOriginY, measuringMode, glyphRun, renderingParams, textColor) {
        blackBoxRect := RECT()
        result := ComCall(3, this, "float", baselineOriginX, "float", baselineOriginY, "int", measuringMode, "ptr", glyphRun, "ptr", renderingParams, "uint", textColor, "ptr", blackBoxRect, "HRESULT")
        return blackBoxRect
    }

    /**
     * 
     * @returns {HDC} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritebitmaprendertarget-getmemorydc
     */
    GetMemoryDC() {
        result := ComCall(4, this, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritebitmaprendertarget-getpixelsperdip
     */
    GetPixelsPerDip() {
        result := ComCall(5, this, "float")
        return result
    }

    /**
     * 
     * @param {Float} pixelsPerDip 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritebitmaprendertarget-setpixelsperdip
     */
    SetPixelsPerDip(pixelsPerDip) {
        result := ComCall(6, this, "float", pixelsPerDip, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DWRITE_MATRIX} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritebitmaprendertarget-getcurrenttransform
     */
    GetCurrentTransform() {
        transform := DWRITE_MATRIX()
        result := ComCall(7, this, "ptr", transform, "HRESULT")
        return transform
    }

    /**
     * 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritebitmaprendertarget-setcurrenttransform
     */
    SetCurrentTransform(transform) {
        result := ComCall(8, this, "ptr", transform, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SIZE} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritebitmaprendertarget-getsize
     */
    GetSize() {
        size := SIZE()
        result := ComCall(9, this, "ptr", size, "HRESULT")
        return size
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritebitmaprendertarget-resize
     */
    Resize(width, height) {
        result := ComCall(10, this, "uint", width, "uint", height, "HRESULT")
        return result
    }
}
