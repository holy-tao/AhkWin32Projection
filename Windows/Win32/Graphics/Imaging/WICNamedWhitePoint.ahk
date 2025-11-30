#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies named white balances for raw images.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicnamedwhitepoint
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICNamedWhitePoint extends Win32Enum{

    /**
     * The default white balance.
     * @type {Integer (Int32)}
     */
    static WICWhitePointDefault => 1

    /**
     * A daylight white balance.
     * @type {Integer (Int32)}
     */
    static WICWhitePointDaylight => 2

    /**
     * A cloudy white balance.
     * @type {Integer (Int32)}
     */
    static WICWhitePointCloudy => 4

    /**
     * A shade white balance.
     * @type {Integer (Int32)}
     */
    static WICWhitePointShade => 8

    /**
     * A tungsten white balance.
     * @type {Integer (Int32)}
     */
    static WICWhitePointTungsten => 16

    /**
     * A fluorescent white balance.
     * @type {Integer (Int32)}
     */
    static WICWhitePointFluorescent => 32

    /**
     * Daylight white balance.
     * @type {Integer (Int32)}
     */
    static WICWhitePointFlash => 64

    /**
     * A flash white balance.
     * @type {Integer (Int32)}
     */
    static WICWhitePointUnderwater => 128

    /**
     * A custom white balance. This is typically used when using a picture (grey-card) as white balance.
     * @type {Integer (Int32)}
     */
    static WICWhitePointCustom => 256

    /**
     * An automatic balance.
     * @type {Integer (Int32)}
     */
    static WICWhitePointAutoWhiteBalance => 512

    /**
     * An "as shot" white balance.
     * @type {Integer (Int32)}
     */
    static WICWhitePointAsShot => 1
}
