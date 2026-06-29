#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags for specifying the system-drawn backdrop material of a window, including behind the non-client area.
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwm_systembackdrop_type
 * @namespace Windows.Win32.Graphics.Dwm
 */
export default struct DWM_SYSTEMBACKDROP_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The default. Let the Desktop Window Manager (DWM) automatically decide the system-drawn backdrop material for this window.
     * @type {Integer (Int32)}
     */
    static DWMSBT_AUTO => 0

    /**
     * Don't draw any system backdrop.
     * @type {Integer (Int32)}
     */
    static DWMSBT_NONE => 1

    /**
     * Draw the backdrop material effect corresponding to a long-lived window.
     * @type {Integer (Int32)}
     */
    static DWMSBT_MAINWINDOW => 2

    /**
     * Draw the backdrop material effect corresponding to a transient window.
     * @type {Integer (Int32)}
     */
    static DWMSBT_TRANSIENTWINDOW => 3

    /**
     * Draw the backdrop material effect corresponding to a window with a tabbed title bar.
     * @type {Integer (Int32)}
     */
    static DWMSBT_TABBEDWINDOW => 4
}
