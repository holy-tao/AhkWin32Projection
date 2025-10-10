#Requires AutoHotkey v2.0.0 64-bit

/**
 * These flags are used with IExplorerBrowser::GetOptions and IExplorerBrowser::SetOptions.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-explorer_browser_options
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class EXPLORER_BROWSER_OPTIONS{

    /**
     * No options.
     * @type {Integer (Int32)}
     */
    static EBO_NONE => 0

    /**
     * Do not navigate further than the initial navigation.
     * @type {Integer (Int32)}
     */
    static EBO_NAVIGATEONCE => 1

    /**
     * Use the following standard panes: Commands Module pane, Navigation pane, Details pane, and Preview pane. An implementer of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexplorerpanevisibility">IExplorerPaneVisibility</a> can modify the components of the Commands Module that  are shown. For more information see, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerpanevisibility-getpanestate">IExplorerPaneVisibility::GetPaneState</a>. If EBO_SHOWFRAMES is not set, Explorer browser uses a single view object.
     * @type {Integer (Int32)}
     */
    static EBO_SHOWFRAMES => 2

    /**
     * Always navigate, even if you are attempting to navigate to the current folder.
     * @type {Integer (Int32)}
     */
    static EBO_ALWAYSNAVIGATE => 4

    /**
     * Do not update the travel log.
     * @type {Integer (Int32)}
     */
    static EBO_NOTRAVELLOG => 8

    /**
     * Do not use a wrapper window. This flag is used with legacy clients that need the browser parented directly on themselves.
     * @type {Integer (Int32)}
     */
    static EBO_NOWRAPPERWINDOW => 16

    /**
     * Show WebView for sharepoint sites.
     * @type {Integer (Int32)}
     */
    static EBO_HTMLSHAREPOINTVIEW => 32

    /**
     * <b>Introduced in Windows Vista</b>. Do not draw a border around the browser window.
     * @type {Integer (Int32)}
     */
    static EBO_NOBORDER => 64

    /**
     * <b>Introduced in Windows Vista</b>. Do not persist the view state.
     * @type {Integer (Int32)}
     */
    static EBO_NOPERSISTVIEWSTATE => 128
}
