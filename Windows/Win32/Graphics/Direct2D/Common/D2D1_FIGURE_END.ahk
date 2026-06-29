#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates whether a specific ID2D1SimplifiedGeometrySink figure is open or closed.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_figure_end
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
export default struct D2D1_FIGURE_END {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The figure is open.
     * @type {Integer (Int32)}
     */
    static D2D1_FIGURE_END_OPEN => 0

    /**
     * The figure is closed.
     * @type {Integer (Int32)}
     */
    static D2D1_FIGURE_END_CLOSED => 1
}
