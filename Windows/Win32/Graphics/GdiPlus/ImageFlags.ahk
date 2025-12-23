#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ImageFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsScalable => 1

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsHasAlpha => 2

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsHasTranslucent => 4

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsPartiallyScalable => 8

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsColorSpaceRGB => 16

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsColorSpaceCMYK => 32

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsColorSpaceGRAY => 64

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsColorSpaceYCBCR => 128

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsColorSpaceYCCK => 256

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsHasRealDPI => 4096

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsHasRealPixelSize => 8192

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsReadOnly => 65536

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsCaching => 131072
}
