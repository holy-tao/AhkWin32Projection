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
 * @see https://learn.microsoft.com/windows/win32/api//content/dwrite/nn-dwrite-idwritebitmaprendertarget
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
     * @remarks
     * You can use the <b>IDWriteBitmapRenderTarget::DrawGlyphRun</b> to render to a bitmap from a custom text renderer that you implement.  The custom text renderer should call this method from within the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextrenderer-drawglyphrun">IDWriteTextRenderer::DrawGlyphRun</a> callback method as shown in the following code.
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
     * The <i>baselineOriginX</i>, <i>baslineOriginY</i>, <i>measuringMethod</i>, and <i>glyphRun</i> parameters are provided (as arguments) when the callback method is invoked.  The <i>renderingParams</i>, <i>textColor</i> and <i>blackBoxRect</i> are not.
     * 
     * Default rendering params can be retrieved by using the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createmonitorrenderingparams">IDWriteFactory::CreateMonitorRenderingParams</a> method.
     * @param {Float} baselineOriginX Type: <b>FLOAT</b>
     * 
     * The horizontal position of the baseline origin, in DIPs, relative to the upper-left corner of the DIB.
     * @param {Float} baselineOriginY Type: <b>FLOAT</b>
     * 
     * The vertical position of the baseline origin, in DIPs, relative to the upper-left corner of the DIB.
     * @param {Integer} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * The measuring method for glyphs in the run, used with the other properties to determine the rendering mode.
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun_ Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a>*</b>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite/nf-dwrite-idwritebitmaprendertarget-drawglyphrun
     */
    DrawGlyphRun(baselineOriginX, baselineOriginY, measuringMode, glyphRun_, renderingParams, textColor) {
        blackBoxRect := RECT()
        result := ComCall(3, this, "float", baselineOriginX, "float", baselineOriginY, "int", measuringMode, "ptr", glyphRun_, "ptr", renderingParams, "uint", textColor, "ptr", blackBoxRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return blackBoxRect
    }

    /**
     * Gets a handle to the memory device context.
     * @remarks
     * An application can use the device context to draw using GDI functions. An application can obtain the bitmap handle
     *      (HBITMAP) by calling <a href="https://docs.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getcurrentobject">GetCurrentObject</a>. An application that wants information about the underlying bitmap, including
     *      a pointer to the pixel data, can call <a href="https://docs.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getobject">GetObject</a> to fill in a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-dibsection">DIBSECTION</a> structure. The bitmap is always a 32-bit 
     *      top-down DIB.
     * 
     * Note that this method takes no parameters and returns an HDC variable, not an HRESULT.
     * 
     * 
     * ```cpp
     * memoryHdc = g_pBitmapRenderTarget->GetMemoryDC();
     * 
     * ```
     * 
     * 
     * The HDC returned here is still owned by the bitmap render target object and should not be released or deleted by the client.
     * @returns {HDC} Type: <b>HDC</b>
     * 
     * Returns a device context handle to the memory device context.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite/nf-dwrite-idwritebitmaprendertarget-getmemorydc
     */
    GetMemoryDC() {
        result := ComCall(4, this, "ptr")
        resultHandle := HDC({Value: result}, True)
        return resultHandle
    }

    /**
     * Gets the number of bitmap pixels per DIP.
     * @remarks
     * A DIP (device-independent pixel) is 1/96 inch. Therefore, this value is the number
     *      if pixels per inch divided by 96.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * The number of bitmap pixels per DIP.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite/nf-dwrite-idwritebitmaprendertarget-getpixelsperdip
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite/nf-dwrite-idwritebitmaprendertarget-setpixelsperdip
     */
    SetPixelsPerDip(pixelsPerDip) {
        result := ComCall(6, this, "float", pixelsPerDip, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the transform that maps abstract coordinates to DIPs. By default this is the identity transform. Note that this is unrelated to the world transform of the underlying device context.
     * @returns {DWRITE_MATRIX} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a>*</b>
     * 
     * When this method returns, contains a transform matrix.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite/nf-dwrite-idwritebitmaprendertarget-getcurrenttransform
     */
    GetCurrentTransform() {
        transform := DWRITE_MATRIX()
        result := ComCall(7, this, "ptr", transform, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite/nf-dwrite-idwritebitmaprendertarget-setcurrenttransform
     */
    SetCurrentTransform(transform) {
        result := ComCall(8, this, "ptr", transform, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the dimensions of the target bitmap.
     * @returns {SIZE} 
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite/nf-dwrite-idwritebitmaprendertarget-getsize
     */
    GetSize() {
        size_ := SIZE()
        result := ComCall(9, this, "ptr", size_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return size_
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite/nf-dwrite-idwritebitmaprendertarget-resize
     */
    Resize(width, height) {
        result := ComCall(10, this, "uint", width, "uint", height, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
