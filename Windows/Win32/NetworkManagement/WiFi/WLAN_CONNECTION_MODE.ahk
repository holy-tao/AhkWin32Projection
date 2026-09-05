#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the mode of connection.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_connection_mode
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WLAN_CONNECTION_MODE extends Win32Enum {

    /**
     * A profile will be used to make the connection.
     * Native name: wlan_connection_mode_profile
     * @type {Integer (Int32)}
     */
    static profile => 0

    /**
     * A temporary profile will be used to make the connection.
     * Native name: wlan_connection_mode_temporary_profile
     * @type {Integer (Int32)}
     */
    static temporary_profile => 1

    /**
     * Secure discovery will be used to make the connection.
     * Native name: wlan_connection_mode_discovery_secure
     * @type {Integer (Int32)}
     */
    static discovery_secure => 2

    /**
     * Unsecure discovery will be used to make the connection.
     * Native name: wlan_connection_mode_discovery_unsecure
     * @type {Integer (Int32)}
     */
    static discovery_unsecure => 3

    /**
     * The connection is initiated by the wireless service automatically using a persistent profile.
     * Native name: wlan_connection_mode_auto
     * @type {Integer (Int32)}
     */
    static auto => 4

    /**
     * Not used.
     * Native name: wlan_connection_mode_invalid
     * @type {Integer (Int32)}
     */
    static invalid => 5
}
