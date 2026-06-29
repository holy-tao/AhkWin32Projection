#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies image filters for Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processing.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ne-dxvahd-dxvahd_filter
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_FILTER {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
