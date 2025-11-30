#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of dither algorithm to apply when converting between image formats.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicbitmapdithertype
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICBitmapDitherType extends Win32Enum{

    /**
     * A solid color algorithm without dither.
     * @type {Integer (Int32)}
     */
    static WICBitmapDitherTypeNone => 0

    /**
     * A solid color algorithm without dither.
     * @type {Integer (Int32)}
     */
    static WICBitmapDitherTypeSolid => 0

    /**
     * A 4x4 ordered dither algorithm.
     * @type {Integer (Int32)}
     */
    static WICBitmapDitherTypeOrdered4x4 => 1

    /**
     * An 8x8 ordered dither algorithm.
     * @type {Integer (Int32)}
     */
    static WICBitmapDitherTypeOrdered8x8 => 2

    /**
     * A 16x16 ordered dither algorithm.
     * @type {Integer (Int32)}
     */
    static WICBitmapDitherTypeOrdered16x16 => 3

    /**
     * A 4x4 spiral dither algorithm.
     * @type {Integer (Int32)}
     */
    static WICBitmapDitherTypeSpiral4x4 => 4

    /**
     * An 8x8 spiral dither algorithm.
     * @type {Integer (Int32)}
     */
    static WICBitmapDitherTypeSpiral8x8 => 5

    /**
     * A 4x4 dual spiral dither algorithm.
     * @type {Integer (Int32)}
     */
    static WICBitmapDitherTypeDualSpiral4x4 => 6

    /**
     * An 8x8 dual spiral dither algorithm.
     * @type {Integer (Int32)}
     */
    static WICBitmapDitherTypeDualSpiral8x8 => 7

    /**
     * An error diffusion algorithm.
     * @type {Integer (Int32)}
     */
    static WICBitmapDitherTypeErrorDiffusion => 8
}
