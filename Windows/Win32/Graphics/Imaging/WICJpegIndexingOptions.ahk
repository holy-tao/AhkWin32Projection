#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the options for indexing a JPEG image.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicjpegindexingoptions
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICJpegIndexingOptions {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
