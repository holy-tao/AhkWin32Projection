#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies image filters for Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processing.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ne-dxvahd-dxvahd_filter
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVAHD_FILTER extends Win32Enum {

    /**
     * Adjusts brightness.
     * Native name: DXVAHD_FILTER_BRIGHTNESS
     * @type {Integer (Int32)}
     */
    static BRIGHTNESS => 0

    /**
     * Adjusts contrast.
     * Native name: DXVAHD_FILTER_CONTRAST
     * @type {Integer (Int32)}
     */
    static CONTRAST => 1

    /**
     * Adjusts hue.
     * Native name: DXVAHD_FILTER_HUE
     * @type {Integer (Int32)}
     */
    static HUE => 2

    /**
     * Adjusts saturation.
     * Native name: DXVAHD_FILTER_SATURATION
     * @type {Integer (Int32)}
     */
    static SATURATION => 3

    /**
     * Applies noise reduction.
     * Native name: DXVAHD_FILTER_NOISE_REDUCTION
     * @type {Integer (Int32)}
     */
    static NOISE_REDUCTION => 4

    /**
     * Applies edge enhancement.
     * Native name: DXVAHD_FILTER_EDGE_ENHANCEMENT
     * @type {Integer (Int32)}
     */
    static EDGE_ENHANCEMENT => 5

    /**
     * Performs <i>anamorphic scaling</i>. Anamorphic scaling can be used to stretch 4:3 content to a widescreen 16:9 aspect ratio.
     * Native name: DXVAHD_FILTER_ANAMORPHIC_SCALING
     * @type {Integer (Int32)}
     */
    static ANAMORPHIC_SCALING => 6
}
