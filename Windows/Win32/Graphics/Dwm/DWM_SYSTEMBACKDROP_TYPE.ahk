#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags for specifying the system-drawn backdrop material of a window, including behind the non-client area.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwm_systembackdrop_type
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class DWM_SYSTEMBACKDROP_TYPE{

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
