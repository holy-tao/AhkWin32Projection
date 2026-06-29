#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_ADDRESS_FAMILY {
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
    static NvmeofAddressUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAddressIPv4 => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAddressIPv6 => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAddressIB => 3

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAddressFC => 4

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAddressLoopback => 254

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAddressMax => 255
}
