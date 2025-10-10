#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ROUTER_INTERFACE_TYPE type enumerates the different kinds of interfaces on a router.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ne-mprapi-router_interface_type
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class ROUTER_INTERFACE_TYPE{

    /**
     * The interface is for a remote client.
     * @type {Integer (Int32)}
     */
    static ROUTER_IF_TYPE_CLIENT => 0

    /**
     * The interface is for a home router.
     * @type {Integer (Int32)}
     */
    static ROUTER_IF_TYPE_HOME_ROUTER => 1

    /**
     * The interface is for a full router.
     * @type {Integer (Int32)}
     */
    static ROUTER_IF_TYPE_FULL_ROUTER => 2

    /**
     * The interface is always connected. It is a LAN interface, or the interface is connected over a leased line.
     * @type {Integer (Int32)}
     */
    static ROUTER_IF_TYPE_DEDICATED => 3

    /**
     * The interface is an internal-only interface.
     * @type {Integer (Int32)}
     */
    static ROUTER_IF_TYPE_INTERNAL => 4

    /**
     * The interface is a loopback interface.
     * @type {Integer (Int32)}
     */
    static ROUTER_IF_TYPE_LOOPBACK => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ROUTER_IF_TYPE_TUNNEL1 => 6

    /**
     * The interface is a dial-on-demand (DOD) interface.
     * @type {Integer (Int32)}
     */
    static ROUTER_IF_TYPE_DIALOUT => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ROUTER_IF_TYPE_MAX => 8
}
