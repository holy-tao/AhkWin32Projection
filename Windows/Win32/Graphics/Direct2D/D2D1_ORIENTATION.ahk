#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the flip and rotation at which an image appears.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ne-d2d1_3-d2d1_orientation
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_ORIENTATION extends Win32Enum {

    /**
     * The orientation is unchanged.
     * Native name: D2D1_ORIENTATION_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 1

    /**
     * The image is flipped horizontally.
     * Native name: D2D1_ORIENTATION_FLIP_HORIZONTAL
     * @type {Integer (Int32)}
     */
    static FLIP_HORIZONTAL => 2

    /**
     * The image is rotated clockwise 180 degrees.
     * Native name: D2D1_ORIENTATION_ROTATE_CLOCKWISE180
     * @type {Integer (Int32)}
     */
    static ROTATE_CLOCKWISE180 => 3

    /**
     * The image is rotated clockwise 180 degrees, then flipped horizontally.
     * Native name: D2D1_ORIENTATION_ROTATE_CLOCKWISE180_FLIP_HORIZONTAL
     * @type {Integer (Int32)}
     */
    static ROTATE_CLOCKWISE180_FLIP_HORIZONTAL => 4

    /**
     * The image is rotated clockwise 90 degrees, then flipped horizontally.
     * Native name: D2D1_ORIENTATION_ROTATE_CLOCKWISE90_FLIP_HORIZONTAL
     * @type {Integer (Int32)}
     */
    static ROTATE_CLOCKWISE90_FLIP_HORIZONTAL => 5

    /**
     * The image is rotated clockwise 270 degrees.
     * Native name: D2D1_ORIENTATION_ROTATE_CLOCKWISE270
     * @type {Integer (Int32)}
     */
    static ROTATE_CLOCKWISE270 => 6

    /**
     * The image is rotated clockwise 270 degrees, then flipped horizontally.
     * Native name: D2D1_ORIENTATION_ROTATE_CLOCKWISE270_FLIP_HORIZONTAL
     * @type {Integer (Int32)}
     */
    static ROTATE_CLOCKWISE270_FLIP_HORIZONTAL => 7

    /**
     * The image is rotated clockwise 90 degrees.
     * Native name: D2D1_ORIENTATION_ROTATE_CLOCKWISE90
     * @type {Integer (Int32)}
     */
    static ROTATE_CLOCKWISE90 => 8
}
