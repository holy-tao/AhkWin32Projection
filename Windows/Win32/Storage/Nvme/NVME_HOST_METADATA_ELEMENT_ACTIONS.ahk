#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_HOST_METADATA_ELEMENT_ACTIONS {
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
    static NVME_HOST_METADATA_ADD_REPLACE_ENTRY => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_HOST_METADATA_DELETE_ENTRY_MULTIPLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_HOST_METADATA_ADD_ENTRY_MULTIPLE => 2
}
