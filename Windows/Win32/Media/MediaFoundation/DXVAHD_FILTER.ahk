#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies image filters for Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processing.
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ne-dxvahd-dxvahd_filter
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_FILTER extends Win32Enum{

    /**
     * Adjusts brightness.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FILTER_BRIGHTNESS => 0

    /**
     * Adjusts contrast.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FILTER_CONTRAST => 1

    /**
     * Adjusts hue.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FILTER_HUE => 2

    /**
     * Adjusts saturation.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FILTER_SATURATION => 3

    /**
     * Applies noise reduction.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FILTER_NOISE_REDUCTION => 4

    /**
     * Applies edge enhancement.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FILTER_EDGE_ENHANCEMENT => 5

    /**
     * Performs <i>anamorphic scaling</i>. Anamorphic scaling can be used to stretch 4:3 content to a widescreen 16:9 aspect ratio.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FILTER_ANAMORPHIC_SCALING => 6
}
