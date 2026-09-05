#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVMEOF_TRANSPORT_TYPE extends Win32Enum {

    /**
     * Native name: NvmeofTransportUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: NvmeofTransportRdma
     * @type {Integer (Int32)}
     */
    static Rdma => 1

    /**
     * Native name: NvmeofTransportFC
     * @type {Integer (Int32)}
     */
    static TransportFC => 2

    /**
     * Native name: NvmeofTransportTcp
     * @type {Integer (Int32)}
     */
    static Tcp => 3

    /**
     * Native name: NvmeofTransportLoopback
     * @type {Integer (Int32)}
     */
    static Loopback => 254

    /**
     * Native name: NvmeofTransportMax
     * @type {Integer (Int32)}
     */
    static Max => 255
}
