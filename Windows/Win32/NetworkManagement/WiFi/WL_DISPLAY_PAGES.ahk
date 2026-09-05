#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the active tab when the wireless profile user interface dialog box appears.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wl_display_pages
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WL_DISPLAY_PAGES extends Win32Enum {

    /**
     * Displays the <b>Connection</b> tab.
     * Native name: WLConnectionPage
     * @type {Integer (Int32)}
     */
    static ConnectionPage => 0

    /**
     * Displays the <b>Security</b> tab.
     * Native name: WLSecurityPage
     * @type {Integer (Int32)}
     */
    static SecurityPage => 1

    /**
     * Native name: WLAdvPage
     * @type {Integer (Int32)}
     */
    static AdvPage => 2
}
