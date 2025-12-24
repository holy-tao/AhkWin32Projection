#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Image.ahk

/**
 * Represents a bitmap that has been bound to an ID2D1RenderTarget.
 * @remarks
 * 
 * <h3><a id="Creating_ID2D1Bitmap_Objects"></a><a id="creating_id2d1bitmap_objects"></a><a id="CREATING_ID2D1BITMAP_OBJECTS"></a>Creating ID2D1Bitmap Objects</h3>
 * To create a bitmap, use one of the following methods of the render target on which the bitmap will be drawn: <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createbitmap(d2d1_size_u_constd2d1_bitmap_properties__id2d1bitmap)">ID2D1RenderTarget::CreateBitmap</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createbitmapfromwicbitmap">ID2D1RenderTarget::CreateBitmapFromWicBitmap</a>
 * </li>
 * </ul>
 * 
 * 
 * For information about the pixel formats supported by Direct2D bitmaps, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/supported-pixel-formats-and-alpha-modes">Supported Pixel Formats and Alpha Modes</a>.
 * 
 * An <b>ID2D1Bitmap</b> is a device-dependent resource: your application should create bitmaps after it initializes the render target with which the bitmap will be used, and recreate the bitmap whenever the render target needs recreated. (For more information about resources, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.)
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1bitmap
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Bitmap extends ID2D1Image{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Bitmap
     * @type {Guid}
     */
    static IID => Guid("{a2296057-ea42-4099-983b-539fb6505426}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSize", "GetPixelSize", "GetPixelFormat", "GetDpi", "CopyFromBitmap", "CopyFromRenderTarget", "CopyFromMemory"]

    /**
     * Returns the size, in device-independent pixels (DIPs), of the bitmap.
     * @returns {D2D_SIZE_F} Type: <b><a href="/windows/win32/Direct2D/d2d1-size-f">D2D1_SIZE_F</a></b>
     * 
     * The size, in DIPs, of the bitmap.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1bitmap-getsize
     */
    GetSize() {
        result := ComCall(4, this, "ptr")
        return result
    }

    /**
     * Returns the size, in device-dependent units (pixels), of the bitmap.
     * @returns {D2D_SIZE_U} Type: <b><a href="/windows/win32/Direct2D/d2d1-size-u">D2D1_SIZE_U</a></b>
     * 
     * The size, in pixels, of the bitmap.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1bitmap-getpixelsize
     */
    GetPixelSize() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * Retrieves the pixel format and alpha mode of the bitmap.
     * @returns {D2D1_PIXEL_FORMAT} Type: <b><a href="/windows/win32/api/dcommon/ns-dcommon-d2d1_pixel_format">D2D1_PIXEL_FORMAT</a></b>
     * 
     * The pixel format and alpha mode of the bitmap.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1bitmap-getpixelformat
     */
    GetPixelFormat() {
        result := ComCall(6, this, "ptr")
        return result
    }

    /**
     * Return the dots per inch (DPI) of the bitmap.
     * @param {Pointer<Float>} dpiX Type: <b>FLOAT*</b>
     * 
     * The horizontal DPI of the image. You must allocate storage for this parameter.
     * @param {Pointer<Float>} dpiY Type: <b>FLOAT*</b>
     * 
     * The vertical DPI of the image.  You must allocate storage for this parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1bitmap-getdpi
     */
    GetDpi(dpiX, dpiY) {
        dpiXMarshal := dpiX is VarRef ? "float*" : "ptr"
        dpiYMarshal := dpiY is VarRef ? "float*" : "ptr"

        ComCall(7, this, dpiXMarshal, dpiX, dpiYMarshal, dpiY)
    }

    /**
     * Copies the specified region from the specified bitmap into the current bitmap.
     * @param {Pointer<D2D_POINT_2U>} destPoint Type: <b>const <a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2u">D2D1_POINT_2U</a>*</b>
     * 
     * In the current bitmap, the upper-left corner of the area to which the region specified by <i>srcRect</i> is copied.
     * @param {ID2D1Bitmap} bitmap Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>*</b>
     * 
     * The bitmap to copy from.
     * @param {Pointer<D2D_RECT_U>} srcRect Type: <b>const <a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-rect-u">D2D1_RECT_U</a>*</b>
     * 
     * The area of <i>bitmap</i> to copy.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1bitmap-copyfrombitmap
     */
    CopyFromBitmap(destPoint, bitmap, srcRect) {
        result := ComCall(8, this, "ptr", destPoint, "ptr", bitmap, "ptr", srcRect, "HRESULT")
        return result
    }

    /**
     * Copies the specified region from the specified render target into the current bitmap.
     * @param {Pointer<D2D_POINT_2U>} destPoint Type: <b>const <a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2u">D2D1_POINT_2U</a>*</b>
     * 
     * In the current bitmap, the upper-left corner of the area to which the region specified by <i>srcRect</i> is copied.
     * @param {ID2D1RenderTarget} renderTarget Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1rendertarget">ID2D1RenderTarget</a>*</b>
     * 
     * The render target that contains the region to copy.
     * @param {Pointer<D2D_RECT_U>} srcRect Type: <b>const <a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-rect-u">D2D1_RECT_U</a>*</b>
     * 
     * The area of <i>renderTarget</i> to copy.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1bitmap-copyfromrendertarget
     */
    CopyFromRenderTarget(destPoint, renderTarget, srcRect) {
        result := ComCall(9, this, "ptr", destPoint, "ptr", renderTarget, "ptr", srcRect, "HRESULT")
        return result
    }

    /**
     * Copies the specified region from memory into the current bitmap.
     * @param {Pointer<D2D_RECT_U>} dstRect Type: <b>const <a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-rect-u">D2D1_RECT_U</a>*</b>
     * 
     * In the current bitmap, the rectangle to which the region specified by <i>srcRect</i> is copied.
     * @param {Pointer<Void>} srcData Type: <b>const void*</b>
     * 
     * The data to copy.
     * @param {Integer} pitch Type: <b>UINT32</b>
     * 
     * The stride, or pitch, of the source bitmap stored in <i>srcData</i>. The stride is the byte count of a scanline (one row of pixels in memory). The stride can be computed from the following formula: pixel width * bytes per pixel + memory padding.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1bitmap-copyfrommemory
     */
    CopyFromMemory(dstRect, srcData, pitch) {
        srcDataMarshal := srcData is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "ptr", dstRect, srcDataMarshal, srcData, "uint", pitch, "HRESULT")
        return result
    }
}
