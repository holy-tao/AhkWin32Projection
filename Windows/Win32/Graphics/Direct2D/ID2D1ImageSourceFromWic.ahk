#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1ImageSource.ahk

/**
 * Produces 2D pixel data that has been sourced from WIC.
 * @remarks
 * 
 * Create an an instance of ID2D1ImageSourceFromWic 
 *           using [ID2D1DeviceContext2::CreateImageSourceFromWic](./nf-d2d1_3-id2d1devicecontext2-createimagesourcefromwic(iwicbitmapsource_d2d1_image_source_loading_options_d2d1_alpha_mode_id2d1imagesourcefromwic).md).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1imagesourcefromwic
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
     * 
     * @param {Pointer<D2D_RECT_U>} rectangleToFill 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1imagesourcefromwic-ensurecached(constd2d1_rect_u_)
     */
    EnsureCached(rectangleToFill) {
        result := ComCall(6, this, "ptr", rectangleToFill, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_U>} rectangleToPreserve 
     * @returns {HRESULT} 
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
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1imagesourcefromwic-getsource
     */
    GetSource(wicBitmapSource) {
        ComCall(8, this, "ptr*", wicBitmapSource)
    }
}
