#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CONTROLLER_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NvmeCtrlNotReported => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeCtrlIO => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeCtrlDiscovery => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvmeCtrlAdmin => 3

    /**
     * @type {Integer (Int32)}
     */
    static NvmeCtrlReservedMin => 4

    /**
     * @type {Integer (Int32)}
     */
    static NvmeCtrlReservedMax => 255
}
