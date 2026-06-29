#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_DISCOVERY_INFO_ENTRY_FORMATS {
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
    static NVME_DISCOVERY_INFO_ENTRY_FORMAT_RESERVED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_DISCOVERY_INFO_ENTRY_FORMAT_BASIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_DISCOVERY_INFO_ENTRY_FORMAT_EXTENDED => 2
}
