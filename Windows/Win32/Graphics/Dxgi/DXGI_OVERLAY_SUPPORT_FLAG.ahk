#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies overlay support to check for in a call to IDXGIOutput3::CheckOverlaySupport.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/ne-dxgi1_3-dxgi_overlay_support_flag
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_OVERLAY_SUPPORT_FLAG {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Direct overlay support.
     * @type {Integer (Int32)}
     */
    static DXGI_OVERLAY_SUPPORT_FLAG_DIRECT => 1

    /**
     * Scaling overlay support.
     * @type {Integer (Int32)}
     */
    static DXGI_OVERLAY_SUPPORT_FLAG_SCALING => 2
}
