#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVMEOF_TRANSPORT_TYPE extends Win32Enum{

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
