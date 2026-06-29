#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies support for overlay color space.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/ne-dxgi1_4-dxgi_overlay_color_space_support_flag
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_OVERLAY_COLOR_SPACE_SUPPORT_FLAG {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Overlay color space support is present.
     * @type {Integer (Int32)}
     */
    static DXGI_OVERLAY_COLOR_SPACE_SUPPORT_FLAG_PRESENT => 1
}
