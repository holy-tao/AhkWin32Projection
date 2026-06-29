#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Values for the D2D1_EDGEDETECTION_PROP_MODE property of the Edge Detection effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects_2/ne-d2d1effects_2-d2d1_edgedetection_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_EDGEDETECTION_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates the Sobel operator should be used for edge detection.
     * @type {Integer (Int32)}
     */
    static D2D1_EDGEDETECTION_MODE_SOBEL => 0

    /**
     * Indicates the Prewitt operator should be used for edge detection.
     * @type {Integer (Int32)}
     */
    static D2D1_EDGEDETECTION_MODE_PREWITT => 1
}
