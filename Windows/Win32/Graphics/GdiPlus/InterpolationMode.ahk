#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The InterpolationMode enumeration specifies the algorithm that is used when images are scaled or rotated. This enumeration is used by the Graphics::GetInterpolationMode and Graphics::SetInterpolationMode methods of the Graphics class.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-interpolationmode
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class InterpolationMode extends Win32Enum{

    /**
     * Used internally
     * @type {Integer (Int32)}
     */
    static InterpolationModeInvalid => -1

    /**
     * Specifies the default interpolation mode.
     * @type {Integer (Int32)}
     */
    static InterpolationModeDefault => 0

    /**
     * Specifies a low-quality mode.
     * @type {Integer (Int32)}
     */
    static InterpolationModeLowQuality => 1

    /**
     * Specifies a high-quality mode.
     * @type {Integer (Int32)}
     */
    static InterpolationModeHighQuality => 2

    /**
     * Specifies bilinear interpolation. No prefiltering is done. This mode is not suitable for shrinking an image below 50 percent of its original size.
     * @type {Integer (Int32)}
     */
    static InterpolationModeBilinear => 3

    /**
     * Specifies bicubic interpolation. No prefiltering is done. This mode is not suitable for shrinking an image below 25 percent of its original size.
     * @type {Integer (Int32)}
     */
    static InterpolationModeBicubic => 4

    /**
     * Specifies nearest-neighbor interpolation.
     * @type {Integer (Int32)}
     */
    static InterpolationModeNearestNeighbor => 5

    /**
     * Specifies high-quality, bilinear interpolation. Prefiltering is performed to ensure high-quality shrinking.
     * @type {Integer (Int32)}
     */
    static InterpolationModeHighQualityBilinear => 6

    /**
     * Specifies high-quality, bicubic interpolation. Prefiltering is performed to ensure high-quality shrinking. This mode produces the highest quality transformed images.
     * @type {Integer (Int32)}
     */
    static InterpolationModeHighQualityBicubic => 7
}
