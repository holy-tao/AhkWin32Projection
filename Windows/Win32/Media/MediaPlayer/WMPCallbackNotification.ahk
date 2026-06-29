#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://learn.microsoft.com/windows/win32/api/contentpartner/ne-contentpartner-wmpcallbacknotification
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct WMPCallbackNotification {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The user has either signed in or signed out.
     * @type {Integer (Int32)}
     */
    static wmpcnLoginStateChange => 1

    /**
     * The notification contains the result of an authentication attempt.
     * @type {Integer (Int32)}
     */
    static wmpcnAuthResult => 2

    /**
     * A license was updated for a content item.
     * @type {Integer (Int32)}
     */
    static wmpcnLicenseUpdated => 3

    /**
     * A new catalog or update is available for download.
     * @type {Integer (Int32)}
     */
    static wmpcnNewCatalogAvailable => 4

    /**
     * A new plug-in or update is available for download.
     * @type {Integer (Int32)}
     */
    static wmpcnNewPluginAvailable => 5

    /**
     * Disable radio skipping in Windows Media Player.
     * @type {Integer (Int32)}
     */
    static wmpcnDisableRadioSkipping => 6
}
