#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies additional options to an IWICPlanarBitmapSourceTransform implementation.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicplanaroptions
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICPlanarOptions extends Win32Enum {

    /**
     * No options specified.  
     * 
     * 
     * 
     * WIC JPEG Decoder:  The default behavior for iDCT scaling is to preserve quality when downscaling by downscaling only the Y plane in some cases, and the image may change to 4:4:4 chroma subsampling.
     * Native name: WICPlanarOptionsDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Asks the source to preserve the size ratio between planes when scaling.
     * 
     * WIC JPEG Decoder:  Specifying this option causes the JPEG decoder to scale luma and chroma planes by the same amount, so a 4:2:0 chroma subsampled image outputs 4:2:0 data when downscaling by 2x, 4x, or 8x.
     * Native name: WICPlanarOptionsPreserveSubsampling
     * @type {Integer (Int32)}
     */
    static PreserveSubsampling => 1
}
