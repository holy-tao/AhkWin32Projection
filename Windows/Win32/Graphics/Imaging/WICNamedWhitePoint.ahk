#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies named white balances for raw images.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicnamedwhitepoint
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICNamedWhitePoint extends Win32Enum {

    /**
     * The default white balance.
     * Native name: WICWhitePointDefault
     * @type {Integer (Int32)}
     */
    static Default => 1

    /**
     * A daylight white balance.
     * Native name: WICWhitePointDaylight
     * @type {Integer (Int32)}
     */
    static Daylight => 2

    /**
     * A cloudy white balance.
     * Native name: WICWhitePointCloudy
     * @type {Integer (Int32)}
     */
    static Cloudy => 4

    /**
     * A shade white balance.
     * Native name: WICWhitePointShade
     * @type {Integer (Int32)}
     */
    static Shade => 8

    /**
     * A tungsten white balance.
     * Native name: WICWhitePointTungsten
     * @type {Integer (Int32)}
     */
    static Tungsten => 16

    /**
     * A fluorescent white balance.
     * Native name: WICWhitePointFluorescent
     * @type {Integer (Int32)}
     */
    static Fluorescent => 32

    /**
     * Daylight white balance.
     * Native name: WICWhitePointFlash
     * @type {Integer (Int32)}
     */
    static Flash => 64

    /**
     * A flash white balance.
     * Native name: WICWhitePointUnderwater
     * @type {Integer (Int32)}
     */
    static Underwater => 128

    /**
     * A custom white balance. This is typically used when using a picture (grey-card) as white balance.
     * Native name: WICWhitePointCustom
     * @type {Integer (Int32)}
     */
    static Custom => 256

    /**
     * An automatic balance.
     * Native name: WICWhitePointAutoWhiteBalance
     * @type {Integer (Int32)}
     */
    static AutoWhiteBalance => 512

    /**
     * An "as shot" white balance.
     * Native name: WICWhitePointAsShot
     * @type {Integer (Int32)}
     */
    static AsShot => 1
}
