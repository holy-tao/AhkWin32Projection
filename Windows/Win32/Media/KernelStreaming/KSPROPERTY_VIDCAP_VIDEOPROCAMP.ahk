#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_VIDCAP_VIDEOPROCAMP extends Win32Enum {

    /**
     * Native name: KSPROPERTY_VIDEOPROCAMP_BRIGHTNESS
     * @type {Integer (Int32)}
     */
    static BRIGHTNESS => 0

    /**
     * Native name: KSPROPERTY_VIDEOPROCAMP_CONTRAST
     * @type {Integer (Int32)}
     */
    static CONTRAST => 1

    /**
     * Native name: KSPROPERTY_VIDEOPROCAMP_HUE
     * @type {Integer (Int32)}
     */
    static HUE => 2

    /**
     * Native name: KSPROPERTY_VIDEOPROCAMP_SATURATION
     * @type {Integer (Int32)}
     */
    static SATURATION => 3

    /**
     * Native name: KSPROPERTY_VIDEOPROCAMP_SHARPNESS
     * @type {Integer (Int32)}
     */
    static SHARPNESS => 4

    /**
     * Native name: KSPROPERTY_VIDEOPROCAMP_GAMMA
     * @type {Integer (Int32)}
     */
    static GAMMA => 5

    /**
     * Native name: KSPROPERTY_VIDEOPROCAMP_COLORENABLE
     * @type {Integer (Int32)}
     */
    static COLORENABLE => 6

    /**
     * Native name: KSPROPERTY_VIDEOPROCAMP_WHITEBALANCE
     * @type {Integer (Int32)}
     */
    static WHITEBALANCE => 7

    /**
     * Native name: KSPROPERTY_VIDEOPROCAMP_BACKLIGHT_COMPENSATION
     * @type {Integer (Int32)}
     */
    static BACKLIGHT_COMPENSATION => 8

    /**
     * Native name: KSPROPERTY_VIDEOPROCAMP_GAIN
     * @type {Integer (Int32)}
     */
    static GAIN => 9

    /**
     * Native name: KSPROPERTY_VIDEOPROCAMP_DIGITAL_MULTIPLIER
     * @type {Integer (Int32)}
     */
    static DIGITAL_MULTIPLIER => 10

    /**
     * Native name: KSPROPERTY_VIDEOPROCAMP_DIGITAL_MULTIPLIER_LIMIT
     * @type {Integer (Int32)}
     */
    static DIGITAL_MULTIPLIER_LIMIT => 11

    /**
     * Native name: KSPROPERTY_VIDEOPROCAMP_WHITEBALANCE_COMPONENT
     * @type {Integer (Int32)}
     */
    static WHITEBALANCE_COMPONENT => 12

    /**
     * Native name: KSPROPERTY_VIDEOPROCAMP_POWERLINE_FREQUENCY
     * @type {Integer (Int32)}
     */
    static POWERLINE_FREQUENCY => 13
}
