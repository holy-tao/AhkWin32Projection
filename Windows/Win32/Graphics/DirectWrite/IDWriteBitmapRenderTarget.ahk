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
     * Draws a run of glyphs to a bitmap target at the specified position.
     * @param {Float} baselineOriginX Type: <b>FLOAT</b>
     * 
     * The horizontal position of the baseline origin, in DIPs, relative to the upper-left corner of the DIB.
     * @param {Float} baselineOriginY Type: <b>FLOAT</b>
     * 
     * The vertical position of the baseline origin, in DIPs, relative to the upper-left corner of the DIB.
     * @param {Integer} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * The measuring method for glyphs in the run, used with the other properties to determine the rendering mode.
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a>*</b>
     * 
     * The structure containing the properties of the glyph run.
     * @param {IDWriteRenderingParams} renderingParams Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a>*</b>
     * 
     * The object that controls rendering behavior.
     * @param {COLORREF} textColor Type: <b>COLORREF</b>
     * 
     * The foreground color of the text.
     * @returns {RECT} Type: <b>RECT*</b>
     * 
     * The optional rectangle that receives the bounding box (in pixels not DIPs) of all the pixels affected by 
     *      drawing the glyph run. The black box rectangle may extend beyond the dimensions of the bitmap.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritebitmaprendertarget-drawglyphrun
     */
    DrawGlyphRun(baselineOriginX, baselineOriginY, measuringMode, glyphRun, renderingParams, textColor) {
        blackBoxRect := RECT()
        result := ComCall(3, this, "float", baselineOriginX, "float", baselineOriginY, "int", measuringMode, "ptr", glyphRun, "ptr", renderingParams, "uint", textColor, "ptr", blackBoxRect, "HRESULT")
        return blackBoxRect
    }

    /**
     * Gets a handle to the memory device context.
     * @returns {HDC} Type: <b>HDC</b>
     * 
     * Returns a device context handle to the memory device context.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritebitmaprendertarget-getmemorydc
     */
    GetMemoryDC() {
        result := ComCall(4, this, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * Gets the number of bitmap pixels per DIP.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * The number of bitmap pixels per DIP.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritebitmaprendertarget-getpixelsperdip
     */
    GetPixelsPerDip() {
        result := ComCall(5, this, "float")
        return result
    }

    /**
     * Sets the number of bitmap pixels per DIP (device-independent pixel). A DIP is 1/96 inch, so this value is the number if pixels per inch divided by 96.
     * @param {Float} pixelsPerDip Type: <b>FLOAT</b>
     * 
     * A value that specifies the number of pixels per DIP.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritebitmaprendertarget-setpixelsperdip
     */
    SetPixelsPerDip(pixelsPerDip) {
        result := ComCall(6, this, "float", pixelsPerDip, "HRESULT")
        return result
    }

    /**
     * Gets the transform that maps abstract coordinates to DIPs. By default this is the identity transform. Note that this is unrelated to the world transform of the underlying device context.
     * @returns {DWRITE_MATRIX} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a>*</b>
     * 
     * When this method returns, contains a transform matrix.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritebitmaprendertarget-getcurrenttransform
     */
    GetCurrentTransform() {
        transform := DWRITE_MATRIX()
        result := ComCall(7, this, "ptr", transform, "HRESULT")
        return transform
    }

    /**
     * Sets the transform that maps abstract coordinate to DIPs (device-independent pixel). This does not affect the world transform of the underlying device context.
     * @param {Pointer<DWRITE_MATRIX>} transform Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a>*</b>
     * 
     *  Specifies the new transform. This parameter can be <b>NULL</b>, in which
     *      case the identity transform is implied.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritebitmaprendertarget-setcurrenttransform
     */
    SetCurrentTransform(transform) {
        result := ComCall(8, this, "ptr", transform, "HRESULT")
        return result
    }

    /**
     * Gets the dimensions of the target bitmap.
     * @returns {SIZE} Type: <b>SIZE*</b>
     * 
     * Returns  the width and height of the bitmap in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritebitmaprendertarget-getsize
     */
    GetSize() {
        size := SIZE()
        result := ComCall(9, this, "ptr", size, "HRESULT")
        return size
    }

    /**
     * Resizes the bitmap.
     * @param {Integer} width Type: <b>UINT32</b>
     * 
     * The new bitmap width, in pixels.
     * @param {Integer} height Type: <b>UINT32</b>
     * 
     * The new bitmap height, in pixels.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritebitmaprendertarget-resize
     */
    Resize(width, height) {
        result := ComCall(10, this, "uint", width, "uint", height, "HRESULT")
        return result
    }
}
