#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_L1_EXIT_LATENCY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static L1_Below1us => 0

    /**
     * @type {Integer (Int32)}
     */
    static L1_1us_2us => 1

    /**
     * @type {Integer (Int32)}
     */
    static L1_2us_4us => 2

    /**
     * @type {Integer (Int32)}
     */
    static L1_4us_8us => 3

    /**
     * @type {Integer (Int32)}
     */
    static L1_8us_16us => 4

    /**
     * @type {Integer (Int32)}
     */
    static L1_16us_32us => 5

    /**
     * @type {Integer (Int32)}
     */
    static L1_32us_64us => 6

    /**
     * @type {Integer (Int32)}
     */
    static L1_Above64us => 7
}
