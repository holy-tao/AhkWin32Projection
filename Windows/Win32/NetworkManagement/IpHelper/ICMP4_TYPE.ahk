#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of Internet Control Message Protocol (ICMP) for IP version 4.0 (IPv4) message types.
 * @remarks
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>ICMP4_TYPE</b> enumeration  is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ne-ipmib-icmp4_type
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class ICMP4_TYPE extends Win32Enum {

    /**
     * ICMP echo reply message.
     * Native name: ICMP4_ECHO_REPLY
     * @type {Integer (Int32)}
     */
    static ECHO_REPLY => 0

    /**
     * The specified destination for the message is unreachable.
     * Native name: ICMP4_DST_UNREACH
     * @type {Integer (Int32)}
     */
    static DST_UNREACH => 3

    /**
     * ICMP source quench message.
     * Native name: ICMP4_SOURCE_QUENCH
     * @type {Integer (Int32)}
     */
    static SOURCE_QUENCH => 4

    /**
     * ICMP redirection message.
     * Native name: ICMP4_REDIRECT
     * @type {Integer (Int32)}
     */
    static REDIRECT => 5

    /**
     * ICMP echo redirection message.
     * Native name: ICMP4_ECHO_REQUEST
     * @type {Integer (Int32)}
     */
    static ECHO_REQUEST => 8

    /**
     * ICMP router advertisement message.
     * Native name: ICMP4_ROUTER_ADVERT
     * @type {Integer (Int32)}
     */
    static ROUTER_ADVERT => 9

    /**
     * ICMP router solicitation message.
     * Native name: ICMP4_ROUTER_SOLICIT
     * @type {Integer (Int32)}
     */
    static ROUTER_SOLICIT => 10

    /**
     * The ICMPv6 message has timed out.
     * Native name: ICMP4_TIME_EXCEEDED
     * @type {Integer (Int32)}
     */
    static TIME_EXCEEDED => 11

    /**
     * The IPv4 header is malformed or contains an incorrect value.
     * Native name: ICMP4_PARAM_PROB
     * @type {Integer (Int32)}
     */
    static PARAM_PROB => 12

    /**
     * ICMP timestamp request message.
     * Native name: ICMP4_TIMESTAMP_REQUEST
     * @type {Integer (Int32)}
     */
    static TIMESTAMP_REQUEST => 13

    /**
     * ICMP timestamp reply message.
     * Native name: ICMP4_TIMESTAMP_REPLY
     * @type {Integer (Int32)}
     */
    static TIMESTAMP_REPLY => 14

    /**
     * ICMP mask request message.
     * Native name: ICMP4_MASK_REQUEST
     * @type {Integer (Int32)}
     */
    static MASK_REQUEST => 17

    /**
     * ICMP mask reply message.
     * Native name: ICMP4_MASK_REPLY
     * @type {Integer (Int32)}
     */
    static MASK_REPLY => 18
}
