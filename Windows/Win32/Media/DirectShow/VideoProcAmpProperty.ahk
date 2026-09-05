#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VideoProcAmpProperty enumeration specifies video properties on a video capture device.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-videoprocampproperty
 * @namespace Windows.Win32.Media.DirectShow
 */
class VideoProcAmpProperty extends Win32Enum {

    /**
     * Specifies the brightness, also called the <i>black level</i>. For NTSC, the value is expressed in IRE units * 100. For non-NTSC sources, the units are arbitrary, with zero representing blanking and 10,000 representing pure white. Values range from –10,000 to 10,000.
     * Native name: VideoProcAmp_Brightness
     * @type {Integer (Int32)}
     */
    static Brightness => 0

    /**
     * Specifies the contrast, expressed as gain factor * 100. Values range from zero to 10,000.
     * Native name: VideoProcAmp_Contrast
     * @type {Integer (Int32)}
     */
    static Contrast => 1

    /**
     * Specifies the hue, in degrees * 100. Values range from -180,000 to 180,000 (-180 to +180 degrees).
     * Native name: VideoProcAmp_Hue
     * @type {Integer (Int32)}
     */
    static Hue => 2

    /**
     * Specifies the saturation. Values range from 0 to 10,000.
     * Native name: VideoProcAmp_Saturation
     * @type {Integer (Int32)}
     */
    static Saturation => 3

    /**
     * Specifies the sharpness. Values range from 0 to 100.
     * Native name: VideoProcAmp_Sharpness
     * @type {Integer (Int32)}
     */
    static Sharpness => 4

    /**
     * Specifies the gamma, as gamma * 100. Values range from 1 to 500.
     * Native name: VideoProcAmp_Gamma
     * @type {Integer (Int32)}
     */
    static Gamma => 5

    /**
     * Specifies the color enable setting. The possible values are 0 (off) and 1 (on).
     * Native name: VideoProcAmp_ColorEnable
     * @type {Integer (Int32)}
     */
    static ColorEnable => 6

    /**
     * Specifies the white balance, as a color temperature in degrees Kelvin. The range of values depends on the device.
     * Native name: VideoProcAmp_WhiteBalance
     * @type {Integer (Int32)}
     */
    static WhiteBalance => 7

    /**
     * Specifies the backlight compensation setting. Possible values are 0 (off) and 1 (on).
     * Native name: VideoProcAmp_BacklightCompensation
     * @type {Integer (Int32)}
     */
    static BacklightCompensation => 8

    /**
     * Specifies the gain adjustment. Zero is normal. Positive values are brighter and negative values are darker. The range of values depends on the device.
     * Native name: VideoProcAmp_Gain
     * @type {Integer (Int32)}
     */
    static Gain => 9
}
