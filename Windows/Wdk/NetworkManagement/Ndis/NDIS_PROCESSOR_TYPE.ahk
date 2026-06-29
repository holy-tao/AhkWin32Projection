#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_PROCESSOR_TYPE {
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
    static NdisProcessorX86 => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorMips => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorAlpha => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorPpc => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorAmd64 => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorIA64 => 5

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorArm => 6

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorArm64 => 7
}
