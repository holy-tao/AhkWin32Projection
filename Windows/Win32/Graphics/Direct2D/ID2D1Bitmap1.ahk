#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Dxgi\IDXGISurface.ahk
#Include .\D2D1_MAPPED_RECT.ahk
#Include .\ID2D1Bitmap.ahk

/**
 * Represents a bitmap that can be used as a surface for an ID2D1DeviceContext or mapped into system memory, and can contain additional color context information.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api//content/d2d1_1/nn-d2d1_1-id2d1bitmap1
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
     * Gets the color context information associated with the bitmap.
     * @remarks
     * If the bitmap was created without specifying a color context, the returned context is <b>NULL</b>.
     * @param {Pointer<ID2D1ColorContext>} colorContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1colorcontext">ID2D1ColorContext</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the  color context interface associated with the bitmap.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/d2d1_1/nf-d2d1_1-id2d1bitmap1-getcolorcontext
     */
    GetColorContext(colorContext) {
        ComCall(11, this, "ptr*", colorContext)
    }

    /**
     * Gets the options used in creating the bitmap.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_bitmap_options">D2D1_BITMAP_OPTIONS</a></b>
     * 
     * This method returns the options used.
     * @see https://learn.microsoft.com/windows/win32/api//content/d2d1_1/nf-d2d1_1-id2d1bitmap1-getoptions
     */
    GetOptions() {
        result := ComCall(12, this, "int")
        return result
    }

    /**
     * Gets either the surface that was specified when the bitmap was created, or the default surface created when the bitmap was created.
     * @remarks
     * The bitmap used must have been created from a DXGI surface render target, a derived render target, or a device context created from an <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a>.
     * 
     * The returned surface can be used with Microsoft Direct3D or any other API that interoperates with shared surfaces. The application must transitively ensure that the surface is usable on the Direct3D device that is used in this context. For example, if using the surface with Direct2D  then the Direct2D render target must have been created through <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createdxgisurfacerendertarget(idxgisurface_constd2d1_render_target_properties_id2d1rendertarget)">ID2D1Factory::CreateDxgiSurfaceRenderTarget</a> or on a device context created on the same device.
     * @returns {Pointer<IDXGISurface>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a>**</b>
     * 
     * The underlying DXGI surface for the bitmap.
     * @see https://learn.microsoft.com/windows/win32/api//content/d2d1_1/nf-d2d1_1-id2d1bitmap1-getsurface
     */
    GetSurface() {
        result := ComCall(13, this, "ptr*", &dxgiSurface := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return dxgiSurface
    }

    /**
     * Maps the given bitmap into memory.
     * @remarks
     * <div class="alert"><b>Note</b>  You can't use bitmaps for some purposes while mapped. Particularly, the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1bitmap-copyfrombitmap">ID2D1Bitmap::CopyFromBitmap</a> method doesn't work if either the source or destination bitmap is mapped.</div>
     * <div> </div>
     * The bitmap must have been created with the <b>D2D1_BITMAP_OPTIONS_CPU_READ</b> flag specified.
     * @param {Integer} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_map_options">D2D1_MAP_OPTIONS</a></b>
     * 
     * The options used in mapping the bitmap into memory.
     * @returns {D2D1_MAPPED_RECT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_mapped_rect">D2D1_MAPPED_RECT</a>*</b>
     * 
     * When this method returns, contains a reference to the rectangle that is mapped into memory.
     * @see https://learn.microsoft.com/windows/win32/api//content/d2d1_1/nf-d2d1_1-id2d1bitmap1-map
     */
    Map(options) {
        mappedRect := D2D1_MAPPED_RECT()
        result := ComCall(14, this, "int", options, "ptr", mappedRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return mappedRect
    }

    /**
     * Unmaps the bitmap from memory.
     * @remarks
     * Any memory returned from the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1bitmap1-map">Map</a> call is now invalid and may be reclaimed by the operating system or used for other purposes. 
     * 
     * The bitmap must have been previously mapped.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>One or more arguments are not valid.</td>
     * </tr>
     * <tr>
     * <td>E_POINTER</td>
     * <td>Pointer is not valid.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/d2d1_1/nf-d2d1_1-id2d1bitmap1-unmap
     */
    Unmap() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
