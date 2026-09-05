#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_RAW_DATA_FORMAT extends Win32Enum {

    /**
     * Native name: WheaRawDataFormatIPFSalRecord
     * @type {Integer (Int32)}
     */
    static FormatIPFSalRecord => 0

    /**
     * Native name: WheaRawDataFormatIA32MCA
     * @type {Integer (Int32)}
     */
    static FormatIA32MCA => 1

    /**
     * Native name: WheaRawDataFormatIntel64MCA
     * @type {Integer (Int32)}
     */
    static Intel64MCA => 2

    /**
     * Native name: WheaRawDataFormatAMD64MCA
     * @type {Integer (Int32)}
     */
    static FormatAMD64MCA => 3

    /**
     * Native name: WheaRawDataFormatMemory
     * @type {Integer (Int32)}
     */
    static Memory => 4

    /**
     * Native name: WheaRawDataFormatPCIExpress
     * @type {Integer (Int32)}
     */
    static FormatPCIExpress => 5

    /**
     * Native name: WheaRawDataFormatNMIPort
     * @type {Integer (Int32)}
     */
    static FormatNMIPort => 6

    /**
     * Native name: WheaRawDataFormatPCIXBus
     * @type {Integer (Int32)}
     */
    static FormatPCIXBus => 7

    /**
     * Native name: WheaRawDataFormatPCIXDevice
     * @type {Integer (Int32)}
     */
    static FormatPCIXDevice => 8

    /**
     * Native name: WheaRawDataFormatGeneric
     * @type {Integer (Int32)}
     */
    static Generic => 9

    /**
     * Native name: WheaRawDataFormatMax
     * @type {Integer (Int32)}
     */
    static Max => 10
}
