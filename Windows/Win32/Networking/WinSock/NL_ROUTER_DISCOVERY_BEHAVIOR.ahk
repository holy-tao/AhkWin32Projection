#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NL_ROUTER_DISCOVERY_BEHAVIOR enumeration type defines the router discovery behavior, as described in RFC 2461.
 * @remarks
 * For more information about RFC 2461, see the 
 *     <a href="https://www.ietf.org/rfc/rfc2461.txt">Neighbor Discovery for IP Version 6
 *     (IPv6)</a> memo by the Network Working Group.
 * @see https://learn.microsoft.com/windows/win32/api/nldef/ne-nldef-nl_router_discovery_behavior
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct NL_ROUTER_DISCOVERY_BEHAVIOR {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Router discovery is disabled.
     * @type {Integer (Int32)}
     */
    static RouterDiscoveryDisabled => 0

    /**
     * Router discovery is enabled. This setting is the default value for IPv6.
     * @type {Integer (Int32)}
     */
    static RouterDiscoveryEnabled => 1

    /**
     * Router discovery is configured based on DHCP. This setting is the default value for IPv4.
     * @type {Integer (Int32)}
     */
    static RouterDiscoveryDhcp => 2

    /**
     * When the properties of an IP interface are being set, the value for router discovery should be
     *      unchanged.
     * @type {Integer (Int32)}
     */
    static RouterDiscoveryUnchanged => -1
}
