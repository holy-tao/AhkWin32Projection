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
     * 
     * @returns {D2D_SIZE_F} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmap-getsize
     */
    GetSize() {
        result := ComCall(4, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {D2D_SIZE_U} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmap-getpixelsize
     */
    GetPixelSize() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * The GetPixelFormat function obtains the index of the currently selected pixel format of the specified device context.
     * @returns {D2D1_PIXEL_FORMAT} If the function succeeds, the return value is the currently selected pixel format index of the specified device context. This is a positive, one-based index value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpixelformat
     */
    GetPixelFormat() {
        result := ComCall(6, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} dpiX 
     * @param {Pointer<Float>} dpiY 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmap-getdpi
     */
    GetDpi(dpiX, dpiY) {
        ComCall(7, this, "float*", dpiX, "float*", dpiY)
    }

    /**
     * 
     * @param {Pointer<D2D_POINT_2U>} destPoint 
     * @param {ID2D1Bitmap} bitmap 
     * @param {Pointer<D2D_RECT_U>} srcRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmap-copyfrombitmap
     */
    CopyFromBitmap(destPoint, bitmap, srcRect) {
        result := ComCall(8, this, "ptr", destPoint, "ptr", bitmap, "ptr", srcRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_POINT_2U>} destPoint 
     * @param {ID2D1RenderTarget} renderTarget 
     * @param {Pointer<D2D_RECT_U>} srcRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmap-copyfromrendertarget
     */
    CopyFromRenderTarget(destPoint, renderTarget, srcRect) {
        result := ComCall(9, this, "ptr", destPoint, "ptr", renderTarget, "ptr", srcRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_U>} dstRect 
     * @param {Pointer<Void>} srcData 
     * @param {Integer} pitch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmap-copyfrommemory
     */
    CopyFromMemory(dstRect, srcData, pitch) {
        result := ComCall(10, this, "ptr", dstRect, "ptr", srcData, "uint", pitch, "HRESULT")
        return result
    }
}
