#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DWRITE_TEXT_ANTIALIAS_MODE enumeration contains values that specify the type of antialiasing to use for text when the rendering mode calls for antialiasing.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_text_antialias_mode
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_TEXT_ANTIALIAS_MODE{

    /**
     * ClearType antialiasing computes coverage independently for the red, green, and blue color elements of each pixel. This allows for more detail than conventional antialiasing. However, because there is no one alpha value for each pixel, ClearType is not suitable for rendering text onto a transparent intermediate bitmap.
     * @type {Integer (Int32)}
     */
    static DWRITE_TEXT_ANTIALIAS_MODE_CLEARTYPE => 0

    /**
     * Grayscale antialiasing computes one coverage value for each pixel. Because the alpha value of each pixel is well-defined, text can be rendered onto a transparent bitmap, which can then be composited with other content.
 * 
 * <div class="alert"><b>Note</b>  Grayscale rendering with <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nn-dwrite_1-idwritebitmaprendertarget1">IDWriteBitmapRenderTarget1</a> uses premultiplied alpha.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static DWRITE_TEXT_ANTIALIAS_MODE_GRAYSCALE => 1
}
