#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the format of the buffer. Used by BeginBufferedAnimation and BeginBufferedPaint.
 * @see https://docs.microsoft.com/windows/win32/api//uxtheme/ne-uxtheme-bp_bufferformat
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class BP_BUFFERFORMAT{

    /**
     * Compatible bitmap. The  number of bits per pixel is based on the color format of the device associated with the HDC specified with <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a> or <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedanimation">BeginBufferedAnimation</a>—typically, this is the display device.
     * @type {Integer (Int32)}
     */
    static BPBF_COMPATIBLEBITMAP => 0

    /**
     * Bottom-up device-independent bitmap. The origin of the bitmap is the lower-left corner. Uses 32 bits per pixel.
     * @type {Integer (Int32)}
     */
    static BPBF_DIB => 1

    /**
     * Top-down device-independent bitmap. The origin of the bitmap is the upper-left corner. Uses 32 bits per pixel.
     * @type {Integer (Int32)}
     */
    static BPBF_TOPDOWNDIB => 2

    /**
     * Top-down, monochrome, device-independent bitmap. Uses 1 bit per pixel.
     * @type {Integer (Int32)}
     */
    static BPBF_TOPDOWNMONODIB => 3
}
