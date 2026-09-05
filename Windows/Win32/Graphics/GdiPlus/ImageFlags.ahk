#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ImageFlags extends Win32Enum {

    /**
     * Native name: ImageFlagsNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: ImageFlagsScalable
     * @type {Integer (Int32)}
     */
    static Scalable => 1

    /**
     * Native name: ImageFlagsHasAlpha
     * @type {Integer (Int32)}
     */
    static HasAlpha => 2

    /**
     * Native name: ImageFlagsHasTranslucent
     * @type {Integer (Int32)}
     */
    static HasTranslucent => 4

    /**
     * Native name: ImageFlagsPartiallyScalable
     * @type {Integer (Int32)}
     */
    static PartiallyScalable => 8

    /**
     * Native name: ImageFlagsColorSpaceRGB
     * @type {Integer (Int32)}
     */
    static ColorSpaceRGB => 16

    /**
     * Native name: ImageFlagsColorSpaceCMYK
     * @type {Integer (Int32)}
     */
    static ColorSpaceCMYK => 32

    /**
     * Native name: ImageFlagsColorSpaceGRAY
     * @type {Integer (Int32)}
     */
    static ColorSpaceGRAY => 64

    /**
     * Native name: ImageFlagsColorSpaceYCBCR
     * @type {Integer (Int32)}
     */
    static ColorSpaceYCBCR => 128

    /**
     * Native name: ImageFlagsColorSpaceYCCK
     * @type {Integer (Int32)}
     */
    static ColorSpaceYCCK => 256

    /**
     * Native name: ImageFlagsHasRealDPI
     * @type {Integer (Int32)}
     */
    static HasRealDPI => 4096

    /**
     * Native name: ImageFlagsHasRealPixelSize
     * @type {Integer (Int32)}
     */
    static HasRealPixelSize => 8192

    /**
     * Native name: ImageFlagsReadOnly
     * @type {Integer (Int32)}
     */
    static ReadOnly => 65536

    /**
     * Native name: ImageFlagsCaching
     * @type {Integer (Int32)}
     */
    static Caching => 131072
}
