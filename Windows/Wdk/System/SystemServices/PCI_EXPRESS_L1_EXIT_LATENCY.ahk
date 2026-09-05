#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_EXPRESS_L1_EXIT_LATENCY extends Win32Enum {

    /**
     * Native name: L1_Below1us
     * @type {Integer (Int32)}
     */
    static Below1us => 0

    /**
     * Native name: L1_1us_2us
     * @type {Integer (Int32)}
     */
    static 1us_2us => 1

    /**
     * Native name: L1_2us_4us
     * @type {Integer (Int32)}
     */
    static 2us_4us => 2

    /**
     * Native name: L1_4us_8us
     * @type {Integer (Int32)}
     */
    static 4us_8us => 3

    /**
     * Native name: L1_8us_16us
     * @type {Integer (Int32)}
     */
    static 8us_16us => 4

    /**
     * Native name: L1_16us_32us
     * @type {Integer (Int32)}
     */
    static 16us_32us => 5

    /**
     * Native name: L1_32us_64us
     * @type {Integer (Int32)}
     */
    static 32us_64us => 6

    /**
     * Native name: L1_Above64us
     * @type {Integer (Int32)}
     */
    static Above64us => 7
}
