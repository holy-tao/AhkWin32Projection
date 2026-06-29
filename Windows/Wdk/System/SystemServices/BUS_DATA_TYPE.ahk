#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct BUS_DATA_TYPE {
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
