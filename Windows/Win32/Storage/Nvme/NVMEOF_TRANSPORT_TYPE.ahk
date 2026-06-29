#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_TRANSPORT_TYPE {
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
    static NvmeofTransportUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofTransportRdma => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofTransportFC => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofTransportTcp => 3

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofTransportLoopback => 254

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofTransportMax => 255
}
