#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the active tab when the wireless profile user interface dialog box appears.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wl_display_pages
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WL_DISPLAY_PAGES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Displays the <b>Connection</b> tab.
     * @type {Integer (Int32)}
     */
    static WLConnectionPage => 0

    /**
     * Displays the <b>Security</b> tab.
     * @type {Integer (Int32)}
     */
    static WLSecurityPage => 1

    /**
     * @type {Integer (Int32)}
     */
    static WLAdvPage => 2
}
