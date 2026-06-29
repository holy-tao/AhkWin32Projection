#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the flip and rotation transforms.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmaptransformoptions
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICBitmapTransformOptions {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A rotation of 0 degrees.
     * @type {Integer (Int32)}
     */
    static WICBitmapTransformRotate0 => 0

    /**
     * A clockwise rotation of 90 degrees.
     * @type {Integer (Int32)}
     */
    static WICBitmapTransformRotate90 => 1

    /**
     * A clockwise rotation of 180 degrees.
     * @type {Integer (Int32)}
     */
    static WICBitmapTransformRotate180 => 2

    /**
     * A clockwise rotation of 270 degrees.
     * @type {Integer (Int32)}
     */
    static WICBitmapTransformRotate270 => 3

    /**
     * A horizontal flip. Pixels are flipped around the vertical y-axis.
     * @type {Integer (Int32)}
     */
    static WICBitmapTransformFlipHorizontal => 8

    /**
     * A vertical flip. Pixels are flipped around the horizontal x-axis.
     * @type {Integer (Int32)}
     */
    static WICBitmapTransformFlipVertical => 16
}
