#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class IPPROTO extends Win32Enum {

    /**
     * Native name: IPPROTO_HOPOPTS
     * @type {Integer (Int32)}
     */
    static HOPOPTS => 0

    /**
     * Native name: IPPROTO_ICMP
     * @type {Integer (Int32)}
     */
    static ICMP => 1

    /**
     * Native name: IPPROTO_IGMP
     * @type {Integer (Int32)}
     */
    static IGMP => 2

    /**
     * Native name: IPPROTO_GGP
     * @type {Integer (Int32)}
     */
    static GGP => 3

    /**
     * Native name: IPPROTO_IPV4
     * @type {Integer (Int32)}
     */
    static IPV4 => 4

    /**
     * Native name: IPPROTO_ST
     * @type {Integer (Int32)}
     */
    static ST => 5

    /**
     * Native name: IPPROTO_TCP
     * @type {Integer (Int32)}
     */
    static TCP => 6

    /**
     * Native name: IPPROTO_CBT
     * @type {Integer (Int32)}
     */
    static CBT => 7

    /**
     * Native name: IPPROTO_EGP
     * @type {Integer (Int32)}
     */
    static EGP => 8

    /**
     * Native name: IPPROTO_IGP
     * @type {Integer (Int32)}
     */
    static IGP => 9

    /**
     * Native name: IPPROTO_PUP
     * @type {Integer (Int32)}
     */
    static PUP => 12

    /**
     * Native name: IPPROTO_UDP
     * @type {Integer (Int32)}
     */
    static UDP => 17

    /**
     * Native name: IPPROTO_IDP
     * @type {Integer (Int32)}
     */
    static IDP => 22

    /**
     * Native name: IPPROTO_RDP
     * @type {Integer (Int32)}
     */
    static RDP => 27

    /**
     * Native name: IPPROTO_IPV6
     * @type {Integer (Int32)}
     */
    static IPV6 => 41

    /**
     * Native name: IPPROTO_ROUTING
     * @type {Integer (Int32)}
     */
    static ROUTING => 43

    /**
     * Native name: IPPROTO_FRAGMENT
     * @type {Integer (Int32)}
     */
    static FRAGMENT => 44

    /**
     * Native name: IPPROTO_ESP
     * @type {Integer (Int32)}
     */
    static ESP => 50

    /**
     * Native name: IPPROTO_AH
     * @type {Integer (Int32)}
     */
    static AH => 51

    /**
     * Native name: IPPROTO_ICMPV6
     * @type {Integer (Int32)}
     */
    static ICMPV6 => 58

    /**
     * Native name: IPPROTO_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 59

    /**
     * Native name: IPPROTO_DSTOPTS
     * @type {Integer (Int32)}
     */
    static DSTOPTS => 60

    /**
     * Native name: IPPROTO_ND
     * @type {Integer (Int32)}
     */
    static ND => 77

    /**
     * Native name: IPPROTO_ICLFXBM
     * @type {Integer (Int32)}
     */
    static ICLFXBM => 78

    /**
     * Native name: IPPROTO_PIM
     * @type {Integer (Int32)}
     */
    static PIM => 103

    /**
     * Native name: IPPROTO_PGM
     * @type {Integer (Int32)}
     */
    static PGM => 113

    /**
     * Native name: IPPROTO_L2TP
     * @type {Integer (Int32)}
     */
    static L2TP => 115

    /**
     * Native name: IPPROTO_SCTP
     * @type {Integer (Int32)}
     */
    static SCTP => 132

    /**
     * Native name: IPPROTO_RAW
     * @type {Integer (Int32)}
     */
    static RAW => 255

    /**
     * Native name: IPPROTO_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 256

    /**
     * Native name: IPPROTO_RESERVED_RAW
     * @type {Integer (Int32)}
     */
    static RESERVED_RAW => 257

    /**
     * Native name: IPPROTO_RESERVED_IPSEC
     * @type {Integer (Int32)}
     */
    static RESERVED_IPSEC => 258

    /**
     * Native name: IPPROTO_RESERVED_IPSECOFFLOAD
     * @type {Integer (Int32)}
     */
    static RESERVED_IPSECOFFLOAD => 259

    /**
     * Native name: IPPROTO_RESERVED_WNV
     * @type {Integer (Int32)}
     */
    static RESERVED_WNV => 260

    /**
     * Native name: IPPROTO_RESERVED_MAX
     * @type {Integer (Int32)}
     */
    static RESERVED_MAX => 261

    /**
     * Native name: IPPROTO_IP
     * @type {Integer (Int32)}
     */
    static IP => 0

    /**
     * Native name: IPPROTO_RM
     * @type {Integer (Int32)}
     */
    static RM => 113
}
