#Requires AutoHotkey v2.0.0 64-bit

/**
 * The CurveChannel enumeration specifies which color channels are affected by a ColorCurve bitmap adjustment.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluseffects/ne-gdipluseffects-curvechannel
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class CurveChannel{

    /**
     * Specifies that the color adjustment applies to all channels.
     * @type {Integer (Int32)}
     */
    static CurveChannelAll => 0

    /**
     * Specifies that the color adjustment applies only to the red channel.
     * @type {Integer (Int32)}
     */
    static CurveChannelRed => 1

    /**
     * Specifies that the color adjustment applies only to the green channel.
     * @type {Integer (Int32)}
     */
    static CurveChannelGreen => 2

    /**
     * Specifies that the color adjustment applies only to the blue channel.
     * @type {Integer (Int32)}
     */
    static CurveChannelBlue => 3
}
