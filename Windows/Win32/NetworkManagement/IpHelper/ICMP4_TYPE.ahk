#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of Internet Control Message Protocol (ICMP) for IP version 4.0 (IPv4) message types.
 * @remarks
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>ICMP4_TYPE</b> enumeration  is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ne-ipmib-icmp4_type
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class ICMP4_TYPE{

    /**
     * ICMP echo reply message.
     * @type {Integer (Int32)}
     */
    static ICMP4_ECHO_REPLY => 0

    /**
     * The specified destination for the message is unreachable.
     * @type {Integer (Int32)}
     */
    static ICMP4_DST_UNREACH => 3

    /**
     * ICMP source quench message.
     * @type {Integer (Int32)}
     */
    static ICMP4_SOURCE_QUENCH => 4

    /**
     * ICMP redirection message.
     * @type {Integer (Int32)}
     */
    static ICMP4_REDIRECT => 5

    /**
     * ICMP echo redirection message.
     * @type {Integer (Int32)}
     */
    static ICMP4_ECHO_REQUEST => 8

    /**
     * ICMP router advertisement message.
     * @type {Integer (Int32)}
     */
    static ICMP4_ROUTER_ADVERT => 9

    /**
     * ICMP router solicitation message.
     * @type {Integer (Int32)}
     */
    static ICMP4_ROUTER_SOLICIT => 10

    /**
     * The ICMPv6 message has timed out.
     * @type {Integer (Int32)}
     */
    static ICMP4_TIME_EXCEEDED => 11

    /**
     * The IPv4 header is malformed or contains an incorrect value.
     * @type {Integer (Int32)}
     */
    static ICMP4_PARAM_PROB => 12

    /**
     * ICMP timestamp request message.
     * @type {Integer (Int32)}
     */
    static ICMP4_TIMESTAMP_REQUEST => 13

    /**
     * ICMP timestamp reply message.
     * @type {Integer (Int32)}
     */
    static ICMP4_TIMESTAMP_REPLY => 14

    /**
     * ICMP mask request message.
     * @type {Integer (Int32)}
     */
    static ICMP4_MASK_REQUEST => 17

    /**
     * ICMP mask reply message.
     * @type {Integer (Int32)}
     */
    static ICMP4_MASK_REPLY => 18
}
