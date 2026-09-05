#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_EXTENDED_ATTR_TYPE extends Win32Enum {

    /**
     * Native name: NvmeExtAttrReserved0
     * @type {Integer (Int32)}
     */
    static ExtAttrReserved0 => 0

    /**
     * Native name: NvmeExtAttrHostId
     * @type {Integer (Int32)}
     */
    static ExtAttrHostId => 1

    /**
     * Native name: NvmeExtAttrAdminLabelAscii
     * @type {Integer (Int32)}
     */
    static ExtAttrAdminLabelAscii => 2

    /**
     * Native name: NvmeExtAttrAdminLabelUtf8
     * @type {Integer (Int32)}
     */
    static ExtAttrAdminLabelUtf8 => 3

    /**
     * Native name: NvmeExtAttrReservedStart
     * @type {Integer (Int32)}
     */
    static ExtAttrReservedStart => 4

    /**
     * Native name: NvmeExtAttrReservedEnd
     * @type {Integer (Int32)}
     */
    static ExtAttrReservedEnd => 65279

    /**
     * Native name: NvmeExtAttrVendorStart
     * @type {Integer (Int32)}
     */
    static ExtAttrVendorStart => 65280

    /**
     * Native name: NvmeExtAttrVendorEnd
     * @type {Integer (Int32)}
     */
    static ExtAttrVendorEnd => 65535
}
