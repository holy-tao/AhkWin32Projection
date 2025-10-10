#Requires AutoHotkey v2.0.0 64-bit

/**
 * The NL_ROUTE_ORIGIN enumeration type defines the origin of the IP route.
 * @see https://docs.microsoft.com/windows/win32/api//nldef/ne-nldef-nl_route_origin
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_ROUTE_ORIGIN{

    /**
     * The route is a result of manual configuration.
     * @type {Integer (Int32)}
     */
    static NlroManual => 0

    /**
     * The route is a well-known route.
     * @type {Integer (Int32)}
     */
    static NlroWellKnown => 1

    /**
     * The route is a result of DHCP configuration.
     * @type {Integer (Int32)}
     */
    static NlroDHCP => 2

    /**
     * The route is a result of router advertisement.
     * @type {Integer (Int32)}
     */
    static NlroRouterAdvertisement => 3

    /**
     * The route is a result of 6to4 tunneling.
     * @type {Integer (Int32)}
     */
    static Nlro6to4 => 4
}
