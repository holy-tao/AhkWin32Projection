#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the options for indexing a JPEG image.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicjpegindexingoptions
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICJpegIndexingOptions extends Win32Enum{

    /**
     * Index generation is deferred until <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsource-copypixels">IWICBitmapSource::CopyPixels</a> is called on the image.
     * @type {Integer (Int32)}
     */
    static WICJpegIndexingOptionsGenerateOnDemand => 0

    /**
     * Index generation is performed when the when the image is initially loaded.
     * @type {Integer (Int32)}
     */
    static WICJpegIndexingOptionsGenerateOnLoad => 1
}
