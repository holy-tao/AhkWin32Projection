#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ImageLockMode enumeration specifies flags that are passed to the flags parameter of the Bitmap::LockBits method. The Bitmap::LockBits method locks a portion of an image so that you can read or write the pixel data.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusimaging/ne-gdiplusimaging-imagelockmode
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ImageLockMode{

    /**
     * Specifies that a portion of the image is locked for reading.
     * @type {Integer (Int32)}
     */
    static ImageLockModeRead => 1

    /**
     * Specifies that a portion of the image is locked for writing.
     * @type {Integer (Int32)}
     */
    static ImageLockModeWrite => 2

    /**
     * Specifies that the buffer used for reading or writing pixel data is allocated by the user. If this flag is set, then the 
     * 				<i>lockedBitmapData</i> parameter of the 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-bitmap-lockbits">Bitmap::LockBits</a> method serves as an input parameter (and possibly as an output parameter). If this flag is cleared, then the 
     * 				<i>lockedBitmapData</i> parameter serves only as an output parameter.
     * @type {Integer (Int32)}
     */
    static ImageLockModeUserInputBuf => 4
}
