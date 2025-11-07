#Requires AutoHotkey v2.0.0 64-bit

/**
 * The NL_ROUTE_PROTOCOL enumeration type defines the routing mechanism that an IP route was added with, as described in RFC 4292.
 * @remarks
 * 
 * For more information about RFC 4292, see the 
 *     <a href="https://www.ietf.org/rfc/rfc4292.txt">IP Forwarding Table MIB</a> memo by the
 *     Network Working Group.
 * 
 * Note that the 
 *     Nldef.h header is automatically included by the 
 *     Netioapi.h header file. Your driver should never use the 
 *     Nldef.h header file directly.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//nldef/ne-nldef-nl_route_protocol
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_ROUTE_PROTOCOL{

    /**
     * Reserved for system use. Do not use this value in your driver.
     * @type {Integer (Int32)}
     */
    static RouteProtocolOther => 1

    /**
     * Reserved for system use. Do not use this value in your driver.
     * @type {Integer (Int32)}
     */
    static RouteProtocolLocal => 2

    /**
     * Reserved for system use. Do not use this value in your driver.
     * @type {Integer (Int32)}
     */
    static RouteProtocolNetMgmt => 3

    /**
     * Reserved for system use. Do not use this value in your driver.
     * @type {Integer (Int32)}
     */
    static RouteProtocolIcmp => 4

    /**
     * Reserved for system use. Do not use this value in your driver.
     * @type {Integer (Int32)}
     */
    static RouteProtocolEgp => 5

    /**
     * Reserved for system use. Do not use this value in your driver.
     * @type {Integer (Int32)}
     */
    static RouteProtocolGgp => 6

    /**
     * Reserved for system use. Do not use this value in your driver.
     * @type {Integer (Int32)}
     */
    static RouteProtocolHello => 7

    /**
     * Reserved for system use. Do not use this value in your driver.
     * @type {Integer (Int32)}
     */
    static RouteProtocolRip => 8

    /**
     * Reserved for system use. Do not use this value in your driver.
     * @type {Integer (Int32)}
     */
    static RouteProtocolIsIs => 9

    /**
     * Reserved for system use. Do not use this value in your driver.
     * @type {Integer (Int32)}
     */
    static RouteProtocolEsIs => 10

    /**
     * Reserved for system use. Do not use this value in your driver.
     * @type {Integer (Int32)}
     */
    static RouteProtocolCisco => 11

    /**
     * Reserved for system use. Do not use this value in your driver.
     * @type {Integer (Int32)}
     */
    static RouteProtocolBbn => 12

    /**
     * Reserved for system use. Do not use this value in your driver.
     * @type {Integer (Int32)}
     */
    static RouteProtocolOspf => 13

    /**
     * Reserved for system use. Do not use this value in your driver.
     * @type {Integer (Int32)}
     */
    static RouteProtocolBgp => 14

    /**
     * 
     * @type {Integer (Int32)}
     */
    static RouteProtocolIdpr => 15

    /**
     * 
     * @type {Integer (Int32)}
     */
    static RouteProtocolEigrp => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static RouteProtocolDvmrp => 17

    /**
     * 
     * @type {Integer (Int32)}
     */
    static RouteProtocolRpl => 18

    /**
     * 
     * @type {Integer (Int32)}
     */
    static RouteProtocolDhcp => 19

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_OTHER => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_OTHER => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_LOCAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_LOCAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_NETMGMT => 3

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_NETMGMT => 3

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_ICMP => 4

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_ICMP => 4

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_EGP => 5

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_EGP => 5

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_GGP => 6

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_GGP => 6

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_HELLO => 7

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_HELLO => 7

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_RIP => 8

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_RIP => 8

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_IS_IS => 9

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_IS_IS => 9

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_ES_IS => 10

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_ES_IS => 10

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_CISCO => 11

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_CISCO => 11

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_BBN => 12

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_BBN => 12

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_OSPF => 13

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_OSPF => 13

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_BGP => 14

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_BGP => 14

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_IDPR => 15

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_IDPR => 15

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_EIGRP => 16

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_EIGRP => 16

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_DVMRP => 17

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_DVMRP => 17

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_RPL => 18

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_RPL => 18

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_DHCP => 19

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_DHCP => 19

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_NT_AUTOSTATIC => 10002

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_NT_AUTOSTATIC => 10002

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_NT_STATIC => 10006

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_NT_STATIC => 10006

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPPROTO_NT_STATIC_NON_DOD => 10007

    /**
     * @type {Integer (Int32)}
     */
    static PROTO_IP_NT_STATIC_NON_DOD => 10007
}
