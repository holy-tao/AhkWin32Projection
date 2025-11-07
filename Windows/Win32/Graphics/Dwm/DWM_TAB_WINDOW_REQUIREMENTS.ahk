#Requires AutoHotkey v2.0.0 64-bit

/**
 * Returned by DwmGetUnmetTabRequirements to indicate the requirements needed for a window to put tabs in the application title bar.
 * @see https://docs.microsoft.com/windows/win32/api//dwmapi/ne-dwmapi-dwm_tab_window_requirements
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class DWM_TAB_WINDOW_REQUIREMENTS{

    /**
     * The window meets all requirements requested.
     * @type {Integer (Int32)}
     */
    static DWMTWR_NONE => 0

    /**
     * In some configurations, the admin/user setting or mode of the system means that windows won't be tabbed. This requirement indicates that the system mode must implement tabbing. If the system does not implement tabbing, nothing can be done to change this.
     * @type {Integer (Int32)}
     */
    static DWMTWR_IMPLEMENTED_BY_SYSTEM => 1

    /**
     * The window has an owner or parent, and is therefore ineligible for tabbing.
     * @type {Integer (Int32)}
     */
    static DWMTWR_WINDOW_RELATIONSHIP => 2

    /**
     * The window has one or more styles that make it ineligible for tabbing.
     * 
     * 
     * To be eligible for tabbing, a window must:
     * 
     * <ul>
     * <li>Have the <b>WS_OVERLAPPEDWINDOW</b> (such as <b>WS_CAPTION</b>, <b>WS_THICKFRAME</b>, etc.) styles set.</li>
     * <li>Not have <b>WS_POPUP</b>, <b>WS_CHILD</b> or <b>WS_DLGFRAME</b> set.</li>
     * <li>Not have <b>WS_EX_TOPMOST</b> or <b>WS_EX_TOOLWINDOW</b> set.
     * </li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static DWMTWR_WINDOW_STYLES => 4

    /**
     * The window has a region (set using <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwindowrgn">SetWindowRgn</a>) making it ineligible.
     * @type {Integer (Int32)}
     */
    static DWMTWR_WINDOW_REGION => 8

    /**
     * The window is ineligible due to its Dwm configuration.
     * 
     * To resolve this issue, the window must not extended its client area into the title bar using <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmextendframeintoclientarea">DwmExtendFrameIntoClientArea</a>. In addition, the window must not have <b>DWMWA_NCRENDERING_POLICY</b> set to <b>DWMNCRP_ENABLED</b>.
     * @type {Integer (Int32)}
     */
    static DWMTWR_WINDOW_DWM_ATTRIBUTES => 16

    /**
     * The window is ineligible due to its margins, most likely due to custom handling in <b>WM_NCCALCSIZE</b>. 
     * 
     * To resolve this issue, the window must use the default window margins for the non-client area.
     * @type {Integer (Int32)}
     */
    static DWMTWR_WINDOW_MARGINS => 32

    /**
     * The window has been explicitly opted out by setting <b>DWMWA_TABBING_ENABLED</b> to false.
     * @type {Integer (Int32)}
     */
    static DWMTWR_TABBING_ENABLED => 64

    /**
     * The user has configured this application to not participate in tabbing.
     * @type {Integer (Int32)}
     */
    static DWMTWR_USER_POLICY => 128

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWMTWR_GROUP_POLICY => 256

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWMTWR_APP_COMPAT => 512
}
