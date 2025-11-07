#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies additional options to an IWICPlanarBitmapSourceTransform implementation.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicplanaroptions
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICPlanarOptions{

    /**
     * No options specified.  
     * 
     * 
     * 
     * WIC JPEG Decoder:  The default behavior for iDCT scaling is to preserve quality when downscaling by downscaling only the Y plane in some cases, and the image may change to 4:4:4 chroma subsampling.
     * @type {Integer (Int32)}
     */
    static WICPlanarOptionsDefault => 0

    /**
     * Asks the source to preserve the size ratio between planes when scaling.
     * 
     * WIC JPEG Decoder:  Specifying this option causes the JPEG decoder to scale luma and chroma planes by the same amount, so a 4:2:0 chroma subsampled image outputs 4:2:0 data when downscaling by 2x, 4x, or 8x.
     * @type {Integer (Int32)}
     */
    static WICPlanarOptionsPreserveSubsampling => 1
}
