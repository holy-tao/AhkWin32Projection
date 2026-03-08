#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1ImageSource.ahk

/**
 * Produces 2D pixel data that has been sourced from WIC.
 * @remarks
 * Create an an instance of ID2D1ImageSourceFromWic 
 *           using [ID2D1DeviceContext2::CreateImageSourceFromWic](./nf-d2d1_3-id2d1devicecontext2-createimagesourcefromwic(iwicbitmapsource_d2d1_image_source_loading_options_d2d1_alpha_mode_id2d1imagesourcefromwic).md).
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1imagesourcefromwic
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1ImageSourceFromWic extends ID2D1ImageSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1ImageSourceFromWic
     * @type {Guid}
     */
    static IID => Guid("{77395441-1c8f-4555-8683-f50dab0fe792}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnsureCached", "TrimCache", "GetSource"]

    /**
     * Ensures that a specified region of the image source cache is populated. (overload 1/2)
     * @remarks
     * This API loads image data into caches of image sources, if that data was not already cached.  It does not trim pre-existing caches, if any.  
     *       More areas within the cache can be populated than actually requested.
     * 
     * The provided region must be constructed to include the scale with which the image source will subsequently be drawn.  
     *       These coordinates must be provided in local coordinates.  
     *       This means that they must be adjusted prior to calling the API according to the DPI and other relevant transforms,
     *       which can include the world transform and brush transforms.
     * 
     * This operation is only supported when the image source has been initialized using the D2D1_IMAGE_SOURCE_LOADING_OPTIONS_CACHE_ON_DEMAND option.
     * @param {Pointer<D2D_RECT_U>} rectangleToFill Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-u">D2D1_RECT_U</a></b>
     * 
     * Specifies the region of the image, in pixels, that should be populated in the cache. By default, this is the entire extent of the image.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1imagesourcefromwic-ensurecached(constd2d1_rect_u_)
     */
    EnsureCached(rectangleToFill) {
        result := ComCall(6, this, "ptr", rectangleToFill, "HRESULT")
        return result
    }

    /**
     * This method trims the populated regions of the image source cache to just the specified rectangle. (overload 1/2)
     * @remarks
     * The provided region must be constructed to include the scale at which the image source will be drawn at.  These coordinates must be provided in local coordinates.  
     *       This means that they must be adjusted prior to calling the API according to the DPI and other relevant transforms, which can include the world transform and brush transforms.
     * 
     * This method will fail if on-demand caching was not requested when the image source was created.
     * 
     * As with <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1device-clearresources">ID2D1Device::ClearResources</a>, the caller can need to subsequently issue a D3D flush before memory usage is reduced.
     * 
     * This operation is only supported when the image source has been initialized using the D2D1_IMAGE_SOURCE_LOADING_OPTIONS_CACHE_ON_DEMAND option.
     * @param {Pointer<D2D_RECT_U>} rectangleToPreserve Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-u">D2D1_RECT_U</a>*</b>
     * 
     * Specifies the region of the image, in pixels, which should be preserved in the image source cache. 
     *           Regions which are outside of the rectangle are evicted from the cache. By default, this is an empty rectangle, 
     *           meaning that the entire image is evicted from the cache.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1imagesourcefromwic-trimcache(constd2d1_rect_u)
     */
    TrimCache(rectangleToPreserve) {
        result := ComCall(7, this, "ptr", rectangleToPreserve, "HRESULT")
        return result
    }

    /**
     * Retrieves the underlying bitmap image source from the Windows Imaging Component (WIC).
     * @param {Pointer<IWICBitmapSource>} wicBitmapSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>**</b>
     * 
     * On return contains the bitmap image source.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1imagesourcefromwic-getsource
     */
    GetSource(wicBitmapSource) {
        ComCall(8, this, "ptr*", wicBitmapSource)
    }
}
