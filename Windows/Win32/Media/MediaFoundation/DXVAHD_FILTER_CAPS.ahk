#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines capabilities related to image adjustment and filtering for a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ne-dxvahd-dxvahd_filter_caps
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVAHD_FILTER_CAPS extends Win32Enum {

    /**
     * The device can adjust the brightness level.
     * Native name: DXVAHD_FILTER_CAPS_BRIGHTNESS
     * @type {Integer (Int32)}
     */
    static BRIGHTNESS => 1

    /**
     * The device can adjust the contrast level.
     * Native name: DXVAHD_FILTER_CAPS_CONTRAST
     * @type {Integer (Int32)}
     */
    static CONTRAST => 2

    /**
     * The device can adjust hue.
     * Native name: DXVAHD_FILTER_CAPS_HUE
     * @type {Integer (Int32)}
     */
    static HUE => 4

    /**
     * The device can adjust the saturation level.
     * Native name: DXVAHD_FILTER_CAPS_SATURATION
     * @type {Integer (Int32)}
     */
    static SATURATION => 8

    /**
     * The device can perform noise reduction.
     * Native name: DXVAHD_FILTER_CAPS_NOISE_REDUCTION
     * @type {Integer (Int32)}
     */
    static NOISE_REDUCTION => 16

    /**
     * The device can perform edge enhancement.
     * Native name: DXVAHD_FILTER_CAPS_EDGE_ENHANCEMENT
     * @type {Integer (Int32)}
     */
    static EDGE_ENHANCEMENT => 32

    /**
     * The device can perform <i>anamorphic scaling</i>. Anamorphic scaling can be used to stretch 4:3 content to a widescreen 16:9 aspect ratio.
     * Native name: DXVAHD_FILTER_CAPS_ANAMORPHIC_SCALING
     * @type {Integer (Int32)}
     */
    static ANAMORPHIC_SCALING => 64
}
