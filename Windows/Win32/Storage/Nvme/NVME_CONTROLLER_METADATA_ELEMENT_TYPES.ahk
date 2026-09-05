#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_CONTROLLER_METADATA_ELEMENT_TYPES extends Win32Enum {

    /**
     * Native name: NVME_CONTROLLER_METADATA_OPERATING_SYSTEM_CONTROLLER_NAME
     * @type {Integer (Int32)}
     */
    static OPERATING_SYSTEM_CONTROLLER_NAME => 1

    /**
     * Native name: NVME_CONTROLLER_METADATA_OPERATING_SYSTEM_DRIVER_NAME
     * @type {Integer (Int32)}
     */
    static OPERATING_SYSTEM_DRIVER_NAME => 2

    /**
     * Native name: NVME_CONTROLLER_METADATA_OPERATING_SYSTEM_DRIVER_VERSION
     * @type {Integer (Int32)}
     */
    static OPERATING_SYSTEM_DRIVER_VERSION => 3

    /**
     * Native name: NVME_CONTROLLER_METADATA_PREBOOT_CONTROLLER_NAME
     * @type {Integer (Int32)}
     */
    static PREBOOT_CONTROLLER_NAME => 4

    /**
     * Native name: NVME_CONTROLLER_METADATA_PREBOOT_DRIVER_NAME
     * @type {Integer (Int32)}
     */
    static PREBOOT_DRIVER_NAME => 5

    /**
     * Native name: NVME_CONTROLLER_METADATA_PREBOOT_DRIVER_VERSION
     * @type {Integer (Int32)}
     */
    static PREBOOT_DRIVER_VERSION => 6

    /**
     * Native name: NVME_CONTROLLER_METADATA_SYSTEM_PROCESSOR_MODEL
     * @type {Integer (Int32)}
     */
    static SYSTEM_PROCESSOR_MODEL => 7

    /**
     * Native name: NVME_CONTROLLER_METADATA_CHIPSET_DRIVER_NAME
     * @type {Integer (Int32)}
     */
    static CHIPSET_DRIVER_NAME => 8

    /**
     * Native name: NVME_CONTROLLER_METADATA_CHIPSET_DRIVER_VERSION
     * @type {Integer (Int32)}
     */
    static CHIPSET_DRIVER_VERSION => 9

    /**
     * Native name: NVME_CONTROLLER_METADATA_OPERATING_SYSTEM_NAME_AND_BUILD
     * @type {Integer (Int32)}
     */
    static OPERATING_SYSTEM_NAME_AND_BUILD => 10

    /**
     * Native name: NVME_CONTROLLER_METADATA_SYSTEM_PRODUCT_NAME
     * @type {Integer (Int32)}
     */
    static SYSTEM_PRODUCT_NAME => 11

    /**
     * Native name: NVME_CONTROLLER_METADATA_FIRMWARE_VERSION
     * @type {Integer (Int32)}
     */
    static FIRMWARE_VERSION => 12

    /**
     * Native name: NVME_CONTROLLER_METADATA_OPERATING_SYSTEM_DRIVER_FILENAME
     * @type {Integer (Int32)}
     */
    static OPERATING_SYSTEM_DRIVER_FILENAME => 13

    /**
     * Native name: NVME_CONTROLLER_METADATA_DISPLAY_DRIVER_NAME
     * @type {Integer (Int32)}
     */
    static DISPLAY_DRIVER_NAME => 14

    /**
     * Native name: NVME_CONTROLLER_METADATA_DISPLAY_DRIVER_VERSION
     * @type {Integer (Int32)}
     */
    static DISPLAY_DRIVER_VERSION => 15

    /**
     * Native name: NVME_CONTROLLER_METADATA_HOST_DETERMINED_FAILURE_RECORD
     * @type {Integer (Int32)}
     */
    static HOST_DETERMINED_FAILURE_RECORD => 16
}
