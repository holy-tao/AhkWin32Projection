#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether a flip and/or rotation operation should be performed by the Bitmap source effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_bitmapsource_orientation
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_BITMAPSOURCE_ORIENTATION{

    /**
     * The effect doesn't change the orientation of the input.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_ORIENTATION_DEFAULT => 1

    /**
     * Flips the image horizontally.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_ORIENTATION_FLIP_HORIZONTAL => 2

    /**
     * Rotates the image clockwise 180 degrees.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_ORIENTATION_ROTATE_CLOCKWISE180 => 3

    /**
     * Rotates the image clockwise 180 degrees and flips it horizontally.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_ORIENTATION_ROTATE_CLOCKWISE180_FLIP_HORIZONTAL => 4

    /**
     * Rotates the image clockwise 270 degrees and flips it horizontally.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_ORIENTATION_ROTATE_CLOCKWISE270_FLIP_HORIZONTAL => 5

    /**
     * Rotates the image clockwise 90 degrees.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_ORIENTATION_ROTATE_CLOCKWISE90 => 6

    /**
     * Rotates the image clockwise 90 degrees and flips it horizontally.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_ORIENTATION_ROTATE_CLOCKWISE90_FLIP_HORIZONTAL => 7

    /**
     * Rotates the image clockwise 270 degrees.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_ORIENTATION_ROTATE_CLOCKWISE270 => 8
}
