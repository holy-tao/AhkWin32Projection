#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the desktop wallpaper should be displayed.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-desktop_wallpaper_position
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DESKTOP_WALLPAPER_POSITION extends Win32Enum{

    /**
     * Center the image; do not stretch. This is equivalent to the <a href="https://docs.microsoft.com/windows/desktop/shell/iactivedesktop-flags">WPSTYLE_CENTER</a> style in <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-iactivedesktop">IActiveDesktop</a>.
     * @type {Integer (Int32)}
     */
    static DWPOS_CENTER => 0

    /**
     * Tile the image across all monitors. This is equivalent to the <a href="https://docs.microsoft.com/windows/desktop/shell/iactivedesktop-flags">WPSTYLE_TILE</a> style in <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-iactivedesktop">IActiveDesktop</a>.
     * @type {Integer (Int32)}
     */
    static DWPOS_TILE => 1

    /**
     * Stretch the image to exactly fit on the monitor. This is equivalent to the <a href="https://docs.microsoft.com/windows/desktop/shell/iactivedesktop-flags">WPSTYLE_STRETCH</a> style in <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-iactivedesktop">IActiveDesktop</a>.
     * @type {Integer (Int32)}
     */
    static DWPOS_STRETCH => 2

    /**
     * Stretch the image to exactly the height or width of the monitor without changing its aspect ratio or cropping the image. This can result in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getbackgroundcolor">colored letterbox bars</a> on either side or on above and below of the image. This is equivalent to the <a href="https://docs.microsoft.com/windows/desktop/shell/iactivedesktop-flags">WPSTYLE_KEEPASPECT</a> style in <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-iactivedesktop">IActiveDesktop</a>.
     * @type {Integer (Int32)}
     */
    static DWPOS_FIT => 3

    /**
     * Stretch the image to fill the screen, cropping the image as necessary to avoid letterbox bars. This is equivalent to the <a href="https://docs.microsoft.com/windows/desktop/shell/iactivedesktop-flags">WPSTYLE_CROPTOFIT</a> style in <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-iactivedesktop">IActiveDesktop</a>.
     * @type {Integer (Int32)}
     */
    static DWPOS_FILL => 4

    /**
     * Spans a single image across all monitors attached to the system. This flag has no <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-iactivedesktop">IActiveDesktop</a> equivalent.
     * @type {Integer (Int32)}
     */
    static DWPOS_SPAN => 5
}
