#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of media for a connection.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ne-wcmapi-wcm_media_type
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
export default struct WCM_MEDIA_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Unknown media.
     * @type {Integer (Int32)}
     */
    static wcm_media_unknown => 0

    /**
     * Ethernet.
     * @type {Integer (Int32)}
     */
    static wcm_media_ethernet => 1

    /**
     * WLAN.
     * @type {Integer (Int32)}
     */
    static wcm_media_wlan => 2

    /**
     * Mobile broadband.
     * @type {Integer (Int32)}
     */
    static wcm_media_mbn => 3

    /**
     * Invalid type.
     * @type {Integer (Int32)}
     */
    static wcm_media_invalid => 4

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static wcm_media_max => 5
}
