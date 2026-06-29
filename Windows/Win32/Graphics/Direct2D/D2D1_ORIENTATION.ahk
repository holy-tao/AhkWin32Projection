#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the flip and rotation at which an image appears.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ne-d2d1_3-d2d1_orientation
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_ORIENTATION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The orientation is unchanged.
     * @type {Integer (Int32)}
     */
    static D2D1_ORIENTATION_DEFAULT => 1

    /**
     * The image is flipped horizontally.
     * @type {Integer (Int32)}
     */
    static D2D1_ORIENTATION_FLIP_HORIZONTAL => 2

    /**
     * The image is rotated clockwise 180 degrees.
     * @type {Integer (Int32)}
     */
    static D2D1_ORIENTATION_ROTATE_CLOCKWISE180 => 3

    /**
     * The image is rotated clockwise 180 degrees, then flipped horizontally.
     * @type {Integer (Int32)}
     */
    static D2D1_ORIENTATION_ROTATE_CLOCKWISE180_FLIP_HORIZONTAL => 4

    /**
     * The image is rotated clockwise 90 degrees, then flipped horizontally.
     * @type {Integer (Int32)}
     */
    static D2D1_ORIENTATION_ROTATE_CLOCKWISE90_FLIP_HORIZONTAL => 5

    /**
     * The image is rotated clockwise 270 degrees.
     * @type {Integer (Int32)}
     */
    static D2D1_ORIENTATION_ROTATE_CLOCKWISE270 => 6

    /**
     * The image is rotated clockwise 270 degrees, then flipped horizontally.
     * @type {Integer (Int32)}
     */
    static D2D1_ORIENTATION_ROTATE_CLOCKWISE270_FLIP_HORIZONTAL => 7

    /**
     * The image is rotated clockwise 90 degrees.
     * @type {Integer (Int32)}
     */
    static D2D1_ORIENTATION_ROTATE_CLOCKWISE90 => 8
}
