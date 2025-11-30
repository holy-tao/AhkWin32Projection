#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of Internet Control Message Protocol for IP version 6.0 (ICMPv6) message types.
 * @remarks
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>ICMP6_TYPE</b> enumeration  is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ipmib/ne-ipmib-icmp6_type
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class ICMP6_TYPE extends Win32Enum{

    /**
     * The specified destination for the message is unreachable.
     * @type {Integer (Int32)}
     */
    static ICMP6_DST_UNREACH => 1

    /**
     * The ICMPv6 packet is too large.
     * @type {Integer (Int32)}
     */
    static ICMP6_PACKET_TOO_BIG => 2

    /**
     * The ICMPv6 message has timed out.
     * @type {Integer (Int32)}
     */
    static ICMP6_TIME_EXCEEDED => 3

    /**
     * The IPv6 header is malformed or contains an incorrect value.
     * @type {Integer (Int32)}
     */
    static ICMP6_PARAM_PROB => 4

    /**
     * ICMPv6 echo request message.
     * @type {Integer (Int32)}
     */
    static ICMP6_ECHO_REQUEST => 128

    /**
     * ICMPv6 echo reply message.
     * @type {Integer (Int32)}
     */
    static ICMP6_ECHO_REPLY => 129

    /**
     * ICMPv6 group membership query message.
     * @type {Integer (Int32)}
     */
    static ICMP6_MEMBERSHIP_QUERY => 130

    /**
     * ICMPv6 group membership report message.
     * @type {Integer (Int32)}
     */
    static ICMP6_MEMBERSHIP_REPORT => 131

    /**
     * ICMPv6 group membership reduction message.
     * @type {Integer (Int32)}
     */
    static ICMP6_MEMBERSHIP_REDUCTION => 132

    /**
     * ICMPv6 router solicitation message.
     * @type {Integer (Int32)}
     */
    static ND_ROUTER_SOLICIT => 133

    /**
     * ICMPv6 router advertisement message.
     * @type {Integer (Int32)}
     */
    static ND_ROUTER_ADVERT => 134

    /**
     * ICMPv6 network neighbor solicitation message.
     * @type {Integer (Int32)}
     */
    static ND_NEIGHBOR_SOLICIT => 135

    /**
     * ICMPv6 network neighbor advertisement message.
     * @type {Integer (Int32)}
     */
    static ND_NEIGHBOR_ADVERT => 136

    /**
     * ICMPv6 packet redirection message.
     * @type {Integer (Int32)}
     */
    static ND_REDIRECT => 137

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ICMP6_V2_MEMBERSHIP_REPORT => 143
}
