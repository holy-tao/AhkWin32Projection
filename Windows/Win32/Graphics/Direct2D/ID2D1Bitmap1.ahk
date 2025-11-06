#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Dxgi\IDXGISurface.ahk
#Include .\D2D1_MAPPED_RECT.ahk
#Include .\ID2D1Bitmap.ahk

/**
 * Represents a bitmap that can be used as a surface for an ID2D1DeviceContext or mapped into system memory, and can contain additional color context information.
 * @remarks
 * 
  * <h3><a id="Creating_ID2D1Bitmap_Objects"></a><a id="creating_id2d1bitmap_objects"></a><a id="CREATING_ID2D1BITMAP_OBJECTS"></a>Creating ID2D1Bitmap Objects</h3>
  * Use one of these methods to create an <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a> object. <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createbitmap(d2d1_size_u_constvoid_uint32_constd2d1_bitmap_properties1_id2d1bitmap1)">ID2D1DeviceContext::CreateBitmap</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createbitmapfromwicbitmap(iwicbitmapsource_constd2d1_bitmap_properties1__id2d1bitmap1)">ID2D1DeviceContext::CreateBitmapFromWicBitmap</a>
  * </li>
  * </ul>
  * 
  * 
  * For information about the pixel formats supported by Direct2D bitmaps, see <a href="https://docs.microsoft.com/windows/desktop/Direct2D/supported-pixel-formats-and-alpha-modes">Supported Pixel Formats and Alpha Modes</a>.
  * 
  * An <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a> is a device-dependent resource: your application should create bitmaps after it initializes the render target with which the bitmap will be used, and recreate the bitmap whenever the render target needs recreated. (For more information about resources, see <a href="https://docs.microsoft.com/windows/desktop/Direct2D/resources-and-resource-domains">Resources Overview</a>.)
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1bitmap1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Bitmap1 extends ID2D1Bitmap{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Bitmap1
     * @type {Guid}
     */
    static IID => Guid("{a898a84c-3873-4588-b08b-ebbf978df041}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetColorContext", "GetOptions", "GetSurface", "Map", "Unmap"]

    /**
     * 
     * @param {Pointer<ID2D1ColorContext>} colorContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1bitmap1-getcolorcontext
     */
    GetColorContext(colorContext) {
        ComCall(11, this, "ptr*", colorContext)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1bitmap1-getoptions
     */
    GetOptions() {
        result := ComCall(12, this, "int")
        return result
    }

    /**
     * 
     * @returns {IDXGISurface} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1bitmap1-getsurface
     */
    GetSurface() {
        result := ComCall(13, this, "ptr*", &dxgiSurface := 0, "HRESULT")
        return IDXGISurface(dxgiSurface)
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {D2D1_MAPPED_RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1bitmap1-map
     */
    Map(options) {
        mappedRect := D2D1_MAPPED_RECT()
        result := ComCall(14, this, "int", options, "ptr", mappedRect, "HRESULT")
        return mappedRect
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1bitmap1-unmap
     */
    Unmap() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
