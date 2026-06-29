#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_L0s_EXIT_LATENCY {
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
