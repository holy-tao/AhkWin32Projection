#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that specify the size units that indicate the size of the Controller Memory Buffer.
 * @remarks
 * The size of the Controller Memory Buffer indicated in the **SZ** member of the [NVME_CONTROLLER_MEMORY_BUFFER_SIZE](ns-nvme-nvme_controller_memory_buffer_size.md) structure is expressed in multiples of the size units value specified in the **SZU** member (offset 3Ch).
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_cmbsz_size_units
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CMBSZ_SIZE_UNITS{

    /**
     * The buffer size is in units of 4 KB.
     * @type {Integer (Int32)}
     */
    static NVME_CMBSZ_SIZE_UNITS_4KB => 0

    /**
     * The buffer size is in units of 64 KB.
     * @type {Integer (Int32)}
     */
    static NVME_CMBSZ_SIZE_UNITS_64KB => 1

    /**
     * The buffer size is in units of 1 MB.
     * @type {Integer (Int32)}
     */
    static NVME_CMBSZ_SIZE_UNITS_1MB => 2

    /**
     * The buffer size is in units of 16 MB.
     * @type {Integer (Int32)}
     */
    static NVME_CMBSZ_SIZE_UNITS_16MB => 3

    /**
     * The buffer size is in units of 256 MB.
     * @type {Integer (Int32)}
     */
    static NVME_CMBSZ_SIZE_UNITS_256MB => 4

    /**
     * The buffer size is in units of 4 GB.
     * @type {Integer (Int32)}
     */
    static NVME_CMBSZ_SIZE_UNITS_4GB => 5

    /**
     * The buffer size is in units of 64 GB.
     * @type {Integer (Int32)}
     */
    static NVME_CMBSZ_SIZE_UNITS_64GB => 6
}
