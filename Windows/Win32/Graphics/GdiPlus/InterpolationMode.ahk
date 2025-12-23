#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class InterpolationMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static InterpolationModeInvalid => -1

    /**
     * @type {Integer (Int32)}
     */
    static InterpolationModeDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static InterpolationModeLowQuality => 1

    /**
     * @type {Integer (Int32)}
     */
    static InterpolationModeHighQuality => 2

    /**
     * @type {Integer (Int32)}
     */
    static InterpolationModeBilinear => 3

    /**
     * @type {Integer (Int32)}
     */
    static InterpolationModeBicubic => 4

    /**
     * @type {Integer (Int32)}
     */
    static InterpolationModeNearestNeighbor => 5

    /**
     * @type {Integer (Int32)}
     */
    static InterpolationModeHighQualityBilinear => 6

    /**
     * @type {Integer (Int32)}
     */
    static InterpolationModeHighQualityBicubic => 7
}
