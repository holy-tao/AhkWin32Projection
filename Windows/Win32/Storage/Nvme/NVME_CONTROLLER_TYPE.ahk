#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_CONTROLLER_TYPE extends Win32Enum {

    /**
     * Native name: NvmeCtrlNotReported
     * @type {Integer (Int32)}
     */
    static CtrlNotReported => 0

    /**
     * Native name: NvmeCtrlIO
     * @type {Integer (Int32)}
     */
    static CtrlIO => 1

    /**
     * Native name: NvmeCtrlDiscovery
     * @type {Integer (Int32)}
     */
    static CtrlDiscovery => 2

    /**
     * Native name: NvmeCtrlAdmin
     * @type {Integer (Int32)}
     */
    static CtrlAdmin => 3

    /**
     * Native name: NvmeCtrlReservedMin
     * @type {Integer (Int32)}
     */
    static CtrlReservedMin => 4

    /**
     * Native name: NvmeCtrlReservedMax
     * @type {Integer (Int32)}
     */
    static CtrlReservedMax => 255
}
