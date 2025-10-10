#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VideoProcAmpProperty enumeration specifies video properties on a video capture device.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-videoprocampproperty
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VideoProcAmpProperty{

    /**
     * Specifies the brightness, also called the <i>black level</i>. For NTSC, the value is expressed in IRE units * 100. For non-NTSC sources, the units are arbitrary, with zero representing blanking and 10,000 representing pure white. Values range from –10,000 to 10,000.
     * @type {Integer (Int32)}
     */
    static VideoProcAmp_Brightness => 0

    /**
     * Specifies the contrast, expressed as gain factor * 100. Values range from zero to 10,000.
     * @type {Integer (Int32)}
     */
    static VideoProcAmp_Contrast => 1

    /**
     * Specifies the hue, in degrees * 100. Values range from -180,000 to 180,000 (-180 to +180 degrees).
     * @type {Integer (Int32)}
     */
    static VideoProcAmp_Hue => 2

    /**
     * Specifies the saturation. Values range from 0 to 10,000.
     * @type {Integer (Int32)}
     */
    static VideoProcAmp_Saturation => 3

    /**
     * Specifies the sharpness. Values range from 0 to 100.
     * @type {Integer (Int32)}
     */
    static VideoProcAmp_Sharpness => 4

    /**
     * Specifies the gamma, as gamma * 100. Values range from 1 to 500.
     * @type {Integer (Int32)}
     */
    static VideoProcAmp_Gamma => 5

    /**
     * Specifies the color enable setting. The possible values are 0 (off) and 1 (on).
     * @type {Integer (Int32)}
     */
    static VideoProcAmp_ColorEnable => 6

    /**
     * Specifies the white balance, as a color temperature in degrees Kelvin. The range of values depends on the device.
     * @type {Integer (Int32)}
     */
    static VideoProcAmp_WhiteBalance => 7

    /**
     * Specifies the backlight compensation setting. Possible values are 0 (off) and 1 (on).
     * @type {Integer (Int32)}
     */
    static VideoProcAmp_BacklightCompensation => 8

    /**
     * Specifies the gain adjustment. Zero is normal. Positive values are brighter and negative values are darker. The range of values depends on the device.
     * @type {Integer (Int32)}
     */
    static VideoProcAmp_Gain => 9
}
