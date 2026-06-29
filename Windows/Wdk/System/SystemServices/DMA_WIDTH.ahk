#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DMA_WIDTH {
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
    static Width8Bits => 0

    /**
     * @type {Integer (Int32)}
     */
    static Width16Bits => 1

    /**
     * @type {Integer (Int32)}
     */
    static Width32Bits => 2

    /**
     * @type {Integer (Int32)}
     */
    static Width64Bits => 3

    /**
     * @type {Integer (Int32)}
     */
    static WidthNoWrap => 4

    /**
     * @type {Integer (Int32)}
     */
    static MaximumDmaWidth => 5
}
