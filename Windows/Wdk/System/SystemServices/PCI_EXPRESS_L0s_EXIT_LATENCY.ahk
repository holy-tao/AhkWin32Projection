#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_L0s_EXIT_LATENCY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static L0s_Below64ns => 0

    /**
     * @type {Integer (Int32)}
     */
    static L0s_64ns_128ns => 1

    /**
     * @type {Integer (Int32)}
     */
    static L0s_128ns_256ns => 2

    /**
     * @type {Integer (Int32)}
     */
    static L0s_256ns_512ns => 3

    /**
     * @type {Integer (Int32)}
     */
    static L0s_512ns_1us => 4

    /**
     * @type {Integer (Int32)}
     */
    static L0s_1us_2us => 5

    /**
     * @type {Integer (Int32)}
     */
    static L0s_2us_4us => 6

    /**
     * @type {Integer (Int32)}
     */
    static L0s_Above4us => 7
}
