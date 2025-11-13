#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_EXTENDED_ATTR_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static NvmeExtAttrReserved0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeExtAttrHostId => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeExtAttrAdminLabelAscii => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvmeExtAttrAdminLabelUtf8 => 3

    /**
     * @type {Integer (Int32)}
     */
    static NvmeExtAttrReservedStart => 4

    /**
     * @type {Integer (Int32)}
     */
    static NvmeExtAttrReservedEnd => 65279

    /**
     * @type {Integer (Int32)}
     */
    static NvmeExtAttrVendorStart => 65280

    /**
     * @type {Integer (Int32)}
     */
    static NvmeExtAttrVendorEnd => 65535
}
