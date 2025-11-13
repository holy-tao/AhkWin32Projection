#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DISC_CTRL_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static NvmeDiscCtrlTypeUnspecified => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeDiscCtrlTypeDDC => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeDiscCtrlTypeCDC => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvmeDiscCtrlTypeReserved1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static NvmeDiscCtrlTypeReservedMax => 255
}
