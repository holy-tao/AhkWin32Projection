#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of media for a connection.
 * @see https://docs.microsoft.com/windows/win32/api//wcmapi/ne-wcmapi-wcm_media_type
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 * @version v4.0.30319
 */
class WCM_MEDIA_TYPE extends Win32Enum{

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
