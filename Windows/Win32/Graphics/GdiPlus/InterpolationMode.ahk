#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class InterpolationMode extends Win32Enum {

    /**
     * Native name: InterpolationModeInvalid
     * @type {Integer (Int32)}
     */
    static Invalid => -1

    /**
     * Native name: InterpolationModeDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: InterpolationModeLowQuality
     * @type {Integer (Int32)}
     */
    static LowQuality => 1

    /**
     * Native name: InterpolationModeHighQuality
     * @type {Integer (Int32)}
     */
    static HighQuality => 2

    /**
     * Native name: InterpolationModeBilinear
     * @type {Integer (Int32)}
     */
    static Bilinear => 3

    /**
     * Native name: InterpolationModeBicubic
     * @type {Integer (Int32)}
     */
    static Bicubic => 4

    /**
     * Native name: InterpolationModeNearestNeighbor
     * @type {Integer (Int32)}
     */
    static NearestNeighbor => 5

    /**
     * Native name: InterpolationModeHighQualityBilinear
     * @type {Integer (Int32)}
     */
    static HighQualityBilinear => 6

    /**
     * Native name: InterpolationModeHighQualityBicubic
     * @type {Integer (Int32)}
     */
    static HighQualityBicubic => 7
}
