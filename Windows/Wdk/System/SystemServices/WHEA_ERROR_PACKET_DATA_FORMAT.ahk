#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_ERROR_PACKET_DATA_FORMAT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WheaDataFormatIPFSalRecord => 0

    /**
     * @type {Integer (Int32)}
     */
    static WheaDataFormatXPFMCA => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaDataFormatMemory => 2

    /**
     * @type {Integer (Int32)}
     */
    static WheaDataFormatPCIExpress => 3

    /**
     * @type {Integer (Int32)}
     */
    static WheaDataFormatNMIPort => 4

    /**
     * @type {Integer (Int32)}
     */
    static WheaDataFormatPCIXBus => 5

    /**
     * @type {Integer (Int32)}
     */
    static WheaDataFormatPCIXDevice => 6

    /**
     * @type {Integer (Int32)}
     */
    static WheaDataFormatGeneric => 7

    /**
     * @type {Integer (Int32)}
     */
    static WheaDataFormatMax => 8
}
