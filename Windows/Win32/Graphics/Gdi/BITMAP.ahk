#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The BITMAP structure defines the type, width, height, color format, and bit values of a bitmap.
 * @remarks
 * The bitmap formats currently used are monochrome and color. The monochrome bitmap uses a one-bit, one-plane format. Each scan is a multiple of 16 bits.
 * 
 * Scans are organized as follows for a monochrome bitmap of height <i>n</i>:
 * 
 * 
 * ``` syntax
 * 
 *     Scan 0 
 *     Scan 1 
 *     . 
 *     . 
 *     . 
 *     Scan n-2 
 *     Scan n-1 
 * 
 * ```
 * 
 * The pixels on a monochrome device are either black or white. If the corresponding bit in the bitmap is 1, the pixel is set to the foreground color; if the corresponding bit in the bitmap is zero, the pixel is set to the background color.
 * 
 * All devices that have the RC_BITBLT device capability support bitmaps. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getdevicecaps">GetDeviceCaps</a>.
 * 
 * Each device has a unique color format. To transfer a bitmap from one device to another, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getdibits">GetDIBits</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-setdibits">SetDIBits</a> functions.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-bitmap
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct BITMAP {
    #StructPack 8

    /**
     * The bitmap type. This member must be zero.
     */
    bmType : Int32

    /**
     * The width, in pixels, of the bitmap. The width must be greater than zero.
     */
    bmWidth : Int32

    /**
     * The height, in pixels, of the bitmap. The height must be greater than zero.
     */
    bmHeight : Int32

    /**
     * The number of bytes in each scan line. This value must be divisible by 2, because the system assumes that the bit values of a bitmap form an array that is word aligned.
     */
    bmWidthBytes : Int32

    /**
     * The count of color planes.
     */
    bmPlanes : UInt16

    /**
     * The number of bits required to indicate the color of a pixel.
     */
    bmBitsPixel : UInt16

    /**
     * A pointer to the location of the bit values for the bitmap. The <b>bmBits</b> member must be a pointer to an array of character (1-byte) values.
     */
    bmBits : IntPtr

}
