#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CONTROLLER_METADATA_ELEMENT_TYPES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CONTROLLER_METADATA_OPERATING_SYSTEM_CONTROLLER_NAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CONTROLLER_METADATA_OPERATING_SYSTEM_DRIVER_NAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CONTROLLER_METADATA_OPERATING_SYSTEM_DRIVER_VERSION => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CONTROLLER_METADATA_PREBOOT_CONTROLLER_NAME => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CONTROLLER_METADATA_PREBOOT_DRIVER_NAME => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CONTROLLER_METADATA_PREBOOT_DRIVER_VERSION => 6

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CONTROLLER_METADATA_SYSTEM_PROCESSOR_MODEL => 7

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CONTROLLER_METADATA_CHIPSET_DRIVER_NAME => 8

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CONTROLLER_METADATA_CHIPSET_DRIVER_VERSION => 9

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CONTROLLER_METADATA_OPERATING_SYSTEM_NAME_AND_BUILD => 10

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CONTROLLER_METADATA_SYSTEM_PRODUCT_NAME => 11

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CONTROLLER_METADATA_FIRMWARE_VERSION => 12

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CONTROLLER_METADATA_OPERATING_SYSTEM_DRIVER_FILENAME => 13

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CONTROLLER_METADATA_DISPLAY_DRIVER_NAME => 14

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CONTROLLER_METADATA_DISPLAY_DRIVER_VERSION => 15

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CONTROLLER_METADATA_HOST_DETERMINED_FAILURE_RECORD => 16
}
