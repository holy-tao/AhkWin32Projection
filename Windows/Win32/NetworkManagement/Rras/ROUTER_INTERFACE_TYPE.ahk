#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ROUTER_INTERFACE_TYPE type enumerates the different kinds of interfaces on a router.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ne-mprapi-router_interface_type
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
class ROUTER_INTERFACE_TYPE extends Win32Enum {

    /**
     * The interface is for a remote client.
     * Native name: ROUTER_IF_TYPE_CLIENT
     * @type {Integer (Int32)}
     */
    static IF_TYPE_CLIENT => 0

    /**
     * The interface is for a home router.
     * Native name: ROUTER_IF_TYPE_HOME_ROUTER
     * @type {Integer (Int32)}
     */
    static IF_TYPE_HOME_ROUTER => 1

    /**
     * The interface is for a full router.
     * Native name: ROUTER_IF_TYPE_FULL_ROUTER
     * @type {Integer (Int32)}
     */
    static IF_TYPE_FULL_ROUTER => 2

    /**
     * The interface is always connected. It is a LAN interface, or the interface is connected over a leased line.
     * Native name: ROUTER_IF_TYPE_DEDICATED
     * @type {Integer (Int32)}
     */
    static IF_TYPE_DEDICATED => 3

    /**
     * The interface is an internal-only interface.
     * Native name: ROUTER_IF_TYPE_INTERNAL
     * @type {Integer (Int32)}
     */
    static IF_TYPE_INTERNAL => 4

    /**
     * The interface is a loopback interface.
     * Native name: ROUTER_IF_TYPE_LOOPBACK
     * @type {Integer (Int32)}
     */
    static IF_TYPE_LOOPBACK => 5

    /**
     * Native name: ROUTER_IF_TYPE_TUNNEL1
     * @type {Integer (Int32)}
     */
    static IF_TYPE_TUNNEL1 => 6

    /**
     * The interface is a dial-on-demand (DOD) interface.
     * Native name: ROUTER_IF_TYPE_DIALOUT
     * @type {Integer (Int32)}
     */
    static IF_TYPE_DIALOUT => 7

    /**
     * Native name: ROUTER_IF_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static IF_TYPE_MAX => 8
}
