#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class ND_OPTION_TYPE extends Win32Enum {

    /**
     * Native name: ND_OPT_SOURCE_LINKADDR
     * @type {Integer (Int32)}
     */
    static OPT_SOURCE_LINKADDR => 1

    /**
     * Native name: ND_OPT_TARGET_LINKADDR
     * @type {Integer (Int32)}
     */
    static OPT_TARGET_LINKADDR => 2

    /**
     * Native name: ND_OPT_PREFIX_INFORMATION
     * @type {Integer (Int32)}
     */
    static OPT_PREFIX_INFORMATION => 3

    /**
     * Native name: ND_OPT_REDIRECTED_HEADER
     * @type {Integer (Int32)}
     */
    static OPT_REDIRECTED_HEADER => 4

    /**
     * Native name: ND_OPT_MTU
     * @type {Integer (Int32)}
     */
    static OPT_MTU => 5

    /**
     * Native name: ND_OPT_NBMA_SHORTCUT_LIMIT
     * @type {Integer (Int32)}
     */
    static OPT_NBMA_SHORTCUT_LIMIT => 6

    /**
     * Native name: ND_OPT_ADVERTISEMENT_INTERVAL
     * @type {Integer (Int32)}
     */
    static OPT_ADVERTISEMENT_INTERVAL => 7

    /**
     * Native name: ND_OPT_HOME_AGENT_INFORMATION
     * @type {Integer (Int32)}
     */
    static OPT_HOME_AGENT_INFORMATION => 8

    /**
     * Native name: ND_OPT_SOURCE_ADDR_LIST
     * @type {Integer (Int32)}
     */
    static OPT_SOURCE_ADDR_LIST => 9

    /**
     * Native name: ND_OPT_TARGET_ADDR_LIST
     * @type {Integer (Int32)}
     */
    static OPT_TARGET_ADDR_LIST => 10

    /**
     * Native name: ND_OPT_ROUTE_INFO
     * @type {Integer (Int32)}
     */
    static OPT_ROUTE_INFO => 24

    /**
     * Native name: ND_OPT_RDNSS
     * @type {Integer (Int32)}
     */
    static OPT_RDNSS => 25

    /**
     * Native name: ND_OPT_DNSSL
     * @type {Integer (Int32)}
     */
    static OPT_DNSSL => 31

    /**
     * Native name: ND_OPT_PREF64
     * @type {Integer (Int32)}
     */
    static OPT_PREF64 => 38
}
