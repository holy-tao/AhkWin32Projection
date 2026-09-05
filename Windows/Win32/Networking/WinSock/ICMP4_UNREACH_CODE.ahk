#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class ICMP4_UNREACH_CODE extends Win32Enum {

    /**
     * Native name: ICMP4_UNREACH_NET
     * @type {Integer (Int32)}
     */
    static NET => 0

    /**
     * Native name: ICMP4_UNREACH_HOST
     * @type {Integer (Int32)}
     */
    static HOST => 1

    /**
     * Native name: ICMP4_UNREACH_PROTOCOL
     * @type {Integer (Int32)}
     */
    static PROTOCOL => 2

    /**
     * Native name: ICMP4_UNREACH_PORT
     * @type {Integer (Int32)}
     */
    static PORT => 3

    /**
     * Native name: ICMP4_UNREACH_FRAG_NEEDED
     * @type {Integer (Int32)}
     */
    static FRAG_NEEDED => 4

    /**
     * Native name: ICMP4_UNREACH_SOURCEROUTE_FAILED
     * @type {Integer (Int32)}
     */
    static SOURCEROUTE_FAILED => 5

    /**
     * Native name: ICMP4_UNREACH_NET_UNKNOWN
     * @type {Integer (Int32)}
     */
    static NET_UNKNOWN => 6

    /**
     * Native name: ICMP4_UNREACH_HOST_UNKNOWN
     * @type {Integer (Int32)}
     */
    static HOST_UNKNOWN => 7

    /**
     * Native name: ICMP4_UNREACH_ISOLATED
     * @type {Integer (Int32)}
     */
    static ISOLATED => 8

    /**
     * Native name: ICMP4_UNREACH_NET_ADMIN
     * @type {Integer (Int32)}
     */
    static NET_ADMIN => 9

    /**
     * Native name: ICMP4_UNREACH_HOST_ADMIN
     * @type {Integer (Int32)}
     */
    static HOST_ADMIN => 10

    /**
     * Native name: ICMP4_UNREACH_NET_TOS
     * @type {Integer (Int32)}
     */
    static NET_TOS => 11

    /**
     * Native name: ICMP4_UNREACH_HOST_TOS
     * @type {Integer (Int32)}
     */
    static HOST_TOS => 12

    /**
     * Native name: ICMP4_UNREACH_ADMIN
     * @type {Integer (Int32)}
     */
    static ADMIN => 13
}
