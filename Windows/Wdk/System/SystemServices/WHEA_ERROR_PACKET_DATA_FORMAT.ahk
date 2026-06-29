#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ERROR_PACKET_DATA_FORMAT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
