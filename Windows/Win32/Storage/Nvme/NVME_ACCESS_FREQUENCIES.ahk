#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate the frequency of read and write access to a Logical Block Addressing (LBA) range.
 * @remarks
 * This enumeration is used to specify values in the **AccessFrequency** field of the [NVME_CDW13_READ_WRITE](ns-nvme-nvme_cdw13_read_write.md) structure and in the **AccessFrequency** field of the [NVME_CONTEXT_ATTRIBUTES](ns-nvme-nvme_context_attributes.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_access_frequencies
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ACCESS_FREQUENCIES extends Win32Enum{

    /**
     * No frequency information provided.
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_NONE => 0

    /**
     * The typical number of reads and writes expected for this LBA range.
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_TYPICAL => 1

    /**
     * Indicates infrequent writes and infrequent reads to the LBA range.
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_INFR_WRITE_INFR_READ => 2

    /**
     * Indicates infrequent writes and frequent reads to the LBA range.
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_INFR_WRITE_FR_READ => 3

    /**
     * Indicates frequent writes and infrequent reads to the LBA range.
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_FR_WRITE_INFR_READ => 4

    /**
     * Indicates frequent writes and frequent reads to the LBA range.
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_FR_WRITE_FR_READ => 5

    /**
     * A one time read. For example, the command is due to a virus scan, backup, file copy, or archive.
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_ONE_TIME_READ => 6

    /**
     * A speculative read. The command is part of a prefetch operation.
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_SPECULATIVE_READ => 7

    /**
     * The LBA range is going to be overwritten in the near future.
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_WILL_BE_OVERWRITTEN => 8
}
