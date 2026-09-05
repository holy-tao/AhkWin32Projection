#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_EXPRESS_L0s_EXIT_LATENCY extends Win32Enum {

    /**
     * Native name: L0s_Below64ns
     * @type {Integer (Int32)}
     */
    static Below64ns => 0

    /**
     * Native name: L0s_64ns_128ns
     * @type {Integer (Int32)}
     */
    static 64ns_128ns => 1

    /**
     * Native name: L0s_128ns_256ns
     * @type {Integer (Int32)}
     */
    static 128ns_256ns => 2

    /**
     * Native name: L0s_256ns_512ns
     * @type {Integer (Int32)}
     */
    static 256ns_512ns => 3

    /**
     * Native name: L0s_512ns_1us
     * @type {Integer (Int32)}
     */
    static 512ns_1us => 4

    /**
     * Native name: L0s_1us_2us
     * @type {Integer (Int32)}
     */
    static 1us_2us => 5

    /**
     * Native name: L0s_2us_4us
     * @type {Integer (Int32)}
     */
    static 2us_4us => 6

    /**
     * Native name: L0s_Above4us
     * @type {Integer (Int32)}
     */
    static Above4us => 7
}
