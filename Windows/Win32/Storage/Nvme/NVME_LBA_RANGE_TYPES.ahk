#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_LBA_RANGE_TYPES{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LBA_RANGE_TYPE_RESERVED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LBA_RANGE_TYPE_FILESYSTEM => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LBA_RANGE_TYPE_RAID => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LBA_RANGE_TYPE_CACHE => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LBA_RANGE_TYPE_PAGE_SWAP_FILE => 4
}
