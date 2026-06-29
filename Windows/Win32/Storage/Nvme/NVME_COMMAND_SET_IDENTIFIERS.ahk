#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_COMMAND_SET_IDENTIFIERS {
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
    static NVME_COMMAND_SET_NVM => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_COMMAND_SET_KEY_VALUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_COMMAND_SET_ZONED_NAMESPACE => 2
}
