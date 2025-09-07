#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines capabilities related to image adjustment and filtering for a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ne-dxvahd-dxvahd_filter_caps
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_FILTER_CAPS{

    /**
     * The device can adjust the brightness level.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FILTER_CAPS_BRIGHTNESS => 1

    /**
     * The device can adjust the contrast level.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FILTER_CAPS_CONTRAST => 2

    /**
     * The device can adjust hue.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FILTER_CAPS_HUE => 4

    /**
     * The device can adjust the saturation level.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FILTER_CAPS_SATURATION => 8

    /**
     * The device can perform noise reduction.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FILTER_CAPS_NOISE_REDUCTION => 16

    /**
     * The device can perform edge enhancement.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FILTER_CAPS_EDGE_ENHANCEMENT => 32

    /**
     * The device can perform <i>anamorphic scaling</i>. Anamorphic scaling can be used to stretch 4:3 content to a widescreen 16:9 aspect ratio.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FILTER_CAPS_ANAMORPHIC_SCALING => 64
}
