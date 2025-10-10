#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ACCESS_FREQUENCIES{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_TYPICAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_INFR_WRITE_INFR_READ => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_INFR_WRITE_FR_READ => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_FR_WRITE_INFR_READ => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_FR_WRITE_FR_READ => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_ONE_TIME_READ => 6

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_SPECULATIVE_READ => 7

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_FREQUENCY_WILL_BE_OVERWRITTEN => 8
}
