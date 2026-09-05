#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of dither algorithm to apply when converting between image formats.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmapdithertype
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICBitmapDitherType extends Win32Enum {

    /**
     * A solid color algorithm without dither.
     * Native name: WICBitmapDitherTypeNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * A solid color algorithm without dither.
     * Native name: WICBitmapDitherTypeSolid
     * @type {Integer (Int32)}
     */
    static Solid => 0

    /**
     * A 4x4 ordered dither algorithm.
     * Native name: WICBitmapDitherTypeOrdered4x4
     * @type {Integer (Int32)}
     */
    static Ordered4x4 => 1

    /**
     * An 8x8 ordered dither algorithm.
     * Native name: WICBitmapDitherTypeOrdered8x8
     * @type {Integer (Int32)}
     */
    static Ordered8x8 => 2

    /**
     * A 16x16 ordered dither algorithm.
     * Native name: WICBitmapDitherTypeOrdered16x16
     * @type {Integer (Int32)}
     */
    static Ordered16x16 => 3

    /**
     * A 4x4 spiral dither algorithm.
     * Native name: WICBitmapDitherTypeSpiral4x4
     * @type {Integer (Int32)}
     */
    static Spiral4x4 => 4

    /**
     * An 8x8 spiral dither algorithm.
     * Native name: WICBitmapDitherTypeSpiral8x8
     * @type {Integer (Int32)}
     */
    static Spiral8x8 => 5

    /**
     * A 4x4 dual spiral dither algorithm.
     * Native name: WICBitmapDitherTypeDualSpiral4x4
     * @type {Integer (Int32)}
     */
    static DualSpiral4x4 => 6

    /**
     * An 8x8 dual spiral dither algorithm.
     * Native name: WICBitmapDitherTypeDualSpiral8x8
     * @type {Integer (Int32)}
     */
    static DualSpiral8x8 => 7

    /**
     * An error diffusion algorithm.
     * Native name: WICBitmapDitherTypeErrorDiffusion
     * @type {Integer (Int32)}
     */
    static ErrorDiffusion => 8
}
