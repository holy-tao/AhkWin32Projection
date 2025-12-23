#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IPV6_OPTION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IP6OPT_PAD1 => 0

    /**
     * @type {Integer (Int32)}
     */
    static IP6OPT_PADN => 1

    /**
     * @type {Integer (Int32)}
     */
    static IP6OPT_TUNNEL_LIMIT => 4

    /**
     * @type {Integer (Int32)}
     */
    static IP6OPT_ROUTER_ALERT => 5

    /**
     * @type {Integer (Int32)}
     */
    static IP6OPT_JUMBO => 194

    /**
     * @type {Integer (Int32)}
     */
    static IP6OPT_NSAP_ADDR => 195
}
