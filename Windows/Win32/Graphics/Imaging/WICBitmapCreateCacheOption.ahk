#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the desired cache usage.
 * @remarks
 * 
 * The <b>CreateBitmap</b> of the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicimagingfactory">IWICImagingFactory</a> interface does not support WICBitmapNoCache when the <i>pixelFormat</i> is a native pixel format provided by Windows Imaging Component (WIC).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicbitmapcreatecacheoption
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICBitmapCreateCacheOption{

    /**
     * Do not cache the bitmap.
     * @type {Integer (Int32)}
     */
    static WICBitmapNoCache => 0

    /**
     * Cache the bitmap when needed.
     * @type {Integer (Int32)}
     */
    static WICBitmapCacheOnDemand => 1

    /**
     * Cache the bitmap at initialization.
     * @type {Integer (Int32)}
     */
    static WICBitmapCacheOnLoad => 2
}
