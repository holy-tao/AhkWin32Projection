#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_RAW_DATA_FORMAT {
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
    static WheaRawDataFormatIPFSalRecord => 0

    /**
     * @type {Integer (Int32)}
     */
    static WheaRawDataFormatIA32MCA => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaRawDataFormatIntel64MCA => 2

    /**
     * @type {Integer (Int32)}
     */
    static WheaRawDataFormatAMD64MCA => 3

    /**
     * @type {Integer (Int32)}
     */
    static WheaRawDataFormatMemory => 4

    /**
     * @type {Integer (Int32)}
     */
    static WheaRawDataFormatPCIExpress => 5

    /**
     * @type {Integer (Int32)}
     */
    static WheaRawDataFormatNMIPort => 6

    /**
     * @type {Integer (Int32)}
     */
    static WheaRawDataFormatPCIXBus => 7

    /**
     * @type {Integer (Int32)}
     */
    static WheaRawDataFormatPCIXDevice => 8

    /**
     * @type {Integer (Int32)}
     */
    static WheaRawDataFormatGeneric => 9

    /**
     * @type {Integer (Int32)}
     */
    static WheaRawDataFormatMax => 10
}
