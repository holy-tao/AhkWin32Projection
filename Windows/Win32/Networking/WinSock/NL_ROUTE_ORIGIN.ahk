#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NL_ROUTE_ORIGIN enumeration type defines the origin of the IP route.
 * @see https://learn.microsoft.com/windows/win32/api/nldef/ne-nldef-nl_route_origin
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct NL_ROUTE_ORIGIN {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
