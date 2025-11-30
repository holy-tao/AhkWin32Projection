#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_VIDCAP_VIDEOPROCAMP extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOPROCAMP_BRIGHTNESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOPROCAMP_CONTRAST => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOPROCAMP_HUE => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOPROCAMP_SATURATION => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOPROCAMP_SHARPNESS => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOPROCAMP_GAMMA => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOPROCAMP_COLORENABLE => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOPROCAMP_WHITEBALANCE => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOPROCAMP_BACKLIGHT_COMPENSATION => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOPROCAMP_GAIN => 9

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOPROCAMP_DIGITAL_MULTIPLIER => 10

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOPROCAMP_DIGITAL_MULTIPLIER_LIMIT => 11

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOPROCAMP_WHITEBALANCE_COMPONENT => 12

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOPROCAMP_POWERLINE_FREQUENCY => 13
}
