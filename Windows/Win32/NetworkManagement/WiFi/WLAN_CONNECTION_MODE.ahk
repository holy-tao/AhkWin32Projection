#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the mode of connection.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_connection_mode
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_CONNECTION_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A profile will be used to make the connection.
     * @type {Integer (Int32)}
     */
    static wlan_connection_mode_profile => 0

    /**
     * A temporary profile will be used to make the connection.
     * @type {Integer (Int32)}
     */
    static wlan_connection_mode_temporary_profile => 1

    /**
     * Secure discovery will be used to make the connection.
     * @type {Integer (Int32)}
     */
    static wlan_connection_mode_discovery_secure => 2

    /**
     * Unsecure discovery will be used to make the connection.
     * @type {Integer (Int32)}
     */
    static wlan_connection_mode_discovery_unsecure => 3

    /**
     * The connection is initiated by the wireless service automatically using a persistent profile.
     * @type {Integer (Int32)}
     */
    static wlan_connection_mode_auto => 4

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static wlan_connection_mode_invalid => 5
}
