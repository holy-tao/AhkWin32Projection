#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_SGL_DESC_SUBTYPE {
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
    static NvmeSglDescSubtypeAddress => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescSubtypeOffset => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescSubtypeTransportA => 10

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescSubtypeTransportB => 11

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescSubtypeTransportC => 12

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescSubtypeTransportD => 13

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescSubtypeTransportE => 14

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescSubtypeTransportF => 15
}
