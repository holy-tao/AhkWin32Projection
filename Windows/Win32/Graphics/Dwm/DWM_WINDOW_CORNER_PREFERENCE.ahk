#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DWM_WINDOW_CORNER_PREFERENCE enumeration (dwmapi.h) specifies the rounded corner preference for a window.
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwm_window_corner_preference
 * @namespace Windows.Win32.Graphics.Dwm
 */
export default struct DWM_WINDOW_CORNER_PREFERENCE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Let the system decide when to round window corners.
     * @type {Integer (Int32)}
     */
    static DWMWCP_DEFAULT => 0

    /**
     * Never round window corners.
     * @type {Integer (Int32)}
     */
    static DWMWCP_DONOTROUND => 1

    /**
     * Round the corners, if appropriate.
     * @type {Integer (Int32)}
     */
    static DWMWCP_ROUND => 2

    /**
     * Round the corners if appropriate, with a small radius.
     * @type {Integer (Int32)}
     */
    static DWMWCP_ROUNDSMALL => 3
}
