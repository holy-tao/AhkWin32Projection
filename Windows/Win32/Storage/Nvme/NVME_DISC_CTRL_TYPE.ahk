#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_DISC_CTRL_TYPE extends Win32Enum {

    /**
     * Native name: NvmeDiscCtrlTypeUnspecified
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Native name: NvmeDiscCtrlTypeDDC
     * @type {Integer (Int32)}
     */
    static TypeDDC => 1

    /**
     * Native name: NvmeDiscCtrlTypeCDC
     * @type {Integer (Int32)}
     */
    static TypeCDC => 2

    /**
     * Native name: NvmeDiscCtrlTypeReserved1
     * @type {Integer (Int32)}
     */
    static Reserved1 => 3

    /**
     * Native name: NvmeDiscCtrlTypeReservedMax
     * @type {Integer (Int32)}
     */
    static ReservedMax => 255
}
