#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NETCON_TYPE type enumerates the various kinds of network connections.
 * @see https://learn.microsoft.com/windows/win32/api/netcon/ne-netcon-netcon_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NETCON_TYPE extends Win32Enum{

    /**
     * Direct serial connection through a serial port.
     * @type {Integer (Int32)}
     */
    static NCT_DIRECT_CONNECT => 0

    /**
     * Another computer dials in to the local computer through this connection.
     * @type {Integer (Int32)}
     */
    static NCT_INBOUND => 1

    /**
     * The connection is to the public Internet.
     * @type {Integer (Int32)}
     */
    static NCT_INTERNET => 2

    /**
     * The connection is to a local area network (LAN).
     * @type {Integer (Int32)}
     */
    static NCT_LAN => 3

    /**
     * The connection is a dial-up connection over a phone line.
     * @type {Integer (Int32)}
     */
    static NCT_PHONE => 4

    /**
     * The connection is a virtual private network (VPN) connection.
     * @type {Integer (Int32)}
     */
    static NCT_TUNNEL => 5

    /**
     * The connection is a bridged connection.
     * @type {Integer (Int32)}
     */
    static NCT_BRIDGE => 6
}
