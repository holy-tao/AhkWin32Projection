#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the flip and rotation transforms.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmaptransformoptions
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICBitmapTransformOptions extends Win32Enum {

    /**
     * A rotation of 0 degrees.
     * Native name: WICBitmapTransformRotate0
     * @type {Integer (Int32)}
     */
    static Rotate0 => 0

    /**
     * A clockwise rotation of 90 degrees.
     * Native name: WICBitmapTransformRotate90
     * @type {Integer (Int32)}
     */
    static Rotate90 => 1

    /**
     * A clockwise rotation of 180 degrees.
     * Native name: WICBitmapTransformRotate180
     * @type {Integer (Int32)}
     */
    static Rotate180 => 2

    /**
     * A clockwise rotation of 270 degrees.
     * Native name: WICBitmapTransformRotate270
     * @type {Integer (Int32)}
     */
    static Rotate270 => 3

    /**
     * A horizontal flip. Pixels are flipped around the vertical y-axis.
     * Native name: WICBitmapTransformFlipHorizontal
     * @type {Integer (Int32)}
     */
    static FlipHorizontal => 8

    /**
     * A vertical flip. Pixels are flipped around the horizontal x-axis.
     * Native name: WICBitmapTransformFlipVertical
     * @type {Integer (Int32)}
     */
    static FlipVertical => 16
}
