#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the type of Logical Block Addressing (LBA) range in an NVME_LBA_RANGET_TYPE_ENTRY structure.
 * @remarks
 * LBA range information ise used by a driver to determine if it may utilize a particular LBA range. The information is not exposed to higher level software.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_lba_range_types
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_LBA_RANGE_TYPES extends Win32Enum{

    /**
     * The reserved LBA range.
     * @type {Integer (Int32)}
     */
    static NVME_LBA_RANGE_TYPE_RESERVED => 0

    /**
     * The filesystem LBA range.
     * @type {Integer (Int32)}
     */
    static NVME_LBA_RANGE_TYPE_FILESYSTEM => 1

    /**
     * The RAID LBA range.
     * @type {Integer (Int32)}
     */
    static NVME_LBA_RANGE_TYPE_RAID => 2

    /**
     * The cache LBA range.
     * @type {Integer (Int32)}
     */
    static NVME_LBA_RANGE_TYPE_CACHE => 3

    /**
     * The page/swap file LBA range.
     * @type {Integer (Int32)}
     */
    static NVME_LBA_RANGE_TYPE_PAGE_SWAP_FILE => 4
}
