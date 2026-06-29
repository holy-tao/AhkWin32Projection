#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_L1_EXIT_LATENCY {
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
