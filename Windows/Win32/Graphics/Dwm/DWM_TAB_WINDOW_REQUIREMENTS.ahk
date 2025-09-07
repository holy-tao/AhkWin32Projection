#Requires AutoHotkey v2.0.0 64-bit

/**
 * This enumeration supported an experimental feature that was never implemented in Windows. It has no effect and should not be used.
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwm_tab_window_requirements
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class DWM_TAB_WINDOW_REQUIREMENTS{

    /**
     * This field is not used.
     * @type {Integer (Int32)}
     */
    static DWMTWR_NONE => 0

    /**
     * This field is not used.
     * @type {Integer (Int32)}
     */
    static DWMTWR_IMPLEMENTED_BY_SYSTEM => 1

    /**
     * This field is not used.
     * @type {Integer (Int32)}
     */
    static DWMTWR_WINDOW_RELATIONSHIP => 2

    /**
     * This field is not used.
     * @type {Integer (Int32)}
     */
    static DWMTWR_WINDOW_STYLES => 4

    /**
     * This field is not used.
     * @type {Integer (Int32)}
     */
    static DWMTWR_WINDOW_REGION => 8

    /**
     * This field is not used.
     * @type {Integer (Int32)}
     */
    static DWMTWR_WINDOW_DWM_ATTRIBUTES => 16

    /**
     * This field is not used.
     * @type {Integer (Int32)}
     */
    static DWMTWR_WINDOW_MARGINS => 32

    /**
     * This field is not used.
     * @type {Integer (Int32)}
     */
    static DWMTWR_TABBING_ENABLED => 64

    /**
     * This field is not used.
     * @type {Integer (Int32)}
     */
    static DWMTWR_USER_POLICY => 128

    /**
     * This field is not used.
     * @type {Integer (Int32)}
     */
    static DWMTWR_GROUP_POLICY => 256

    /**
     * This field is not used.
     * @type {Integer (Int32)}
     */
    static DWMTWR_APP_COMPAT => 512
}
