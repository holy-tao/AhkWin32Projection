#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class BUS_DATA_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ConfigurationSpaceUndefined => -1

    /**
     * @type {Integer (Int32)}
     */
    static Cmos => 0

    /**
     * @type {Integer (Int32)}
     */
    static EisaConfiguration => 1

    /**
     * @type {Integer (Int32)}
     */
    static Pos => 2

    /**
     * @type {Integer (Int32)}
     */
    static CbusConfiguration => 3

    /**
     * @type {Integer (Int32)}
     */
    static PCIConfiguration => 4

    /**
     * @type {Integer (Int32)}
     */
    static VMEConfiguration => 5

    /**
     * @type {Integer (Int32)}
     */
    static NuBusConfiguration => 6

    /**
     * @type {Integer (Int32)}
     */
    static PCMCIAConfiguration => 7

    /**
     * @type {Integer (Int32)}
     */
    static MPIConfiguration => 8

    /**
     * @type {Integer (Int32)}
     */
    static MPSAConfiguration => 9

    /**
     * @type {Integer (Int32)}
     */
    static PNPISAConfiguration => 10

    /**
     * @type {Integer (Int32)}
     */
    static SgiInternalConfiguration => 11

    /**
     * @type {Integer (Int32)}
     */
    static MaximumBusDataType => 12
}
