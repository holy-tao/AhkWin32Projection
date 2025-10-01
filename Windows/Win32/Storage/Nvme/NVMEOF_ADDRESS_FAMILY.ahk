#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVMEOF_ADDRESS_FAMILY{

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
