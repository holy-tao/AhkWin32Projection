#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of media for a connection.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ne-wcmapi-wcm_media_type
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
class WCM_MEDIA_TYPE extends Win32Enum {

    /**
     * Unknown media.
     * Native name: wcm_media_unknown
     * @type {Integer (Int32)}
     */
    static unknown => 0

    /**
     * Ethernet.
     * Native name: wcm_media_ethernet
     * @type {Integer (Int32)}
     */
    static ethernet => 1

    /**
     * WLAN.
     * Native name: wcm_media_wlan
     * @type {Integer (Int32)}
     */
    static wlan => 2

    /**
     * Mobile broadband.
     * Native name: wcm_media_mbn
     * @type {Integer (Int32)}
     */
    static mbn => 3

    /**
     * Invalid type.
     * Native name: wcm_media_invalid
     * @type {Integer (Int32)}
     */
    static invalid => 4

    /**
     * Maximum value for testing purposes.
     * Native name: wcm_media_max
     * @type {Integer (Int32)}
     */
    static max => 5
}
