#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the NETCON_MEDIATYPE enumerate the possible ways the computer connects to the network.
 * @see https://docs.microsoft.com/windows/win32/api//netcon/ne-netcon-netcon_mediatype
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NETCON_MEDIATYPE{

    /**
     * No media is present.
     * @type {Integer (Int32)}
     */
    static NCM_NONE => 0

    /**
     * Direct serial connection through a serial port.
     * @type {Integer (Int32)}
     */
    static NCM_DIRECT => 1

    /**
     * Connection is through an integrated services digital network (ISDN) line.
     * @type {Integer (Int32)}
     */
    static NCM_ISDN => 2

    /**
     * Connection is to a local area network (LAN).
     * @type {Integer (Int32)}
     */
    static NCM_LAN => 3

    /**
     * Dial-up connection over a conventional phone line.
     * @type {Integer (Int32)}
     */
    static NCM_PHONE => 4

    /**
     * Virtual private network (VPN) connection.
     * @type {Integer (Int32)}
     */
    static NCM_TUNNEL => 5

    /**
     * Point-to-Point protocol (PPP) over Ethernet.
     * @type {Integer (Int32)}
     */
    static NCM_PPPOE => 6

    /**
     * Bridged connection.
     * @type {Integer (Int32)}
     */
    static NCM_BRIDGE => 7

    /**
     * Shared connection to a LAN.
     * @type {Integer (Int32)}
     */
    static NCM_SHAREDACCESSHOST_LAN => 8

    /**
     * Shared connection to a remote or wide area network (WAN).
     * @type {Integer (Int32)}
     */
    static NCM_SHAREDACCESSHOST_RAS => 9
}
