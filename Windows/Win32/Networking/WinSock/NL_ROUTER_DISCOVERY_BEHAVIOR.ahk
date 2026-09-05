#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NL_ROUTER_DISCOVERY_BEHAVIOR enumeration type defines the router discovery behavior, as described in RFC 2461.
 * @remarks
 * For more information about RFC 2461, see the 
 *     <a href="https://www.ietf.org/rfc/rfc2461.txt">Neighbor Discovery for IP Version 6
 *     (IPv6)</a> memo by the Network Working Group.
 * @see https://learn.microsoft.com/windows/win32/api/nldef/ne-nldef-nl_router_discovery_behavior
 * @namespace Windows.Win32.Networking.WinSock
 */
class NL_ROUTER_DISCOVERY_BEHAVIOR extends Win32Enum {

    /**
     * Router discovery is disabled.
     * Native name: RouterDiscoveryDisabled
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * Router discovery is enabled. This setting is the default value for IPv6.
     * Native name: RouterDiscoveryEnabled
     * @type {Integer (Int32)}
     */
    static Enabled => 1

    /**
     * Router discovery is configured based on DHCP. This setting is the default value for IPv4.
     * Native name: RouterDiscoveryDhcp
     * @type {Integer (Int32)}
     */
    static Dhcp => 2

    /**
     * When the properties of an IP interface are being set, the value for router discovery should be
     *      unchanged.
     * Native name: RouterDiscoveryUnchanged
     * @type {Integer (Int32)}
     */
    static Unchanged => -1
}
