#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DMA_SPEED {
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
    static Compatible => 0

    /**
     * @type {Integer (Int32)}
     */
    static TypeA => 1

    /**
     * @type {Integer (Int32)}
     */
    static TypeB => 2

    /**
     * @type {Integer (Int32)}
     */
    static TypeC => 3

    /**
     * @type {Integer (Int32)}
     */
    static TypeF => 4

    /**
     * @type {Integer (Int32)}
     */
    static MaximumDmaSpeed => 5
}
