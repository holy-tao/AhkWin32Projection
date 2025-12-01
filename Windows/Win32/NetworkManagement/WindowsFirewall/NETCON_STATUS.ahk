#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NETCON_STATUS type enumerates possible status conditions for a network connection.
 * @see https://learn.microsoft.com/windows/win32/api/netcon/ne-netcon-netcon_status
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NETCON_STATUS extends Win32Enum{

    /**
     * The connection is disconnected.
     * @type {Integer (Int32)}
     */
    static NCS_DISCONNECTED => 0

    /**
     * The connection is in the process of connecting.
     * @type {Integer (Int32)}
     */
    static NCS_CONNECTING => 1

    /**
     * The connection is in a connected state.
     * @type {Integer (Int32)}
     */
    static NCS_CONNECTED => 2

    /**
     * The connection is in the process of disconnecting.
     * @type {Integer (Int32)}
     */
    static NCS_DISCONNECTING => 3

    /**
     * The hardware for the connection, for example network interface card (NIC), is not present.
     * @type {Integer (Int32)}
     */
    static NCS_HARDWARE_NOT_PRESENT => 4

    /**
     * The hardware for the connection is present, but is not enabled.
     * @type {Integer (Int32)}
     */
    static NCS_HARDWARE_DISABLED => 5

    /**
     * A malfunction has occurred in the hardware for the connection.
     * @type {Integer (Int32)}
     */
    static NCS_HARDWARE_MALFUNCTION => 6

    /**
     * The media, for example the network cable, is disconnected.
     * @type {Integer (Int32)}
     */
    static NCS_MEDIA_DISCONNECTED => 7

    /**
     * The connection is waiting for authentication to occur.
     * @type {Integer (Int32)}
     */
    static NCS_AUTHENTICATING => 8

    /**
     * Authentication has succeeded on this connection.
     * @type {Integer (Int32)}
     */
    static NCS_AUTHENTICATION_SUCCEEDED => 9

    /**
     * Authentication has failed on this connection.
     * @type {Integer (Int32)}
     */
    static NCS_AUTHENTICATION_FAILED => 10

    /**
     * The address is invalid.
     * @type {Integer (Int32)}
     */
    static NCS_INVALID_ADDRESS => 11

    /**
     * Security credentials are required.
     * @type {Integer (Int32)}
     */
    static NCS_CREDENTIALS_REQUIRED => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NCS_ACTION_REQUIRED => 13

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NCS_ACTION_REQUIRED_RETRY => 14

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NCS_CONNECT_FAILED => 15
}
