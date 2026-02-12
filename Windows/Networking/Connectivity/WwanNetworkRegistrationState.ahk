#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the network registration states for a WWAN connection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.wwannetworkregistrationstate
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class WwanNetworkRegistrationState extends Win32Enum{

    /**
     * No networks found for this connection.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The connection is not registered with a network.
     * @type {Integer (Int32)}
     */
    static Deregistered => 1

    /**
     * Searching for available networks.
     * @type {Integer (Int32)}
     */
    static Searching => 2

    /**
     * The connection is registered with a home network.
     * @type {Integer (Int32)}
     */
    static Home => 3

    /**
     * The connection is registered with a roaming network.
     * @type {Integer (Int32)}
     */
    static Roaming => 4

    /**
     * The connection is registered with a roaming network partner.
     * @type {Integer (Int32)}
     */
    static Partner => 5

    /**
     * Registration of the connection with all available networks is denied. However, emergency voice calls may still be made. This value applies only to voice connections, and not to data connections.
     * @type {Integer (Int32)}
     */
    static Denied => 6
}
