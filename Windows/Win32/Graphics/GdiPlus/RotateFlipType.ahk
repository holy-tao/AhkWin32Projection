#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class RotateFlipType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RotateNoneFlipNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static Rotate90FlipNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static Rotate180FlipNone => 2

    /**
     * @type {Integer (Int32)}
     */
    static Rotate270FlipNone => 3

    /**
     * @type {Integer (Int32)}
     */
    static RotateNoneFlipX => 4

    /**
     * @type {Integer (Int32)}
     */
    static Rotate90FlipX => 5

    /**
     * @type {Integer (Int32)}
     */
    static Rotate180FlipX => 6

    /**
     * @type {Integer (Int32)}
     */
    static Rotate270FlipX => 7

    /**
     * @type {Integer (Int32)}
     */
    static RotateNoneFlipY => 6

    /**
     * @type {Integer (Int32)}
     */
    static Rotate90FlipY => 7

    /**
     * @type {Integer (Int32)}
     */
    static Rotate180FlipY => 4

    /**
     * @type {Integer (Int32)}
     */
    static Rotate270FlipY => 5

    /**
     * @type {Integer (Int32)}
     */
    static RotateNoneFlipXY => 2

    /**
     * @type {Integer (Int32)}
     */
    static Rotate90FlipXY => 3

    /**
     * @type {Integer (Int32)}
     */
    static Rotate180FlipXY => 0

    /**
     * @type {Integer (Int32)}
     */
    static Rotate270FlipXY => 1
}
