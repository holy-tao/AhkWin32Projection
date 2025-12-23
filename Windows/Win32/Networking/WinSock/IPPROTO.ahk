#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IPPROTO extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_HOPOPTS => 0

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_ICMP => 1

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_IGMP => 2

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_GGP => 3

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_IPV4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_ST => 5

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_TCP => 6

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_CBT => 7

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_EGP => 8

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_IGP => 9

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_PUP => 12

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_UDP => 17

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_IDP => 22

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_RDP => 27

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_IPV6 => 41

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_ROUTING => 43

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_FRAGMENT => 44

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_ESP => 50

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_AH => 51

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_ICMPV6 => 58

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_NONE => 59

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_DSTOPTS => 60

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_ND => 77

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_ICLFXBM => 78

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_PIM => 103

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_PGM => 113

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_L2TP => 115

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_SCTP => 132

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_RAW => 255

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_MAX => 256

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_RESERVED_RAW => 257

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_RESERVED_IPSEC => 258

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_RESERVED_IPSECOFFLOAD => 259

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_RESERVED_WNV => 260

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_RESERVED_MAX => 261

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_IP => 0

    /**
     * @type {Integer (Int32)}
     */
    static IPPROTO_RM => 113
}
