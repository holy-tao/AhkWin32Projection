#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies which way a color profile is defined.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ne-d2d1_3-d2d1_color_context_type
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_COLOR_CONTEXT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_COLOR_CONTEXT_TYPE_ICC => 0

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_COLOR_CONTEXT_TYPE_SIMPLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_COLOR_CONTEXT_TYPE_DXGI => 2
}
