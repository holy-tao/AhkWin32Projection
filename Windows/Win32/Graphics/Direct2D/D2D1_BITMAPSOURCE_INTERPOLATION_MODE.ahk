#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The interpolation mode used to scale the image in the Bitmap source effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_bitmapsource_interpolation_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_BITMAPSOURCE_INTERPOLATION_MODE extends Win32Enum{

    /**
     * Samples the nearest single point and uses that. Doesn't generate a mipmap.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_INTERPOLATION_MODE_NEAREST_NEIGHBOR => 0

    /**
     * Uses a four point sample and linear interpolation. Doesn't generate a mipmap.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_INTERPOLATION_MODE_LINEAR => 1

    /**
     * Uses a 16 sample cubic kernel for interpolation. Doesn't generate a mipmap.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_INTERPOLATION_MODE_CUBIC => 2

    /**
     * Uses the WIC fant interpolation, the same as the IWICBitmapScaler interface. Doesn't generate a mipmap.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_INTERPOLATION_MODE_FANT => 6

    /**
     * Generates mipmap chain in system memory using bilinear interpolation. For each mipmap the effect scales to the nearest multiple of 0.5 using bilinear interpolation 
     *           and then scales the remaining amount using linear interpolation.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_INTERPOLATION_MODE_MIPMAP_LINEAR => 7
}
