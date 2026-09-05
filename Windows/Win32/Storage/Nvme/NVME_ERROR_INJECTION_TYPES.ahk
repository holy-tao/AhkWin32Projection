#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_ERROR_INJECTION_TYPES extends Win32Enum {

    /**
     * Native name: NVME_ERROR_INJECTION_TYPE_RESERVED0
     * @type {Integer (Int32)}
     */
    static TYPE_RESERVED0 => 0

    /**
     * Native name: NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_CPU_CONTROLLER_HANG
     * @type {Integer (Int32)}
     */
    static TYPE_DEVICE_PANIC_CPU_CONTROLLER_HANG => 1

    /**
     * Native name: NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_NAND_HANG
     * @type {Integer (Int32)}
     */
    static TYPE_DEVICE_PANIC_NAND_HANG => 2

    /**
     * Native name: NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_PLP_DEFECT
     * @type {Integer (Int32)}
     */
    static TYPE_DEVICE_PANIC_PLP_DEFECT => 3

    /**
     * Native name: NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_LOGICAL_FW_ERROR
     * @type {Integer (Int32)}
     */
    static TYPE_DEVICE_PANIC_LOGICAL_FW_ERROR => 4

    /**
     * Native name: NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_DRAM_CORRUPTION_CRITICAL
     * @type {Integer (Int32)}
     */
    static TYPE_DEVICE_PANIC_DRAM_CORRUPTION_CRITICAL => 5

    /**
     * Native name: NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_DRAM_CORRUPTION_NONCRITICAL
     * @type {Integer (Int32)}
     */
    static TYPE_DEVICE_PANIC_DRAM_CORRUPTION_NONCRITICAL => 6

    /**
     * Native name: NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_NAND_CORRUPTION
     * @type {Integer (Int32)}
     */
    static TYPE_DEVICE_PANIC_NAND_CORRUPTION => 7

    /**
     * Native name: NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_SRAM_CORRUPTION
     * @type {Integer (Int32)}
     */
    static TYPE_DEVICE_PANIC_SRAM_CORRUPTION => 8

    /**
     * Native name: NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_HW_MALFUNCTION
     * @type {Integer (Int32)}
     */
    static TYPE_DEVICE_PANIC_HW_MALFUNCTION => 9

    /**
     * Native name: NVME_ERROR_INJECTION_TYPE_RESERVED1
     * @type {Integer (Int32)}
     */
    static TYPE_RESERVED1 => 10

    /**
     * Native name: NVME_ERROR_INJECTION_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static TYPE_MAX => 65535
}
