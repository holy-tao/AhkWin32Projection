#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_ERROR_PACKET_DATA_FORMAT extends Win32Enum {

    /**
     * Native name: WheaDataFormatIPFSalRecord
     * @type {Integer (Int32)}
     */
    static FormatIPFSalRecord => 0

    /**
     * Native name: WheaDataFormatXPFMCA
     * @type {Integer (Int32)}
     */
    static FormatXPFMCA => 1

    /**
     * Native name: WheaDataFormatMemory
     * @type {Integer (Int32)}
     */
    static Memory => 2

    /**
     * Native name: WheaDataFormatPCIExpress
     * @type {Integer (Int32)}
     */
    static FormatPCIExpress => 3

    /**
     * Native name: WheaDataFormatNMIPort
     * @type {Integer (Int32)}
     */
    static FormatNMIPort => 4

    /**
     * Native name: WheaDataFormatPCIXBus
     * @type {Integer (Int32)}
     */
    static FormatPCIXBus => 5

    /**
     * Native name: WheaDataFormatPCIXDevice
     * @type {Integer (Int32)}
     */
    static FormatPCIXDevice => 6

    /**
     * Native name: WheaDataFormatGeneric
     * @type {Integer (Int32)}
     */
    static Generic => 7

    /**
     * Native name: WheaDataFormatMax
     * @type {Integer (Int32)}
     */
    static Max => 8
}
