#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CSS_COMMAND_SETS {
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
    static NVME_CSS_NVM_COMMAND_SET => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CSS_ALL_SUPPORTED_IO_COMMAND_SET => 6

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CSS_ADMIN_COMMAND_SET_ONLY => 7
}
