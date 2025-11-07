#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The BITMAP structure defines the type, width, height, color format, and bit values of a bitmap.
 * @remarks
 * 
 * The bitmap formats currently used are monochrome and color. The monochrome bitmap uses a one-bit, one-plane format. Each scan is a multiple of 16 bits.
 * 
 * Scans are organized as follows for a monochrome bitmap of height <i>n</i>:
 * 
 * <pre class="syntax" xml:space="preserve"><code>
 *     Scan 0 
 *     Scan 1 
 *     . 
 *     . 
 *     . 
 *     Scan n-2 
 *     Scan n-1 
 * </code></pre>
 * The pixels on a monochrome device are either black or white. If the corresponding bit in the bitmap is 1, the pixel is set to the foreground color; if the corresponding bit in the bitmap is zero, the pixel is set to the background color.
 * 
 * All devices that have the RC_BITBLT device capability support bitmaps. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getdevicecaps">GetDeviceCaps</a>.
 * 
 * Each device has a unique color format. To transfer a bitmap from one device to another, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getdibits">GetDIBits</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-setdibits">SetDIBits</a> functions.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-bitmap
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class BITMAP extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The bitmap type. This member must be zero.
     * @type {Integer}
     */
    bmType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The width, in pixels, of the bitmap. The width must be greater than zero.
     * @type {Integer}
     */
    bmWidth {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The height, in pixels, of the bitmap. The height must be greater than zero.
     * @type {Integer}
     */
    bmHeight {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The number of bytes in each scan line. This value must be divisible by 2, because the system assumes that the bit values of a bitmap form an array that is word aligned.
     * @type {Integer}
     */
    bmWidthBytes {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The count of color planes.
     * @type {Integer}
     */
    bmPlanes {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * The number of bits required to indicate the color of a pixel.
     * @type {Integer}
     */
    bmBitsPixel {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * A pointer to the location of the bit values for the bitmap. The <b>bmBits</b> member must be a pointer to an array of character (1-byte) values.
     * @type {Pointer<Void>}
     */
    bmBits {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
