#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ERROR_INJECTION_TYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ERROR_INJECTION_TYPE_RESERVED0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_CPU_CONTROLLER_HANG => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_NAND_HANG => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_PLP_DEFECT => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_LOGICAL_FW_ERROR => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_DRAM_CORRUPTION_CRITICAL => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_DRAM_CORRUPTION_NONCRITICAL => 6

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_NAND_CORRUPTION => 7

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_SRAM_CORRUPTION => 8

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_HW_MALFUNCTION => 9

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ERROR_INJECTION_TYPE_RESERVED1 => 10

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ERROR_INJECTION_TYPE_MAX => 65535
}
