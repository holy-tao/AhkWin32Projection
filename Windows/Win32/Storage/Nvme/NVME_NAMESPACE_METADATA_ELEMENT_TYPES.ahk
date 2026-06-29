#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_NAMESPACE_METADATA_ELEMENT_TYPES {
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
    static NVME_NAMESPACE_METADATA_OPERATING_SYSTEM_NAMESPACE_NAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NAMESPACE_METADATA_PREBOOT_NAMESPACE_NAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NAMESPACE_METADATA_OPERATING_SYSTEM_NAMESPACE_NAME_QUALIFIER_1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NAMESPACE_METADATA_OPERATING_SYSTEM_NAMESPACE_NAME_QUALIFIER_2 => 4
}
