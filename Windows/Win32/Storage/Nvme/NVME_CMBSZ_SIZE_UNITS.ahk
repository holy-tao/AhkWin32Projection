#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_cmbsz_size_units
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CMBSZ_SIZE_UNITS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CMBSZ_SIZE_UNITS_4KB => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CMBSZ_SIZE_UNITS_64KB => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CMBSZ_SIZE_UNITS_1MB => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CMBSZ_SIZE_UNITS_16MB => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CMBSZ_SIZE_UNITS_256MB => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CMBSZ_SIZE_UNITS_4GB => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CMBSZ_SIZE_UNITS_64GB => 6
}
