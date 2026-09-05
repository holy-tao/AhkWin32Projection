#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVMEOF_ADDRESS_FAMILY extends Win32Enum {

    /**
     * Native name: NvmeofAddressUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: NvmeofAddressIPv4
     * @type {Integer (Int32)}
     */
    static AddressIPv4 => 1

    /**
     * Native name: NvmeofAddressIPv6
     * @type {Integer (Int32)}
     */
    static AddressIPv6 => 2

    /**
     * Native name: NvmeofAddressIB
     * @type {Integer (Int32)}
     */
    static AddressIB => 3

    /**
     * Native name: NvmeofAddressFC
     * @type {Integer (Int32)}
     */
    static AddressFC => 4

    /**
     * Native name: NvmeofAddressLoopback
     * @type {Integer (Int32)}
     */
    static Loopback => 254

    /**
     * Native name: NvmeofAddressMax
     * @type {Integer (Int32)}
     */
    static Max => 255
}
