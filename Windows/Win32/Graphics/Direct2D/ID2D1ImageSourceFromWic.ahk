#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "Common\D2D_RECT_U.ahk" { D2D_RECT_U }
#Import "..\Imaging\IWICBitmapSource.ahk" { IWICBitmapSource }
#Import ".\ID2D1ImageSource.ahk" { ID2D1ImageSource }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Produces 2D pixel data that has been sourced from WIC.
 * @remarks
 * Create an an instance of ID2D1ImageSourceFromWic 
 *           using [ID2D1DeviceContext2::CreateImageSourceFromWic](./nf-d2d1_3-id2d1devicecontext2-createimagesourcefromwic(iwicbitmapsource_d2d1_image_source_loading_options_d2d1_alpha_mode_id2d1imagesourcefromwic).md).
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1imagesourcefromwic
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1ImageSourceFromWic extends ID2D1ImageSource {
    /**
     * The interface identifier for ID2D1ImageSourceFromWic
     * @type {Guid}
     */
    static IID := Guid("{77395441-1c8f-4555-8683-f50dab0fe792}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1ImageSourceFromWic interfaces
    */
    struct Vtbl extends ID2D1ImageSource.Vtbl {
        EnsureCached : IntPtr
        TrimCache    : IntPtr
        GetSource    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1ImageSourceFromWic.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(6, this, D2D_RECT_U.Ptr, rectangleToFill, "HRESULT")
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
        result := ComCall(7, this, D2D_RECT_U.Ptr, rectangleToPreserve, "HRESULT")
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
        ComCall(8, this, IWICBitmapSource.Ptr, wicBitmapSource)
    }

    Query(iid) {
        if (ID2D1ImageSourceFromWic.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnsureCached := CallbackCreate(GetMethod(implObj, "EnsureCached"), flags, 2)
        this.vtbl.TrimCache := CallbackCreate(GetMethod(implObj, "TrimCache"), flags, 2)
        this.vtbl.GetSource := CallbackCreate(GetMethod(implObj, "GetSource"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnsureCached)
        CallbackFree(this.vtbl.TrimCache)
        CallbackFree(this.vtbl.GetSource)
    }
}
