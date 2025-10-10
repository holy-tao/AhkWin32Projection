#Requires AutoHotkey v2.0.0 64-bit

/**
 * The NL_ROUTER_DISCOVERY_BEHAVIOR enumeration type defines the router discovery behavior, as described in RFC 2461.
 * @remarks
 * 
  * For more information about RFC 2461, see the 
  *     <a href="https://www.ietf.org/rfc/rfc2461.txt">Neighbor Discovery for IP Version 6
  *     (IPv6)</a> memo by the Network Working Group.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//nldef/ne-nldef-nl_router_discovery_behavior
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_ROUTER_DISCOVERY_BEHAVIOR{

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
