#Requires AutoHotkey v2.0.0 64-bit

/**
 * The RotateFlipType enumeration specifies the direction of an image's rotation and the axis used to flip the image.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusimaging/ne-gdiplusimaging-rotatefliptype
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class RotateFlipType{

    /**
     * Specifies no rotation and no flipping.
     * @type {Integer (Int32)}
     */
    static RotateNoneFlipNone => 0

    /**
     * Specifies a 90-degree rotation without flipping.
     * @type {Integer (Int32)}
     */
    static Rotate90FlipNone => 1

    /**
     * Specifies a 180-degree rotation without flipping.
     * @type {Integer (Int32)}
     */
    static Rotate180FlipNone => 2

    /**
     * Specifies a 270-degree rotation without flipping.
     * @type {Integer (Int32)}
     */
    static Rotate270FlipNone => 3

    /**
     * Specifies no rotation and a horizontal flip.
     * @type {Integer (Int32)}
     */
    static RotateNoneFlipX => 4

    /**
     * Specifies a 90-degree rotation followed by a horizontal flip.
     * @type {Integer (Int32)}
     */
    static Rotate90FlipX => 5

    /**
     * Specifies a 180-degree rotation followed by a horizontal flip.
     * @type {Integer (Int32)}
     */
    static Rotate180FlipX => 6

    /**
     * Specifies a 270-degree rotation followed by a horizontal flip.
     * @type {Integer (Int32)}
     */
    static Rotate270FlipX => 7

    /**
     * Specifies no rotation and a vertical flip.
     * @type {Integer (Int32)}
     */
    static RotateNoneFlipY => 6

    /**
     * Specifies a 90-degree rotation followed by a vertical flip.
     * @type {Integer (Int32)}
     */
    static Rotate90FlipY => 7

    /**
     * Specifies a 180-degree rotation followed by a vertical flip.
     * @type {Integer (Int32)}
     */
    static Rotate180FlipY => 4

    /**
     * Specifies a 270-degree rotation followed by a vertical flip.
     * @type {Integer (Int32)}
     */
    static Rotate270FlipY => 5

    /**
     * Specifies no rotation, a horizontal flip, and then a vertical flip.
     * @type {Integer (Int32)}
     */
    static RotateNoneFlipXY => 2

    /**
     * Specifies a 90-degree rotation followed by a horizontal flip and then a vertical flip.
     * @type {Integer (Int32)}
     */
    static Rotate90FlipXY => 3

    /**
     * Specifies a 180-degree rotation followed by a horizontal flip and then a vertical flip.
     * @type {Integer (Int32)}
     */
    static Rotate180FlipXY => 0

    /**
     * Specifies a 270-degree rotation followed by a horizontal flip and then a vertical flip.
     * @type {Integer (Int32)}
     */
    static Rotate270FlipXY => 1
}
